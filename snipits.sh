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
