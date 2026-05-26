#!/bin/bash

# Check for "/.scripts" directory in "$HOME" 
# [ ! -d "$HOME/.scripts/config" ] && mkdir -p $HOME/.scripts/config && echo "Directory .scripts/config created"

HOMECFG="$HOME/.config"
COPYLOC="$HOME/.scripts/config"

while IFS=', ' read -r filename; do
  # Remove carriage return if present
  filename="${filename//$'\r'/}"
  # Check if file exists using -e test
  if [ -e "$HOME/$filename" ]; then
    echo "File '$HOME/$filename' exists"
    cp -rf $HOME/$filename $COPYLOC/
  elif [ -e "$HOMECFG/$filename" ]; then
    echo "File '$HOMECFG/$filename' exists"
    cp -rf $HOMECFG/$filename $COPYLOC/
  else
    echo "File '$filename' does not exist"
  fi
done < $HOME/.scripts/utils/backup-list.csv

# Update "arch_scripts" on Github
# pushd $HOME/.scripts # Push to the stack and move to the 'scripts' directory.
# current_date=$(date +%Y-%m-%d-%h:%m)                     # Set variable to current date
# git add -A                                               # Add any changes to 'master' branch.
# git commit -m "scripted update to scripts $current_date" # Commit changes to the 'master' branch with date message.
# git push -u                                              # Push the changes to the github repository.
# popd                                                     # Go to previous directory and remove '.scripts' from the stack

# Check for backup drive
# [ ! -d "$HOME/wd2tb/" ] && echo "Backup drive not mounted. No Backup!" && exit

# Backup specified directories with rsync
# rsync_options="-aEP --mkpath"

# $(which rsync) $rsync_options $HOME/.scripts $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/.config $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/.repos $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/Documents $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/Downloads $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/Pictures $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/Videos $HOME/wd2tb/Backups/
# $(which rsync) $rsync_options $HOME/Cad $HOME/wd2tb/Backups/
