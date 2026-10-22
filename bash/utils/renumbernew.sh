#!/usr/bin/env bash
# Usage: ./renumber.sh /path/to/directory
set -euo pipefail

prefix="new_"

dir="${1:?Usage: $0 /path/to/directory}"
[[ -d "$dir" ]] || { echo "Not a directory: $dir" >&2; exit 1; }

shopt -s nullglob nocaseglob            # no match = empty list; match .jpg/.JPG alike

# Collect regular files only (skips any sub-folder that happens to end in .jpg)
files=()
for f in "$dir"/*.jpg; do
    [[ -f "$f" ]] && files+=("$f")
done

(( ${#files[@]} )) || { echo "No .jpg files found in $dir"; exit 0; }

# Pass 1: move to temporary names so new names can't collide with existing ones
tmp=()
i=0
for f in "${files[@]}"; do
    i=$((i + 1))
    t="$dir/.tmp_rename_$i.${f##*.}"
    mv -- "$f" "$t"
    tmp+=("$t")
done

# Pass 2: give each file its final sequential name
i=0
for t in "${tmp[@]}"; do
    i=$((i + 1))
    mv -- "$t" "$(printf '%s/%s%05d.%s' "$dir" "$prefix" "$i" "${t##*.}")"
done

echo "Renamed $i file(s) in $dir"
