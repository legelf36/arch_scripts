#!/bin/bash

# These commands apply to arch linux.

# Start ssh daemon
sudo systemctl start sshd

# Enable the ssh service
sudo systemctl enable sshd

# Check for ssh
which ssh

# retrieve IP address for this machine
ip addr show

# Login to remote
# ssh <user>@<ip_address>

# Check for existing key in default directory
ls -l ~/.ssh

# Generate key ( 4k bit size )
ssh-keygen -b 4096

# Copy key to remote server
# ssh-copy-id <remote_user>@<remote_ip>

