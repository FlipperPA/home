# home
An example of my home directory. To init in a non-empty home directory:

### WSL-2 Ubuntu

WSL-2 contains major improvements to the speed and performance by providing a full Linux kernel. As of this writing, it requires to be on the Windows Inside program Fast Circle. See: https://scotch.io/bar-talk/trying-the-new-wsl-2-its-fast-windows-subsystem-for-linux

```
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/master
mkdir -p projects
mkdir -p venvs
mkdir -p .ssh
touch .ssh/authorized_keys
cp skel/bashrc-wsl-ubuntu .bashrc
sudo -s source skel/install-wsl2-ubuntu.sh
source .bashrc
cd ~/projects
mkvirtualenv pypi
pip install setuptools twine wheel setuptools-scm pypi-alias
```

### MacOS
```
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/master
cp skel/bashrc-mac .bashrc
source .bashrc
printf "\nsource ~/.bashrc\n" >> .bash_profile
. skel/install-mac.sh
cd ~/projects
mkvirtualenv pypi
pip install setuptools twine wheel setuptools-scm pypi-alias
```

### Vagrant
```
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/master
cp skel/bashrc-vagrant .bashrc
source .bashrc
cd ~/projects
mkvirtualenv pypi
pip install setuptools twine wheel setuptools-scm pypi-alias
```
