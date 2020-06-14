#!/bin/bash
# Sets up the Windows Subsystem for Linux version of Ubuntu 20.04 for Django development

# Install NodeJS and NPM repository
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# Temporary fix for pasting into IPython with Windows Terminal
mkdir -p ~/.ipython/profile_default/
cp ~/skel/ipython_config.py ~/.ipython/profile_default/

# Install Python and other essential packages
sudo apt update
sudo apt -y install python3-pip python3-venv git bash-completion tdsodbc

# Install PostgreSQL 12
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt -y install postgresql-12 postgresql-client-12 postgresql-server-dev-12

# Let user sudo without passwords.
sudo chmod 644 /etc/sudoers
sudo sed -i 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
sudo chmod 440 /etc/sudoers

# Allow connections from Windows host OS to WSL-2 Ubuntu PostgreSQL
echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf
echo "# Allow connecting to postgresql from outside WSL-2 Ubuntu" >> /etc/postgresql/12/main/pg_hba.conf
echo "host	all	all	all	trust" >> /etc/postgresql/12/main/pg_hba.conf

# Start and Enable PostgreSQL
sudo service postgresql start
sudo systemctl enable postgresql

# Complete!
echo "All done! Type 'explorer.exe .' to see your home directory in Windows Explorer and create a shortcut."
