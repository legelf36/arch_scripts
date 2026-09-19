#!/bin/bash

# SSH basics
ssh username@hostname                          # connect to a remote server
ssh -p 2222 username@hostname                  # connect on a non-default port
ssh -i ~/.ssh/id_ed25519 username@hostname     # connect using a specific key

scp file.txt username@hostname:/path/to/dest   # copy a file to remote
scp username@hostname:/path/to/file.txt .      # copy a file from remote
scp -r folder/ username@hostname:/path/to/dest # copy a folder recursively

ssh-copy-id username@hostname                  # push your public key to a remote for passwordless login

cat ~/.ssh/config                              # view your SSH config (host shortcuts, etc.)
# example ~/.ssh/config entry:
#   Host myserver
#       HostName 192.168.1.10
#       User username
#       Port 2222
#       IdentityFile ~/.ssh/id_ed25519

ssh myserver                                   # once configured above, connect with just this

ssh-keygen -f ~/.ssh/known_hosts -R hostname   # remove a stale host key (e.g. after server rebuild)

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

# Generate key for Github ssh login
ssh-keygen -t ed25519 -C "krfleg2@accesscomm.ca"

# Start ssh agent and add the key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/Id_ed2551

# Run command and copy it to the clipboard
cat ~/.ssh/id_ed25519.pub

# Add the key to git hub
# >Setting's
# >SSH snd GPG key's
# >Add SSH key's

# Test the connection
ssh -T git@github.com

# to change existing repos
git remote set-url origin git@github.com:legelf36/arch_scripts.git


