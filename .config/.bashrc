#!/bin/bash

###EXPORT###
export EDITOR='nvim'
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

PS1='[\u \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

. /home/kim/.bash_aliases
. /home/kim/.bash_functions

if [ -f 'which powerline-daemon' ]; then
  powerline-daemon -q
  export POWERLINE_BASH_CONTINUATION=1
  export POWERLINE_BASH_SELECT=1
  /usr/share/powerline/bindings/bash/powerline.sh
fi

# fastfetch

eval "$(thefuck --alias)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
