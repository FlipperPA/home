#!/bin/bash
# Sets up the Windows Subsystem for Linux version of Ubuntu 18.04 for Django development

# Install NodeJS and NPM repository
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -

# Install PostgreSQL, Python packages for venv creation
sudo apt update
sudo apt -y install python3-pip python3-venv git bash-completion postgresql-client-10 postgresql-10 postgresql-server-dev-10 ntpdate tdsodbc

# Let user sudo without passwords.
sudo chmod 644 /etc/sudoers
sudo sed -i 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
sudo chmod 440 /etc/sudoers

# Allow connections from Windows host OS to WSL-2 Ubuntu PostgreSQL
echo "listen_addresses = '*'" >> /etc/postgresql/10/main/postgresql.conf
echo "# Allow connecting to postgresql from outside WSL-2 Ubuntu" >> /etc/postgresql/10/main/pg_hba.conf
echo "host	all	all	all	trust" >> /etc/postgresql/10/main/pg_hba.conf

# Start and Enable PostgreSQL
sudo service postgresql start
sudo systemctl enable postgresql

# Complete!
echo "All done! Type 'explorer.exe .' to see your home directory in Windows Explorer and create a shortcut."
