#!/bin/bash

cp -f ~/.bashrc ~/.scripts/.config/
cp -f ~/.bash_aliases ~/.scripts/.config/
cp -f ~/.vimrc ~/.scripts/.config/
cp -rf ~/.config/ranger/ ~/.scripts/.config/
cp -f ~/.config/conky/*Redux* ~/.scripts/.config/conky/
cp -rf ~/.config/fastfetch/ ~/.scripts/.config/
cp -rf ~/.config/picom/ ~/.scripts/.config/
cp -rf ~/.config/polybar/ ~/.scripts/.config/
cp -rf ~/.config/rofi/ ~/.scripts/.config/
cp -rf ~/.config/terminator/ ~/.scripts/.config/
cp -rf ~/.config/thefuck/ ~/.scripts/.config/
cp -rf ~/.config/i3/config/ ~/.scripts/.config/
cp -rf ~/.config/i3blocks/ ~/.scripts/.config/
cp -rf ~/.config/i3status/ ~/.scripts/.config/

git add -A
git commit -m "update"
git push -u

