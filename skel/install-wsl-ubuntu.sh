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

# Create projects and venvs symlinks in the Ubuntu home user's home directory to the Windows C:\ drive.
mkdir -p /mnt/c/dev/projects
ln -s /mnt/c/dev/projects projects
mkdir -p /mnt/c/dev/venvs
ln -s /mnt/c/dev/venvs venvs
sudo chown -R tallen:tallen .ssh
sudo chown -R tallen:tallen projects
sudo chown -R tallen:tallen venvs

# Start and Enable PostgreSQL
sudo service postgresql start
sudo systemctl enable postgresql
