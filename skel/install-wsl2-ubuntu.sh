#!/bin/bash
# Sets up the Windows Subsystem for Linux version of Ubuntu 18.04 for Django development
# Install PostgreSQL, Python packages for venv creation
sudo apt update
sudo apt -y install python3-pip python3-venv git bash-completion postgresql-client-10 postgresql-10 postgresql-server-dev-10

# Let user sudo without passwords.
sudo chmod 644 /etc/sudoers
sudo sed -i 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
sudo chmod 440 /etc/sudoers

# Start and Enable PostgreSQL
sudo service postgresql start
sudo systemctl enable postgresql

# Complete!
echo "All done! Type 'explorer.exe .' to see your home directory in Windows Explorer and create a shortcut."
