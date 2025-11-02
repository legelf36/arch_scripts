#!/bin/bash

###EXPORT###
export EDITOR='nvim'
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

force_color_prompt=yes

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.scripts" ]; then
  PATH="$HOME/.scripts:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

if [ -f "$HOME/.bash_aliases" ]; then
  . $HOME/.bash_aliases
fi

if [ -f "$HOME/.bash_functions" ]; then
  . $HOME/.bash_functions
fi

eval "$(thefuck --alias)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
