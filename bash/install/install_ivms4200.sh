#!/usr/bin/env bash

# Extract iVMS4200-linux.gz to ~/.local/opt/
# This will create a "Linux" directory there with the app files.
# Below are the 32-bit libraires required.
sudo pacman -S lib32-glibc lib32-gcc-libs lib32-libx11 lib32-libxext lib32-util-linux lib32-mesa lib32-glu
cd ~/.local/opt/iVMS-4200               # change to app directory.
# Run app with library path set and send errors and messages to  file.
setsid env LD_LIBRARY_PATH=./PlugIns ./iVMS-4200 > /tmp/ivms.log 2>&1 &

