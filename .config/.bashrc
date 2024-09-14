#!/bin/bash

###EXPORT ENV VAR###
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

PS1='[\u \W]\$ '

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return


if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
# bind "set completion-ignore-case on"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.deb)       ar x "$1"      ;;
      *.tar.xz)    tar xf "$1"    ;;
      *.tar.zst)   tar xf "$1"    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

. /home/kim/.bash_aliases

# if [ -f 'which powerline-daemon' ]; then
#   powerline-daemon -q
#   export POWERLINE_BASH_CONTINUATION=1
#   export POWERLINE_BASH_SELECT=1
#   /usr/share/powerline/bindings/bash/powerline.sh
# fi

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
