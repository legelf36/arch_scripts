#!/bin/bash

cp -fv ~/.bashrc ~/.scripts/.config/
cp -fv ~/.bash_aliases ~/.scripts/.config/
cp -fv ~/.bash_functions ~/.scripts/.config/
cp -fv ~/.vimrc ~/.scripts/.config/
cp -fv ~/.config/starship.toml ~/.scripts/.config/
# copy directories.
cp -rfv ~/.config/ranger/ ~/.scripts/.config/
cp -rfv ~/.config/conky/aamine* ~/.scripts/.config/conky/
cp -rfv ~/.config/picom/ ~/.scripts/.config/
cp -rfv ~/.config/polybar/ ~/.scripts/.config/
cp -rfv ~/.config/rofi/ ~/.scripts/.config/
cp -rfv ~/.config/terminator/ ~/.scripts/.config/
cp -rfv ~/.config/thefuck/ ~/.scripts/.config/
cp -rfv ~/.config/alacritty/ ~/.scripts/.config/
cp -rfv ~/.config/autostart/ ~/.scripts/.config/
cp -rfv ~/.config/ckb-next/ ~/.scripts/.config/
cp -rfv ~/.config/hypr/ ~/.scripts/.config/
cp -rfv ~/.config/kate/ ~/.scripts/.config/
cp -rfv ~/.config/neofetch/ ~/.scripts/.config/
cp -rfv ~/.config/nvim/ ~/.scripts/.config/
cp -rfv ~/.config/superfile/ ~/.scripts/.config/
cp -rfv ~/.config/thefuck/ ~/.scripts/.config/
cp -rfv ~/.config/vlc/ ~/.scripts/.config/
cp -rfv ~/.config/kitty/ ~/.scripts/.config/

git add -A
git commit -m "update config"
git push -u
