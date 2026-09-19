#!/bin/bash

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

# Check for HTTPS or SSH
git remote -v

# GitHub SSH setup
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub          # paste into GitHub > Settings > SSH and GPG keys

ssh -T git@github.com              # test connection
git remote set-url origin git@github.com:username/repo.git   # switch existing repo to SSH


# Git basics
git clone git@github.com:username/repo.git
git status
git add .                          # stage all changes
git add -p                         # stage changes interactively, hunk by hunk
git commit -m "message"
git push origin main
git pull origin main
git log --oneline -10              # last 10 commits, one line each
git branch new-branch-name
git checkout new-branch-name       # or: git checkout -b new-branch-name (create + switch)
git merge branch-name              # merge branch-name into current branch
git stash                          # shelve uncommitted changes
git stash pop                      # bring them back


# GPG commit signing (optional, verifies commits are really from you)
gpg --full-generate-key            # choose RSA, 4096 bits, no expiration (or your preference)
gpg --list-secret-keys --keyid-format=long     # find your key ID (after "sec  rsa4096/")
gpg --armor --export YOUR_KEY_ID   # copy output into GitHub > Settings > SSH and GPG keys > New GPG key

git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true        # sign all commits automatically
git commit -S -m "message"                     # sign one commit manually (if not auto-signing)
