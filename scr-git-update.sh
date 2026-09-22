#!/bin/bash

# This script is to update my repository on github.

pushd /home/kim/.scripts # Push to the stack and move to the 'scripts' directory.

current_date=$(date +%Y-%m-%d)

git add -A # Add any changes to 'master' branch.

git commit -m "scripted update to scripts $current_date" # Commit changes to the 'master' branch.

git push -u # Push the changes to the github repository.

popd # Go to previous directory and remove '.scripts' from the stack
