#!/bin/bash

# ssh to user "kim" on laptop at "192.168.0.102" for first time
ssh kim@192.168.0.102

# Generate keys for ssh
ssh-keygen -t rsa

# Copy key to ssh user "kim" on laptop at "192.168.0.102"
ssh-copy-id kim@192.168.0.102

# Find the IP of computer
ifconfig

# One-liner to show & refresh sensors data for the cpu.
watch -n 2 sensors

# Update xrdb with '.Xresources' file
xrdb ~/.Xresources

# Create a symbolic link.
# ln -s target_file link_name

# What does a command do.
# whatis <command>

# Find commands related to subject.
# apropos <subject>

# grep
grep '# ' ~/.bashrc

# grep inverse
grep -v '# ' ~/.bashrc

# grep for files that contain <string> in ~/.config/conky
grep -Irl '# ' ~/.config/conky/

# sed substition to output
# <command> | sed 's/OLD/NEW/g'

# sed substition in place
sed -i 's/###EXPORT###/###EXPORT ENV VAR###/g' ~/.bashrc

# use tail to monitor log file.
tail -f /usr/log.log

# ctrl+Z to push program to tthe background
# fg to return to the foreground

# ctrl+r to do history search

# redo history command (history line number)
# !103

# execute multiple commands with no error checking
ls -l
ls -al

# execute multiple commands with error checking
ls -l && ls -al

# Get UUID for the /dev/sdb1 that you want to make new /home
sudo blkid /dev/sdb1

ls -1prt | grep -v "/$" | cat -n | while read n f; do mv -n "${f}" "$(printf "%04d" $n).${f#*.}";
ls -v | cat -n | while read n f; do mv -n "$f" "$n.jpg"; 

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
