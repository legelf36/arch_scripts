#!/bin/bash

# github personal access token April 2nd 2022
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

# Commit changes to the 'master' branch.
git commit -m "update to scripts"

# Push the changes to the github repository.
git push -u

# Initialize git in the '.scripts' directory
git init

# Create 'README' for first commit
touch README.md

# Add files to staging area
git add -A

# move/rename main branch together with its config and reflog
git branch -M main
git remote add origin https://github.com/legelf36/

# Snapshot staging area
git commit -m "first commit"

# git status
git status

# set automatic command line color
git config --global color.ui auto

# set a username
git config --global user.name “[firstname lastname]”

# diff of what is changed but not staged
git diff

# diff of what is staged but not committed
git diff --staged

# list of branches
git branch
