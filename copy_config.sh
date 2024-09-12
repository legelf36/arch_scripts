#!/bin/bash

cp -fv ~/.bashrc ~/.scripts/.config/
cp -fv ~/.bash_aliases ~/.scripts/.config/
cp -fv ~/.vimrc ~/.scripts/.config/
cp -fv ~/.config/starship.toml ~/.scripts/.config/
cp -rfv ~/.config/ranger/ ~/.scripts/.config/
cp -fv ~/.config/conky/*Redux* ~/.scripts/.config/conky/
cp -rfv ~/.config/fastfetch/ ~/.scripts/.config/
cp -rfv ~/.config/picom/ ~/.scripts/.config/
cp -rfv ~/.config/polybar/ ~/.scripts/.config/
cp -rfv ~/.config/rofi/ ~/.scripts/.config/
cp -rfv ~/.config/terminator/ ~/.scripts/.config/
cp -rfv ~/.config/thefuck/ ~/.scripts/.config/
cp -fv ~/.config/i3/config ~/.scripts/.config/i3/config
cp -rfv ~/.config/i3blocks/ ~/.scripts/.config/
cp -rfv ~/.config/i3status/ ~/.scripts/.config/

git add -A
git commit -m "update config"
git push -u

