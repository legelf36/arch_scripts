#!/bin/bash

# Programs required for compilation and installation of 'yay'.
sudo pacman -S base-devel git --needed

# Change to the 'projects' directory and clone the git repo for 'yay'.
cd ~/projects
sudo git clone https://aur.archlinux.org/yay.git

# Change ownership of directory to your username.
sudo chown -R kim:kim ./yay

# Move to the directory and compile.
cd yay
makepkg -si
