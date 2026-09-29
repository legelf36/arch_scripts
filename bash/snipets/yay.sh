#!/bin/bash

# yay does not require sudo. yay will ask for it if required.

# clone yay repository
git clone https://aur.archlinux.org/yay.git

# Make the yay package in the cloned yay directory
makepkg -si

# manual for yay
man yay

# Clean cache
yay -Scc

# Install a package using yay
yay -S <package>

# Search for package
yay -Ss <package>

# Update packages (also updates the AUR packages)
yay -Syu

# Update pakages without updating the AUR packages
pacman -Syu

# Update only AUR pakages
yay -Sua
 
# Pakages requiring updates
yay -Pu

# Show ten largest packages
yay -Ps

# Cleanup old dependencies
yay -Yc

# Remove an installed package and both its dependencies and configuration files
yay -Rns 
