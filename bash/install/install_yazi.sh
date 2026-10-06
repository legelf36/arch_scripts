#!/bin/bash
# How to install Yazi in Omarchy 4.0 and set to automatically update colors with
# theme selection.

# Install yazi with pacman.
sudo pacman -S yazi

# Run the Omarchy-Yazi theme installer.
curl -fsSL https://raw.githubusercontent.com/joaofelipegalvao/omarchy-yazi/main/scripts/omarchy-yazi-install.sh | bash   

# Install the sshfs plugin for yazi
sudo pacman -S sshfs
ya pkg add uhs-robert/sshfs

# Add this line to ~/.config/yazi/init.lua
# require("sshfs"):setup()

