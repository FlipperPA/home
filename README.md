# home
An example of my home directory. To init in a non-empty home directory:

### Linux
```bash
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/main
cp skel/bashrc-linux .bashrc
curl -sS https://raw.githubusercontent.com/FlipperPA/pyromania/main/install.sh | sh
source .bashrc
cd ~/projects && pyro pypi && pip install -U pip-tools twine setuptools-scm pypi-alias && deactivate && cd ~
```

### MacOS
```bash
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/main
cp skel/bashrc-mac .bashrc
curl -sS https://raw.githubusercontent.com/FlipperPA/pyromania/main/install.sh | sh
source .bashrc
printf "\nsource ~/.bashrc\n" >> .bash_profile
. skel/install-mac.sh
cd ~/projects && pyro pypi && pip install -U pip-tools twine setuptools-scm pypi-alias && deactivate && cd ~
```

### WSL Windows 11 Ubuntu

Turn the `Windows Subsystem for Linux` on in the Control Panel -> Programs -> Programs & Features -> Turn Windows Features On or Off. These commands will install the VM (which defaults to C:\), then move to an alternate drive:

```powershell
wsl --install
wsl --update
wsl --install -d Ubuntu-24.04 --config 
# A reboot is necessary here if it is a first time WSL install.
wsl -t Ubuntu-24.04
wsl --export Ubuntu-24.04 "D:\wsl-export-ubuntu.tar"
wsl --unregister Ubuntu-24.04
mkdir d:\wsl
wsl --import Ubuntu-24.04 "D:\wsl\ubuntu" "D:\wsl-export-ubuntu.tar"
del D:\wsl-export-ubuntu.tar
```

Next, edit the setting in Windows Terminal for `Ubuntu-24.04` and change the invocation command to be `wsl -d "Ubuntu-24.04" -u tallen`.

Alternately, you could create a config file with `notepad \\wsl.localhost\Ubuntu-22.04\etc\wsl.conf`, and add a default user:

```
[user]
default=tallen
```

Then once you're booted up:

```bash
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/main
mkdir -p projects
mkdir -p .ssh
touch .ssh/authorized_keys
cp skel/bashrc-wsl-ubuntu .bashrc
sudo -s source skel/install-wsl-ubuntu.sh
curl -sS https://raw.githubusercontent.com/FlipperPA/pyromania/main/install.sh | sh
source .bashrc
cd ~/projects && pyro pypi && pip install -U pip-tools twine setuptools-scm pypi-alias && deactivate && cd ~
```

#### Installing Newer Versions of Python on Ubuntu

```bash
# Update apt and install SPC
sudo apt update
sudo apt install software-properties-common

# Add the respository for newer Python
sudo add-apt-repository ppa:deadsnakes/ppa

# Update again, and install Python 3.13
sudo apt update
sudo apt install python3.13 python3.13-dev python3.13-venv python3.13-distutils
```
