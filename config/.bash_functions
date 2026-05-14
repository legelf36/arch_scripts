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

# function to copy configuration files to scripts directory
# usage: copydots
copydots() {
  /home/kim/.scripts/dotscrbakup.sh
}
export -f copydots

# function to simplify ssh login after key has been sent
# usage: sshin <last 3 digits in IP>
sshin() {
  ssh -t kim@192.168.0."$1"
  return
}
export -f sshin

# function to restart waybar
# usage: rw
rw() {
  killall -SIGUSR2 waybar
}
export -f rw

# Update PyWal with new image to create colors
# usage: pwal /path/to/image.png
mywal() {
  wal -i "$1" --cols16
. ~/.config/update_starship.sh # > /tmp/starship-palette.tmp
    # Replace palette section in starship.toml
    awk '/^[palettes.pywal]$/,/^color15 =/{next} // {print}' ~/.config/starship.toml > /tmp/starship.toml
    cat /tmp/wal_palette.toml >> /tmp/starship.toml
    mv /tmp/starship.toml ~/.config/starship.toml
}
export -f mywal

# function to start yazi and stay in current directory after yazi exits
y() {
	cat ~/.cache/wal/sequences
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
export -f y
