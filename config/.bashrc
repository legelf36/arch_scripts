#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Pywa
cat ~/.cache/wal/sequences
# source ~/.cache/wal/colors.sh
###EXPORT###
export EDITOR='nvim'
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'
# export STARSHIP_CONFIG="$HOME/.config/starship/wal_palette.toml:$HOME/.config/starship.toml"

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

force_color_prompt=yes

[ -d "$HOME/.bin" ] && PATH="$HOME/.bin:$PATH"

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -d "$HOME/.scripts" ] && PATH="$HOME/.scripts:$PATH"

[ -f "$HOME/.bash_aliases" ] && . $HOME/.bash_aliases

[ -f "$HOME/.bash_functions" ] && . $HOME/.bash_functions

PS1='[\u@\h \W]\$ '
eval "$(zoxide init bash)"
eval "$(starship init bash)"
