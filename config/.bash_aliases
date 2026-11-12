#!/bin/bash
alias ls='eza -lh --group-directories-first --icons=auto'
alias ll='eza -la --group-directories-first --icons=auto' # Long list of files (not hidden).
alias la='ls -a --group-directories-first --color=auto'   # List all files.
alias lla='ls -al --group-directories-first --color=auto' # Long List of all files.

alias df='df -h'                                          # device mounted listing
alias cd..='cd ..'
alias yu='yay -Syyu'                                      # yay system update
alias yyu='yay -Syyu --noconfirm'                         # yay system auto-update
alias grep='grep --color=auto'
alias egrep='egrep -color'
alias fgrep='fgrep -color'

alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

alias free="free -mt"
alias wget="wget -c"

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
alias qwen4-srv='llama-server -m ~/models/qwen2.5-coder-7b-instruct-q4_k_m.gguf -ngl 99 -c 4096 -np 1 --port 8080'
alias qwen5-srv='llama-server -m ~/models/qwen2.5-coder-7b-instruct-q5_k_m.gguf -ngl 99 -c 4096 -np 1 --port 8080'
alias qwen35-srv='llama-server -m ~/models/Qwen3.5-4B-3D-Coder-Q4_K_M.gguf -ngl 99 -c 4096 -np 1 --port 8080'
alias mynvr='setsid env LD_LIBRARY_PATH=~/.local/opt/iVMS-4200/PlugIns ~/.local/opt/iVMS-4200/iVMS-4200 > /tmp/ivms.log 2>&1 &'
alias aid='aider --model openai/qwen3.5-4B-3D-coder'
