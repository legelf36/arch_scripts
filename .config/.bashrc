#!/bin/bash

###EXPORT###
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

PS1='[\u \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

. /home/kim/.bash_aliases
. /home/kim/.bash_functions

if [ -f 'which powerline-daemon' ]; then
  powerline-daemon -q
  export POWERLINE_BASH_CONTINUATION=1
  export POWERLINE_BASH_SELECT=1
  /usr/share/powerline/bindings/bash/powerline.sh
fi

# function _update_ps1() {
#   PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#   PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

fastfetch

eval "$(thefuck --alias)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
