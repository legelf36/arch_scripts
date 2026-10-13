#!/usr/bin/env python3
"""
Find duplicate / near-duplicate images in a directory tree.
Keeps the best copy (highest resolution, then largest file size) and moves
the rest to a separate folder, keeping their sub-folder structure.

Default is a DRY RUN - nothing is touched unless you pass --move.

Requires Pillow:   sudo pacman -S python-pillow    (or: pip install pillow)

Examples:
  python find_dupe_images.py ~/Pictures                  # dry run
  python find_dupe_images.py ~/Pictures --move           # really move them
  python find_dupe_images.py ~/Pictures --threshold 0    # exact visual matches only
"""

import argparse
import shutil
import sys
from pathlib import Path

from PIL import Image, ImageOps

EXTS = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tif", ".tiff", ".webp"}


def dhash(img, size=8):
    """64-bit 'difference hash': survives resizing, recompression, small edits."""
    img = ImageOps.exif_transpose(img).convert("L").resize((size + 1, size), Image.LANCZOS)
    px = list(img.getdata())
    bits = 0
    for row in range(size):
        for col in range(size):
            left = px[row * (size + 1) + col]
            right = px[row * (size + 1) + col + 1]
            bits = (bits << 1) | (1 if left > right else 0)
    return bits


def scan(root, skip_dir):
    """Return list of dicts: path, hash, pixels, bytes."""
    items = []
    files = [p for p in root.rglob("*")
             if p.is_file() and p.suffix.lower() in EXTS and skip_dir not in p.parents]
    total = len(files)
    for i, p in enumerate(files, 1):
        print(f"\rHashing {i}/{total}", end="", file=sys.stderr, flush=True)
        try:
            with Image.open(p) as img:
                w, h = img.size
                items.append({"path": p, "hash": dhash(img),
                              "pixels": w * h, "dims": (w, h),
                              "bytes": p.stat().st_size})
        except Exception as e:
            print(f"\nSkipping {p}: {e}", file=sys.stderr)
    print(file=sys.stderr)
    return items


def group_duplicates(items, threshold):
    """Union-find grouping of images whose hashes are within `threshold` bits."""
    parent = list(range(len(items)))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    for i in range(len(items)):
        hi = items[i]["hash"]
        for j in range(i + 1, len(items)):
            if bin(hi ^ items[j]["hash"]).count("1") <= threshold:
                parent[find(j)] = find(i)

    groups = {}
    for i in range(len(items)):
        groups.setdefault(find(i), []).append(items[i])
    return [g for g in groups.values() if len(g) > 1]


def unique_dest(dest):
    """Avoid overwriting if a file with that name already exists."""
    if not dest.exists():
        return dest
    n = 1
    while True:
        cand = dest.with_name(f"{dest.stem}_{n}{dest.suffix}")
        if not cand.exists():
            return cand
        n += 1


def main():
    ap = argparse.ArgumentParser(description="Find and move duplicate images.")
    ap.add_argument("directory", help="Folder to search (includes sub-folders)")
    ap.add_argument("--dupes-dir", help="Where duplicates go (default: <directory>/_duplicates)")
    ap.add_argument("--threshold", type=int, default=4,
                    help="Max differing bits out of 64 to count as duplicate "
                         "(0 = identical-looking, 4 = default, ~10 = loose)")
    ap.add_argument("--move", action="store_true",
                    help="Actually move files. Without this it's a dry run.")
    args = ap.parse_args()

    root = Path(args.directory).expanduser().resolve()
    if not root.is_dir():
        sys.exit(f"Not a directory: {root}")
    dupes_dir = Path(args.dupes_dir).expanduser().resolve() if args.dupes_dir else root / "_duplicates"

    items = scan(root, dupes_dir)
    print(f"Scanned {len(items)} images.")
    groups = group_duplicates(items, args.threshold)

    if not groups:
        print("No duplicates found.")
        return

    moved = 0
    saved_bytes = 0
    for g in sorted(groups, key=lambda g: str(g[0]["path"])):
        # best = most pixels, then biggest file
        g.sort(key=lambda d: (d["pixels"], d["bytes"]), reverse=True)
        keep, extras = g[0], g[1:]
        print(f"\nKEEP  {keep['path']}  ({keep['dims'][0]}x{keep['dims'][1]}, {keep['bytes']//1024} KB)")
        for d in extras:
            try:
                rel = d["path"].relative_to(root)
            except ValueError:
                rel = Path(d["path"].name)
            dest = unique_dest(dupes_dir / rel)
            print(f"  DUP {d['path']}  ({d['dims'][0]}x{d['dims'][1]}, {d['bytes']//1024} KB)")
            if args.move:
                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.move(str(d["path"]), str(dest))
            moved += 1
            saved_bytes += d["bytes"]

    verb = "Moved" if args.move else "Would move"
    print(f"\n{verb} {moved} duplicate files in {len(groups)} groups "
          f"({saved_bytes / 1024 / 1024:.1f} MB) to {dupes_dir}")
    if not args.move:
        print("This was a dry run. Re-run with --move to do it for real.")


if __name__ == "__main__":
    main()
