#!/bin/bash

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex() {
  if [ -f "$1" ]; then
    case $1 in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *.deb) ar x "$1" ;;
    *.tar.xz) tar xf "$1" ;;
    *.tar.zst) tar xf "$1" ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
export -f ex

# function to update "~/.scripts" directory to git hub
# usage: ug
ug() {
  ~/.scripts/bash/utils/scr-git-update.sh
}
export -f ug

# function to copy configuration files to scripts directory
# usage: copydots
dots() {
  ~/.scripts/bash/backup/dotscrbak.sh
  local rc=$?
  local log
  log=$(command ls -t ~/.local/state/dotscrbak/ | head -1)
  if [ "$rc" -eq 0 ]; then
    echo "Backup finished."
  else
    echo "Backup stopped early (exit $rc) - check the log."
  fi
  echo "Log: ~/.local/state/dotscrbak/$log"
}
export -f dots

# function to start yazi and stay in current directory after yazi exits
# usage: y
y() {
# cat ~/.cache/wal/sequences # Pywal colors
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
export -f y

# function to call renumber.sh for renaming all files in the current directory
renum() {
  . ~/.scripts/bash/utils/renumber.sh $PWD
}
export -f renum

# same as above but "new" prefix
renumnew() {
  . ~/.scripts/bash/utils/renumbernew.sh $PWD
}
export -f renumnew

