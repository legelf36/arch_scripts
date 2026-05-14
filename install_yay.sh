#!/bin/bash

# Programs required for compilation and installation of 'yay'.
sudo pacman -S base-devel git 

# Change to the 'projects' directory and clone the git repo for 'yay'.
[ !-d "$HOME/.repos" ] && mkdir -p $HOME/.repos
cd $HOME/.repos
git clone https://aur.archlinux.org/yay.git

# Move to the directory and compile.
cd yay
makepkg -si
