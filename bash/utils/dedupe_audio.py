#!/usr/bin/env python3
"""
dedupe_audio.py

Scans a source directory of audio files, groups duplicates by AUDIO CONTENT
(using Chromaprint acoustic fingerprints, not filenames), and copies a
deduplicated set to a destination directory/drive.

Keep rule (per duplicate group):
  1. If the group contains any .flac or .ogg files, keep ALL of those and
     drop every other format in that group.
  2. Otherwise, keep only the single highest-bitrate file in the group.

Built for large collections (tens of thousands of files):
  - Fingerprinting is parallelized across CPU cores.
  - Fingerprints/bitrates are cached to disk, keyed by file path + size +
    mtime, so an interrupted run can resume without redoing finished work.
  - Duplicate grouping sorts by duration and only compares nearby files,
    instead of comparing every file against every other file.

Requires on PATH:
  - ffprobe  (part of ffmpeg)
  - fpcalc   (part of chromaprint)

Install:
  macOS:          brew install ffmpeg chromaprint
  Ubuntu/Debian:  sudo apt install ffmpeg libchromaprint-tools
  Windows:        choco install ffmpeg chromaprint
                  (or download both and add their folders to PATH)

Usage:
  python dedupe_audio.py "/path/to/source" "/path/to/destination" --dry-run
  python dedupe_audio.py "/path/to/source" "/path/to/destination"

Always run with --dry-run first. If interrupted (Ctrl+C, crash, sleep),
just re-run the same command — cached files are skipped automatically.
"""

import argparse
import json
import os
import shutil
import subprocess
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path

AUDIO_EXTENSIONS = {".flac", ".ogg", ".mp3", ".m4a", ".aac", ".wma", ".wav", ".opus", ".alac"}
PREFERRED_EXTENSIONS = {".flac", ".ogg"}
CACHE_SAVE_EVERY = 200


def find_audio_files(root: Path):
    for dirpath, _, filenames in os.walk(root):
        for name in filenames:
            ext = Path(name).suffix.lower()
            if ext in AUDIO_EXTENSIONS:
                yield Path(dirpath) / name


def load_cache(cache_path: Path) -> dict:
    if cache_path.exists():
        try:
            with open(cache_path, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception as e:
            print(f"[warn] could not read cache file, starting fresh: {e}", file=sys.stderr)
    return {}


def save_cache(cache_path: Path, cache: dict):
    tmp = cache_path.with_suffix(cache_path.suffix + ".tmp")
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(cache, f)
    tmp.replace(cache_path)


def cache_key(path: Path, st: os.stat_result) -> tuple:
    return (str(path), st.st_size, int(st.st_mtime))


def fingerprint_worker(path_str: str):
    """
    Runs in a worker process. Returns a dict with duration/fingerprint/bitrate,
    or an 'error' field on failure. Kept as a plain function (not a closure) so
    it can be pickled for ProcessPoolExecutor.
    """
    path = Path(path_str)
    result = {"path": path_str, "duration": None, "fingerprint": [], "bitrate": 0, "error": None}
    try:
        out = subprocess.run(
            ["fpcalc", "-raw", "-json", path_str],
            capture_output=True, text=True, timeout=120, check=True
        )
        data = json.loads(out.stdout)
        result["duration"] = data.get("duration")
        fp_field = data.get("fingerprint", "")
        if isinstance(fp_field, list):
            result["fingerprint"] = [int(x) for x in fp_field]
        elif isinstance(fp_field, str) and fp_field:
            result["fingerprint"] = [int(x) for x in fp_field.split(",")]
    except Exception as e:
        result["error"] = f"fpcalc failed: {e}"

    try:
        out = subprocess.run(
            ["ffprobe", "-v", "error", "-select_streams", "a:0",
             "-show_entries", "stream=bit_rate", "-of", "json", path_str],
            capture_output=True, text=True, timeout=60, check=True
        )
        data = json.loads(out.stdout)
        streams = data.get("streams", [])
        if streams and streams[0].get("bit_rate"):
            result["bitrate"] = int(streams[0]["bit_rate"])
    except Exception:
        pass  # bitrate defaults to 0; not fatal on its own

    return result


def fingerprint_similarity(a, b) -> float:
    """Hamming-distance-based similarity between two raw chromaprint integer arrays (0..1)."""
    n = min(len(a), len(b))
    if n == 0:
        return 0.0
    close_matches = sum(1 for i in range(n) if bin(a[i] ^ b[i]).count("1") <= 4)
    return close_matches / n


def group_duplicates(files_info, threshold=0.95, duration_tolerance=2.0):
    """
    Sorts by duration and only compares each file against nearby-duration
    files, breaking early once the gap exceeds duration_tolerance. Files
    with unknown duration (fingerprinting failed) are each kept as their
    own singleton group so they're never silently dropped.
    """
    known = [f for f in files_info if f["duration"] is not None]
    unknown = [f for f in files_info if f["duration"] is None]

    known.sort(key=lambda f: f["duration"])
    n = len(known)
    used = [False] * n
    groups = []

    for i in range(n):
        if used[i]:
            continue
        group = [known[i]]
        used[i] = True
        j = i + 1
        while j < n and known[j]["duration"] - known[i]["duration"] <= duration_tolerance:
            if not used[j]:
                sim = fingerprint_similarity(known[i]["fingerprint"], known[j]["fingerprint"])
                if sim >= threshold:
                    group.append(known[j])
                    used[j] = True
            j += 1
        groups.append(group)

    for f in unknown:
        groups.append([f])

    return groups


def choose_keepers(group):
    preferred = [f for f in group if f["ext"] in PREFERRED_EXTENSIONS]
    if preferred:
        return preferred
    best = max(group, key=lambda f: f["bitrate"])
    return [best]


def main():
    parser = argparse.ArgumentParser(description="Deduplicate a large audio collection by content, not filename.")
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    parser.add_argument("--threshold", type=float, default=0.95,
                         help="Fingerprint similarity threshold to call two files duplicates (default 0.95)")
    parser.add_argument("--dry-run", action="store_true", help="Only report what would happen; copy nothing.")
    parser.add_argument("--workers", type=int, default=os.cpu_count() or 4,
                         help="Parallel fingerprinting processes (default: number of CPU cores)")
    parser.add_argument("--cache", type=Path, default=Path("audio_dedupe_cache.json"),
                         help="Cache file for resuming interrupted runs (default: ./audio_dedupe_cache.json)")
    args = parser.parse_args()

    for tool in ("fpcalc", "ffprobe"):
        if shutil.which(tool) is None:
            sys.exit(f"Required tool '{tool}' not found on PATH. See the install instructions in this script's header.")

    print("Scanning for audio files...")
    all_files = list(find_audio_files(args.source))
    print(f"Found {len(all_files)} audio files.")

    cache = load_cache(args.cache)
    print(f"Loaded cache with {len(cache)} previously fingerprinted files.")

    files_info = []
    to_process = []
    for path in all_files:
        try:
            st = path.stat()
        except OSError as e:
            print(f"  [warn] could not stat {path}: {e}", file=sys.stderr)
            continue
        key = f"{path}|{st.st_size}|{int(st.st_mtime)}"
        cached = cache.get(key)
        if cached:
            files_info.append({
                "path": path,
                "duration": cached["duration"],
                "fingerprint": cached["fingerprint"],
                "ext": path.suffix.lower(),
                "bitrate": cached["bitrate"],
            })
        else:
            to_process.append((path, key))

    print(f"{len(files_info)} files reused from cache, {len(to_process)} need fingerprinting "
          f"(using {args.workers} parallel workers)...")

    completed = 0
    try:
        with ProcessPoolExecutor(max_workers=args.workers) as executor:
            future_to_item = {
                executor.submit(fingerprint_worker, str(path)): (path, key)
                for path, key in to_process
            }
            for future in as_completed(future_to_item):
                path, key = future_to_item[future]
                try:
                    result = future.result()
                except Exception as e:
                    print(f"  [warn] worker crashed on {path}: {e}", file=sys.stderr)
                    continue

                if result["error"]:
                    print(f"  [warn] {path}: {result['error']}", file=sys.stderr)

                cache[key] = {
                    "duration": result["duration"],
                    "fingerprint": result["fingerprint"],
                    "bitrate": result["bitrate"],
                }
                files_info.append({
                    "path": path,
                    "duration": result["duration"],
                    "fingerprint": result["fingerprint"],
                    "ext": path.suffix.lower(),
                    "bitrate": result["bitrate"],
                })

                completed += 1
                if completed % CACHE_SAVE_EVERY == 0 or completed == len(to_process):
                    save_cache(args.cache, cache)
                    print(f"  fingerprinted {completed}/{len(to_process)} (cache saved)")
    except KeyboardInterrupt:
        print("\nInterrupted — saving cache before exiting. Re-run the same command to resume.")
        save_cache(args.cache, cache)
        sys.exit(1)

    save_cache(args.cache, cache)

    print("Grouping duplicates...")
    groups = group_duplicates(files_info, threshold=args.threshold)

    dup_groups = [g for g in groups if len(g) > 1]
    total_dupes = sum(len(g) - len(choose_keepers(g)) for g in dup_groups)
    print(f"Found {len(dup_groups)} duplicate groups, {total_dupes} redundant files out of {len(files_info)} total.")

    kept, skipped = [], []
    for group in groups:
        keepers = choose_keepers(group)
        kept.extend(keepers)
        for f in group:
            if f not in keepers:
                skipped.append(f)

    print(f"Will copy {len(kept)} files, skip {len(skipped)} duplicates.")

    if args.dry_run:
        print("\n--- DRY RUN: duplicate files that would be skipped ---")
        for f in skipped:
            print(f"  SKIP: {f['path']}")
        return

    for f in kept:
        rel = f["path"].relative_to(args.source)
        dest_path = args.destination / rel
        dest_path.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(f["path"], dest_path)

    print("Done.")
    log_path = args.destination / "dedupe_log.txt"
    with open(log_path, "w", encoding="utf-8") as f:
        f.write("KEPT:\n")
        for k in kept:
            f.write(f"  {k['path']}\n")
        f.write("\nSKIPPED (duplicates):\n")
        for s in skipped:
            f.write(f"  {s['path']}\n")
    print(f"Log written to {log_path}")


if __name__ == "__main__":
    main()
