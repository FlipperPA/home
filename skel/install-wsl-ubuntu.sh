touch .ssh/authorized_keys
sudo apt update
sudo apt install python3-pip python3-venv
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata
mkdir /mnt/c/projects
ln -s /mnt/c/projects projects
