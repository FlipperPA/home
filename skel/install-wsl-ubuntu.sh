# Sets up the Windows Subsystem for Linux version of Ubuntu 18.04 for Django development
mkdir -p .ssh
touch .ssh/authorized_keys

# Install Python packages for venv creation
sudo apt update
sudo apt -y install python3-pip python3-venv git bash-completion

# Remount the Windows C:\ drive with metadata, to allow symlinks and shared permissions
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata

# Create a projects directory in the Ubuntu home user's home directory to the Windows C:\ drive.
mkdir -p /mnt/c/projects
ln -s /mnt/c/projects projects

# Install PostgreSQL
deb http://apt.postgresql.org/pub/repos/apt/ 18.04-pgdg main
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt install postgresql-client-10 postgresql-10 postgresql-server-dev-10
