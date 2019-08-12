# home
An example of my home directory. To init in a non-empty home directory:

### Vagrant
```
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/master
cp skel/bashrc-vagrant .bashrc
source .bashrc
```

### WSL-Ubuntu
```
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/master
cp skel/bashrc-wsl-ubuntu .bashrc
source .bashrc
. skel/install-wsl-ubuntu.sh
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
```
