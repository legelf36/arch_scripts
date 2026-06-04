#!/bin/bash

# These commands apply to arch linux.

# Start ssh daemon
sudo systemctl start sshd

# Enable the ssh service
sudo systemctl enable sshd

# Check for ssh
which ssh

# ssh to user "kim" on laptop at "192.168.0.102" for first time
ssh kim@192.168.0.107

# Copy key to ssh user "kim" on laptop at "192.168.0.102"
ssh-copy-id kim@192.168.0.107

# retrieve IP address for this machine
ip addr show
# or
ifconfig

# Check for existing key in default directory
ls -l ~/.ssh

# Generate key ( 4k bit size )
ssh-keygen -b 4096

# Generate keys for ssh
ssh-keygen -t rsa

