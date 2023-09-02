#!/bin/bash
set -e

# This script will create a local git repository for the script files in the
# '.scripts' directory
# Only run script on a new "uninitialized" repository on github.

# Check for and create 'scripts' directory
[ ! -d "/home/kim/.scripts" ] && mkdir /home/kim/.scripts

# Move to and push to the stack, '.scripts' directory
pushd /home/kim/.scripts/

# Initialize git in the '.scripts' directory
git init

# Create 'README' for first commit
touch README.md

# Add files to staging area
git add -A

# Snapshot staging area
git commit -m "first commit"

# Path for repository
git remote add origin https://github.com/legelf36/desk-LMDE4-scripts.git

# Push changes to github
git push -u --set-upstream origin master

# Move to previous directory and remove scripts directory from stack
popd

