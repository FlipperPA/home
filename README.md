# home
An example of my home directory. To init in a non-empty home directory:

### WSL-2 Ubuntu 20

WSL-2 contains major improvements to the speed and performance by providing a full Linux kernel. WSL-10 is now the default on Windows 10, since patch 2004 in May, 2020. See: https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/

```bash
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/main
mkdir -p projects
mkdir -p venvs
mkdir -p .ssh
touch .ssh/authorized_keys
cp skel/bashrc-wsl-ubuntu .bashrc
sudo -s source skel/install-wsl-ubuntu.sh
source .bashrc
cd ~/projects && mkvirtualenv pypi && pip install setuptools twine wheel setuptools-scm pypi-alias && deactivate && cd ~
```

#### Installing Newer Versions of Python on Ubuntu 16 or 18

```bash
# Update apt and install SPC
sudo apt update
sudo apt install software-properties-common

# Add the respository for newer Python
sudo add-apt-repository ppa:deadsnakes/ppa

# Update again, and install Python 3.8
sudo apt update
sudo apt install python3.8 python3.8-dev python3.8-venv python3.8-distutils
```

### MacOS
```bash
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/main
cp skel/bashrc-mac .bashrc
source .bashrc
printf "\nsource ~/.bashrc\n" >> .bash_profile
. skel/install-mac.sh
cd ~/projects && mkvirtualenv pypi && pip install setuptools twine wheel setuptools-scm pypi-alias && deactivate && cd ~
```

### Generic Linux Server
```bash
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/main
cp skel/bashrc-linux .bashrc
source .bashrc
cd ~/projects && mkvirtualenv pypi && pip install setuptools twine wheel setuptools-scm pypi-alias && deactivate && cd ~
```
