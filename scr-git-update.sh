#!/bin/bash

# This script is to update my 'arco-scripts' repository on github.

# Push to the stack and move to the 'scripts' directory.
pushd /home/kim/.scripts

current_date=$(date +%Y-%m-%d)
# Add any changes to 'master' branch.
git add -A

# Commit changes to the 'master' branch.
git commit -m "scripted update to scripts $current_date"

# Push the changes to the github repository.
git push -u

# Go to previous directory and remove '.scripts' from the stack
popd
