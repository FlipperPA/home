#!/bin/bash
# Sets up the Windows Subsystem for Linux version of Ubuntu 18.04 for Django development
echo "For a smooth installation, make sure you have recently run a sudo command, such as 'sudo ls'."
mkdir -p .ssh
touch .ssh/authorized_keys

# Install PostgreSQL, Python packages for venv creation
sudo apt update
sudo apt -y install python3-pip python3-venv git bash-completion postgresql-client-10 postgresql-10 postgresql-server-dev-10

# Remount the Windows C:\ drive with metadata, to allow symlinks and shared permissions
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata

# Create a projects directory in the Ubuntu home user's home directory to the Windows C:\ drive.
mkdir -p /mnt/c/projects
ln -s /mnt/c/projects projects

# Install PostgreSQL
# echo "deb http://apt.postgresql.org/pub/repos/apt/ 18.04-pgdg main" | sudo tee -a /etc/apt/sources.list.d/pgdg.list
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update
# sudo apt install 
