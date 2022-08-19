#!/bin/bash

Help()
{
   # Display Help
   echo "Run script as root or with sudo"
   echo
}

# Main                                                                  

Help

echo "installing essential tools"
apt update && apt install -y python3
pip install --user ansible

echo "prepare for ansible install"
export PATH=$HOME/.local/bin:$PATH
$(which ansible-playbook) main.yaml

