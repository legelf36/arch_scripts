# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"
# source ~/.local/share/blesh/ble.sh --noattach

eval "$(starship init bash)"
# [[ ${BLE_VERSION-} ]] && ble-attach

eval "$(zoxide init bash)"

# Add your own exports, aliases, and functions here.
[ -f "$HOME/.bash_aliases" ] && . $HOME/.bash_aliases

[ -f "$HOME/.bash_functions" ] && . $HOME/.bash_functions

# Make an alias for invoking commands you use constantly
# alias p='python'

. "$HOME/.local/share/../bin/env"
