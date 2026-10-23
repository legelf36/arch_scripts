#!/bin/bash

# Check for "/.scripts" directory in "$HOME" 
# [ ! -d "$HOME/.scripts/config" ] && mkdir -p $HOME/.scripts/config && echo "Directory .scripts/config created"

HOMECFG="$HOME/.config/"
COPYLOC="$HOME/.scripts/config/"
BACKLOC="$HOME/wd2tb/Backups/"

cp -fv ~/.bashrc $COPYLOC
cp -fv ~/.bash_aliases $COPYLOC
cp -fv ~/.bash_functions $COPYLOC
cp -fv ~/.config/starship.toml $COPYLOC
# copy directories.
cp -rfv ~/.config/autostart/ $COPYLOC
cp -rfv ~/.config/ckb-next/ $COPYLOC
cp -rfv ~/.config/hypr/ $COPYLOC
cp -rfv ~/.config/kate/ $COPYLOC
cp -rfv ~/.config/nvim/ $COPYLOC
cp -rfv ~/.config/vlc/ $COPYLOC
cp -rfv ~/.config/ghostty/ $COPYLOC
cp -rfv ~/.config/omarchy/ $COPYLOC
cp -rfv ~/.config/aether/ $COPYLOC
cp -rfv ~/.config/mpv/ $COPYLOC
cp -rfv ~/.config/yazi/ $COPYLOC
cp -rfv ~/.config/GIMP/ $COPYLOC
cp -rfv ~/.config/FreeCAD/ $COPYLOC
cp -rfv ~/.config/cursor/ $COPYLOC
cp -rfv ~/.config/strawberry/ $COPYLOC
cp -rfv ~/.config/git/ $COPYLOC

# Update "arch_scripts" on Github
pushd $HOME/.scripts # Push to the stack and move to the 'scripts' directory.
current_date=$(date +%Y-%m-%d-%h:%m)                     # Set variable to current date
git add -A                                               # Add any changes to 'master' branch.
git commit -m "scripted update to scripts $current_date" # Commit changes to the 'master' branch with date message.
git push -u                                              # Push the changes to the github repository.
popd                                                     # Go to previous directory and remove '.scripts' from the stack

# Check for backup drive
[ ! -d "$HOME/wd2tb/" ] && echo "Backup drive not mounted. No Backup!" && exit

# Backup specified directories with rsync
rsync_options="-aEP --mkpath"

$(which rsync) $rsync_options $HOME/.scripts $BACKLOC
$(which rsync) $rsync_options $HOME/.config $BACKLOC
$(which rsync) $rsync_options $HOME/.repos $BACKLOC
$(which rsync) $rsync_options $HOME/Documents $BACKLOC
$(which rsync) $rsync_options $HOME/Downloads $BACKLOC
$(which rsync) $rsync_options $HOME/Pictures $BACKLOC
$(which rsync) $rsync_options $HOME/Videos $BACKLOC
# $(which rsync) $rsync_options $HOME/Cad $BACKLOC
