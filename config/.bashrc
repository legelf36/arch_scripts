# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
# eval "$(starship init bash)"
# eval "$(zoxide init bash)"

[ -f "$HOME/.bash_aliases" ] && . $HOME/.bash_aliases
[ -f "$HOME/.bash_functions" ] && . $HOME/.bash_functions

# Make an alias for invoking commands you use constantly
# alias p='python'
