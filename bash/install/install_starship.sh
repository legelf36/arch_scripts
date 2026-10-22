#!/bin/bash

sudo pacman -S starship

# Install:
mkdir -p ~/.config/omarchy/hooks/theme-set.d
cp ~/.scripts/bash/utils/50-starship-sync.sh ~/.config/omarchy/hooks/theme-set.d/
chmod +x ~/.config/omarchy/hooks/theme-set.d/50-starship-sync.sh

# Run once by hand to sync immediately:
#   ~/.config/omarchy/hooks/theme-set.d/50-starship-sync.sh

# latest config file is located at ~/.scripts/config/
