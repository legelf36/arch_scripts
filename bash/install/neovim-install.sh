#!/bin/bash

sudo pacman -S nvim npm unzip luarocks lua-luarocks

if [ ! -d "$HOME/.config/nvim/lua/plugins/" ]; then
  mkdir -p $HOME/.config/nvim/lua/plugins &&
  echo "lua directories created"
else
  echo "lua directories exist"
fi


