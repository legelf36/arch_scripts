#!/bin/bash

[ -f "$HOME/.bashrc" ] && cp -fv ~/.bashrc ~/.scripts/config/
[ -f "$HOME/.bash_aliases" ] && cp -fv ~/.bash_aliases ~/.scripts/config/
[ -f "$HOME/.bash_functions" ] && cp -fv ~/.bash_functions ~/.scripts/config/
[ -f "$HOME/.config/starship.toml" ] && cp -fv ~/.config/starship.toml ~/.scripts/config/
# copy directories.
[ -d "$HOME/.config/wal" ] && cp -rfv $HOME/.config/wal/ $HOME/.scripts/config/
[ -d "$HOME/.config/yazi" ] && cp -rfv $HOME/.config/yazi/ $HOME/.scripts/config/
[ -d "$HOME/.config/ranger" ] && cp -rfv $HOME/.config/ranger/ $HOME/.scripts/config/
[ -d "$HOME/.config/conky" ] && cp -rfv $HOME/.config/conky/ $HOME/.scripts/config/conky/
[ -d "$HOME/.config/rofi" ] && cp -rfv $HOME/.config/rofi/ $HOME/.scripts/config/
[ -d "$HOME/.config/thefuck" ] && cp -rfv $HOME/.config/thefuck/ $HOME/.scripts/config/
[ -d "$HOME/.config/alacritty" ] && cp -rfv $HOME/.config/alacritty/ $HOME/.scripts/config/
[ -d "$HOME/.config/autostart" ] && cp -rfv $HOME/.config/autostart/ $HOME/.scripts/config/
[ -d "$HOME/.config/ckb-next" ] && cp -rfv $HOME/.config/ckb-next/ $HOME/.scripts/config/
[ -d "$HOME/.config/hypr" ] && cp -rfv $HOME/.config/hypr/ $HOME/.scripts/config/
[ -d "$HOME/.config/kate" ] && cp -rfv $HOME/.config/kate/ $HOME/.scripts/config/
[ -d "$HOME/.config/fastfetch" ] && cp -rfv $HOME/.config/fastfetch/ $HOME/.scripts/config/
[ -d "$HOME/.config/nvim" ] && cp -rfv $HOME/.config/nvim/ $HOME/.scripts/config/
[ -d "$HOME/.config/superfile" ] && cp -rfv $HOME/.config/superfile/ $HOME/.scripts/config/
[ -d "$HOME/.config/vlc" ] && cp -rfv $HOME/.config/vlc/ $HOME/.scripts/config/
[ -d "$HOME/.config/kitty" ] && cp -rfv $HOME/.config/kitty/ $HOME/.scripts/config/
[ -d "$HOME/.config/waybar" ] && cp -rfv $HOME/.config/waybar/ $HOME/.scripts/config/
[ -d "$HOME/.config/swaync" ] && cp -rfv $HOME/.config/swaync/ $HOME/.scripts/config/
[ -d "$HOME/.config/ghostty" ] && cp -rfv $HOME/.config/ghostty/ $HOME/.scripts/config/
[ -d "$HOME/.config/FreeCAD" ] && cp -rfv $HOME/.config/FreeCAD/ $HOME/.scripts/config/
[ -d "$HOME/.config/darktable" ] && cp -rfv $HOME/.config/darktable/ $HOME/.scripts/config/
[ -d "$HOME/.config/btop" ] && cp -rfv $HOME/.config/btop/ $HOME/.scripts/config/
[ -d "$HOME/.config/shotwell" ] && cp -rfv $HOME/.config/shotwell/ $HOME/.scripts/config/
[ -d "$HOME/.config/waypaper" ] && cp -rfv $HOME/.config/waypaper/ $HOME/.scripts/config/
[ -d "$HOME/.config/starship" ] && cp -rfv $HOME/.config/starship/ $HOME/.scripts/config/
[ -d "$HOME/.config/qt6ct" ] && cp -rfv $HOME/.config/qt6ct/ $HOME/.scripts/config/
[ -d "$HOME/.config/qt5ct" ] && cp -rfv $HOME/.config/qt5ct/ $HOME/.scripts/config/

pushd $HOME/.scripts # Push to the stack and move to the 'scripts' directory.
current_date=$(date +%Y-%m-%d)
git add -A                                               # Add any changes to 'master' branch.
git commit -m "scripted update to scripts $current_date" # Commit changes to the 'master' branch.
git push -u                                              # Push the changes to the github repository.
popd                                                     # Go to previous directory and remove '.scripts' from the stack
rsync_options="-aEP --mkpath"

$(which rsync) $rsync_options $HOME/.scripts $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/.config $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/repos $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/Documents $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/Downloads $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/Pictures $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/Videos $HOME/wd2tb/Backups/
$(which rsync) $rsync_options $HOME/Cad $HOME/wd2tb/Backups/
