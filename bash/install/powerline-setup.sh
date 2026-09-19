#!/bin/bash
set -e

# This script will clone 'powerline-shell' to the 'projects' directory and
# install.
# python3, python-pip and python-setuptools are dependancies for this script to work.

# Check if 'projects' directory exists and create if not.
[ ! -d "/home/kim/.repos" ] && mkdir /home/kim/.repos

# Push the 'projects' directory to the stack and move to it.
pushd /home/kim/.repos

# Clone 'powerline-shell' to 'projects' directory.
git clone https://github.com/b-ryan/powerline-shell

# Push the 'powerline-shell' directory to the stack and move to it.
pushd /home/kim/.repos/powerline-shell

# Run 'setup.py' install script
sudo python setup.py install

# Drop two levels in the stack and move back to the starting directory.
popd && popd

