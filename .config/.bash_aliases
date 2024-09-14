#!/bin/bash
alias ..='cd ..' # back one directory
alias ll='ls -glv --group-directories-first' # Long list of files (not hidden).
alias la='ls -A --group-directories-first' # List all files.
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
alias udpate='sudo pacman -Syyu'
#alias upate='sudo pacman -Syyu'
#alias updte='sudo pacman -Syyu'
#alias updqte='sudo pacman -Syyu'
#alias upqll='paru -Syu --noconfirm'
#alias upal='paru -Syu --noconfirm'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"
alias setlocale="sudo localectl set-locale LANG=en_US.UTF-8"
alias setlocales="sudo localectl set-x11-keymap be && sudo localectl set-locale LANG=en_US.UTF-8"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"
alias whichvga="/usr/local/bin/arcolinux-which-vga"
alias free="free -mt"
alias wget="wget -c"
alias userlist="cut -d: -f1 /etc/passwd | sort"
alias merge="xrdb -merge ~/.Xresources"
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"
alias update-fc='sudo fc-cache -fv'
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias cb='cp /etc/skel/.bashrc ~/.bashrc && exec bash'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && echo "Copied."'
alias cf='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'
alias tobash="sudo chsh \$USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh \$USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh \$USER -s /bin/fish && echo 'Now log out.'"
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"
alias kc='killall conky'
alias kp='killall polybar'
alias kpi='killall picom'
alias hw="hwinfo --short"
alias audio="pactl info | grep 'Server Name'"
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias vmware-start="sudo systemctl enable --now vmtoolsd.service"
alias sv="sudo systemctl enable --now vmtoolsd.service"
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print %2}'"
alias isoo="cat /etc/dev-rel"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias clean="clear; seq 1 \$(tput cols) | sort -R | sparklines | lolcat"
alias rg="rg --sort path"
alias jctl="journalctl -p 3 -xb"
alias npacman="sudo \$EDITOR /etc/pacman.conf"
alias ngrub="sudo \$EDITOR /etc/default/grub"
alias nconfgrub="sudo \$EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo \$EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo \$EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist="sudo \$EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nsddm="sudo \$EDITOR /etc/sddm.conf"
alias nsddmk="sudo \$EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo \$EDITOR /etc/fstab"
alias nnsswitch="sudo \$EDITOR /etc/nsswitch.conf"
alias nsamba="sudo \$EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo \$EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo \$EDITOR /etc/hosts"
alias nhostname="sudo \$EDITOR /etc/hostname"
alias nb="\$EDITOR ~/.bashrc"
alias nz="\$EDITOR ~/.zshrc"
alias nf="\$EDITOR ~/.config/fish/config.fish"
alias nneofetch="\$EDITOR ~/.config/neofetch/config.conf"
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"
alias fix-permissions="sudo chown -R \$USER:\$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# function to simplify ssh login after key has been sent
sshin () {
    ssh 192.168.0."$1"
    return
}


export -f sshin
