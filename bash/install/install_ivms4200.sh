#!/usr/bin/env bash
sudo pacman -S lib32-glibc lib32-gcc-libs lib32-libx11 lib32-libxext lib32-util-linux lib32-mesa lib32-glu
y
cd ~
cd Downloads/Linux/
lla
LD_LIBRARY_PATH=./PlugIns ./iVMS-4200
setsid env LD_LIBRARY_PATH=./PlugIns ./iVMS-4200 > /tmp/ivms.log 2>&1 &

