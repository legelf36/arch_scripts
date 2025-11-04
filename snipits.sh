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
