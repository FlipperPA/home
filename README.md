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
<<<<<<< Updated upstream
cd ~/projects && mkvirtualenv pypi && pip install setuptools twine wheel setuptools-scm pypi-alias && deactivate && cd ~
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
cd ~/projects && mkvirtualenv pypi && pip install setuptools twine wheel setuptools-scm pypi-alias && deactivate && cd ~
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
cd ~/projects && mkvirtualenv pypi && pip install setuptools twine wheel setuptools-scm pypi-alias && deactivate && cd ~
=======
```

### WSL Ubuntu

After installing Ubuntu from the Windows Store, you'll want to add an exclusion to virus checking for the root folder. This will lead to a huge increase in performance because of file I/O:

* Using exploring, navigate to the `rootfs` folder. I.e.: `C:\Users\username\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_[UUID]\LocalState\rootfs`. Copy this path from the nav bar.
* From the start menu, navigate to `Windows Security -> Virus & threat protection -> Manage settings -> Add or remove exclusions`
* Add a folder exclusion with the path you copied.

Then, run these commands:

```
cd ~
git init
git remote add origin https://github.com/FlipperPA/home.git
git fetch
git checkout -t origin/master
cp skel/bashrc-wsl-ubuntu .bashrc
source .bashrc
mkdir -p projects
mkdir -p venvs
mkdir -p .ssh
touch .ssh/authorized_keys
sudo -s source skel/install-wsl-ubuntu.sh
>>>>>>> Stashed changes
```
