#!/bin/bash
# Sets up the Windows Subsystem for Linux version of Ubuntu 18.04 for Django development
mkdir -p .ssh
touch .ssh/authorized_keys

# Install PostgreSQL, Python packages for venv creation
sudo apt update
sudo apt -y install python3-pip python3-venv git bash-completion postgresql-client-10 postgresql-10 postgresql-server-dev-10

# Create projects and venvs symlinks in the Ubuntu home user's home directory to the Windows C:\ drive.
mkdir -p /mnt/c/projects
ln -s /mnt/c/projects projects
mkdir -p ~/venvs
sudo chown -R tallen:tallen .ssh
sudo chown -R tallen:tallen projects
sudo chown -R tallen:tallen venvs

# Start and Enable PostgreSQL
sudo service postgresql start
sudo systemctl enable postgresql
