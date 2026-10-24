#!/bin/bash
# dotscrbak.sh - gather dotfiles, push them to GitHub, rsync everything to the backup drive.

set -u

# Send all output (normal + errors) to a dated log file instead of the terminal.
# To watch it scroll AND keep the log, replace the last line below with:
#   exec > >(tee -a "$LOG") 2>&1
LOGDIR="$HOME/.local/state/dotscrbak"
mkdir -p "$LOGDIR"
LOG="$LOGDIR/backup-$(date +%Y-%m-%d_%H%M).log"
exec > >(tee -a "$LOG") 2>&1

COPYLOC="$HOME/.scripts/config/"
MOUNT="$HOME/wd2tb"
BACKLOC="$MOUNT/Backups/"

mkdir -p "$COPYLOC"

# ---------------------------------------------------------------------------
# 1. Gather dotfiles into ~/.scripts/config
# ---------------------------------------------------------------------------
files=(
  "$HOME/.bashrc"
  "$HOME/.bash_aliases"
  "$HOME/.bash_functions"
  "$HOME/.config/starship.toml"
)

# Directories under ~/.config
dirs=(
  autostart ckb-next hypr kate nvim vlc ghostty omarchy
  aether mpv yazi GIMP FreeCAD cursor strawberry git
)

for f in "${files[@]}"; do
  cp -fv "$f" "$COPYLOC"
done

for d in "${dirs[@]}"; do
  cp -rfv "$HOME/.config/$d" "$COPYLOC"
done

# Package lists, so a fresh install can be rebuilt with:
#   sudo pacman -S --needed - < pkglist-native.txt
pacman -Qqen > "${COPYLOC}pkglist-native.txt"   # official repo packages
pacman -Qqem > "${COPYLOC}pkglist-aur.txt"      # AUR / foreign packages

# ---------------------------------------------------------------------------
# 2. Update the GitHub repo (keep this repo PRIVATE, see notes)
# ---------------------------------------------------------------------------
pushd "$HOME/.scripts" > /dev/null || exit 1
git add -A
git commit -m "scripted update to scripts $(date +%Y-%m-%d_%H:%M)"
git push
popd > /dev/null

# ---------------------------------------------------------------------------
# 3. Check the backup drive is really mounted (not just that the folder exists)
# ---------------------------------------------------------------------------
if ! mountpoint -q "$MOUNT"; then
  echo "Backup drive not mounted. No backup!"
  exit 1
fi

# ---------------------------------------------------------------------------
# 4. rsync to the backup drive
# ---------------------------------------------------------------------------
rsync_options=(
  -a --itemize-changes --mkpath
  # Uncomment to skip bulky cache folders inside ~/.config:
  # --exclude='Cache' --exclude='Code Cache' --exclude='GPUCache'
)

sources=(
  .scripts
  .config
  .repos
  Documents
  Downloads
  Pictures
  Videos
  # Cad
)

for s in "${sources[@]}"; do
  rsync "${rsync_options[@]}" "$HOME/$s" "$BACKLOC"
done

# ---------------------------------------------------------------------------
# 5. Delete logs older than 30 days
# ---------------------------------------------------------------------------
find "$LOGDIR" -name 'backup-*.log' -mtime +30 -delete
