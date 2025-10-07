#!/bin/bash
alias ..='cd ..'                             # back one directory
alias ll='ls -glv --group-directories-first' # Long list of files (not hidden).
alias la='ls -A --group-directories-first'   # List all files.
alias lla='ls -Al --group-directories-first' # Long List of all files.
alias lm='ll |more'
alias lr='ll -R'
alias df='df -h'
alias ls='ls --color=auto'
# alias la='ls -a'
# alias ll='ls -alFh'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias cd..='cd ..'
alias pdw='pwd'
alias yyu='yay -Syyu --noconfirm'
#alias upate='sudo pacman -Syyu'
#alias updte='sudo pacman -Syyu'
#alias updqte='sudo pacman -Syyu'
#alias upqll='paru -Syu --noconfirm'
#alias upal='paru -Syu --noconfirm'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias free="free -mt"
alias wget="wget -c"
alias userlist="cut -d: -f1 /etc/passwd | sort"
alias merge="xrdb -merge ~/.Xresources"
alias pacman='sudo pacman --color auto'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias kc='killall conky'
alias hw="hwinfo --short"
alias nfstab="sudo \$EDITOR /etc/fstab"
alias nb="\$EDITOR ~/.bashrc"
alias sr="sudo reboot"
alias cpcgf="/home/kim/.scripts/copy_config.sh"
