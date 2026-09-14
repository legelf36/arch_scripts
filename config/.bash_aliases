#!/bin/bash
alias ..='cd ..' # back one directory
alias ls='ls --color=auto'
alias ll='ls -gv --group-directories-first --color=auto'  # Long list of files (not hidden).
alias la='ls -a --group-directories-first --color=auto'   # List all files.
alias lla='ls -al --group-directories-first --color=auto' # Long List of all files.

alias df='df -h' # device mounted listing
alias cd..='cd ..'
alias yu='yay -Syyu'              # yay system update
alias yyu='yay -Syyu --noconfirm' # yay system auto-update
alias grep='grep --color=auto'
alias egrep='egrep -color'
alias fgrep='fgrep -color'

alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

alias free="free -mt"
alias wget="wget -c"

alias kc='killall conky'
alias hw="hwinfo --short"

alias nv="nvim"
alias snv="sudo nvim"
alias nfstab="sudo \$EDITOR /etc/fstab"
alias nb="\$EDITOR ~/.bashrc"
alias nba="\$EDITOR ~/.bash_aliases"
alias nbf="\$EDITOR ~/.bash_functions"
alias nc="\$EDITOR ~/.config/conky/newaamine.conkyrc"
alias sr="sudo reboot"

alias llama='~/.repos/llama.cpp/build/bin/llama-cli -m ~/models/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf -ngl 99 -c 2048'
alias qwen='~/.repos/llama.cpp/build/bin/llama-cli -m ~/models/Qwen2.5-Coder-7B-Instruct-Q4_K_M.gguf -ngl 99 -c 2048'
alias mynvr='setsid env LD_LIBRARY_PATH=~/.local/opt/ivms-4200/PlugIns ~/.local/opt/ivms-4200/iVMS-4200 > /tmp/ivms.log 2>&1 &'

