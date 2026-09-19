#!/bin/bash

# This script is to update "arch_scripts" on github.
pushd /home/kim/.scripts || { echo "Failed to change directory to /home/kim/.scripts"; exit 1; } # Push to the stack and move to the 'scripts' directory.
current_date=$(date +%m\/%d\/%Y-%H:%M)
git add -A || { echo "Failed to add changes to the staging area"; exit 1; } # Add any changes to 'master' branch.
git commit -m "scripted update to scripts $current_date" || { echo "Failed to commit changes"; exit 1; } # Commit changes to the 'master' branch.
git push -u || { echo "Failed to push changes to the github repository"; exit 1; } # Push the changes to the github repository.
popd || { echo "Failed to return to previous directory"; exit 1; } # Go to previous directory and remove '.scripts' from the stack
