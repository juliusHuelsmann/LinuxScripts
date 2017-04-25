
# Installation instructions
There is official documentation for installation of the ns3 network simulation tool for ubuntu. For my copy of ubuntu, those instructions where not sufficient. Thus, for convenience the required steps for installing are summarized here. Attention: the net upgrade size is approx. 2 GB. I also generated install scripts for Ubuntu and arch from the commands listed below.

The install instructions are separated into different steps in which the user has to check the output or interfer manually.

## First step
Ubuntu:
```bash
# for a complete installation of all features, install the following packages to your copy of Ubuntu.
sudo apt-get install gcc g++ python python-dev mercurial python-setuptools git qt4-dev-tools libqt4-dev cmake libc6-dev g++-multilib gdb valgrind gsl-bin libgsl2 libgsl-dev flex bison libfl-dev tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev libgtk2.0-0 libgtk2.0-dev vtun lxc uncrustify doxygen graphviz imagemagick texlive texlive-extra-utils texlive-latex-extra texlive-font-utils dvipng python-sphinx dia python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev ipython libboost-signals-dev libboost-filesystem-dev openmpi-bin openmpi-common openmpi-doc libopenmpi
#sudo apt-get install libc6-dev-i386 

# the following packages are added manually because they are not listed
# as requirements in the official documentation
sudo apt-get install mercurial xinetd cvs 
sudo apt-get install dh-autoreconf unrar
sudo apt-get install p7zip
sudo apt-get install cmake autoconf
sudo apt-get install p7zip-full
sudo apt-get install bzr


sudo apt-get install flex bison
sudo apt-get install python-pygoocanvas qt4-default python-dev libxml2-dev python-pygraphviz gccxml libgccxml-dev python3-pygraphviz
sudo apt-get install gccxml python-ctypeslib python-py++
sudo pip install pygccxml

```

Arch:

Change the [Username] manually.
```bash
# don't call as root

sudo pacman -S base-devel mercurial python-setuptools qt4 qt5-tools boost boost-libs dia
sudo pacman -S doxygen flex goocanvas graphviz gsl gtk2 imagemagick libxml2 openmpi pygtk python2-pydot python2-setuptools qt4 sqlite fakeroot findutils bzr gdb python2-sphinx texlive-bin tcpdump uncrustify valgrind wireshark-gtk gtk-doc svn
sudo pacman -S cvs xinetd


#(recommended)
# 		Packages are downoaded via SVN and updated via abs
#		requires the packages to be located either in the 
#		home directory or at /var/abs/local.
groupadd abs            # add group for abs
gpasswd -a  [UNAME] abs     # add the current user to abs 
mkdir -p /var/abs/local # add the directory which will contain the installation
chown root:abs /var/abs/local
chmod 775 /var/abs/local
cd /var/abs/local

# packages that are not in the official pacman list:
# pygccxml-svn, 	
# pygoocanvas,		https://aur.archlinux.org/pygoocanvas
# python2-pygraphviz	https://aur.archlinux.org/python2-pygraphviz.git 
# gccxml-git		
# goocanvasl		
# Those packages can be installed using the Arch Linux User community repository (AUR), a collection of instructions to build user-defined packages.



git clone https://aur.archlinux.org/goocanvas1
git clone https://aur.archlinux.org/gccxml-git
git clone https://aur.archlinux.org/python2-pygraphviz
git clone https://aur.archlinux.org/pygocanvas
git clone https://aur.archlinux.org/pygccxml-svn


# Build the files using
# makepkg -si # inside each repository. BUT consider:
# the aur files have been cloned to /var/abs/local.
# please check the files PKGBUILD and [packagename].install
# manually for malicious commands
# and then run makepkg -si inside each repo separately

echo "the aur files have been cloned to /var/abs/local."
echo "please check the files PKGBUILD and [packagename].install"
echo "manually for malicious commands"
echo "and then run makepkg -si inside each repo separately."

```
For arch users: It is not possible to install the pygoocanvas directly due to a bug in the automake routine. Bugfix: temporarily remap python to python2.7. 

# Second step
Check the status of the output of step 2.
```
sudo groupadd cvs
sudo useradd -md /home/cvsroot -g cvs -p Insecure0 cvs

# clone repository
cd
mkdir workspace-ns3
cd workspace-ns3
hg clone http://code.nsnam.org/bake

# set up bake environment
export BAKE_HOME='pwd'
export PATH=$PATH:$BAKE_HOME:$BAKE_HOME/build/bin
export PYTHONPATH=H$PYTHONPATH:$BAKE_HOME:$BAKE_HOME/build/lib

# bake 
cd bake
./bake.py configure -e ns-3-allinone
./bake.py check

# check status!
```

check if every status is okay. Install missing tools if needed. Afterwards:

## Third step

The build command did not work properly at my machine for some unimportant functionalities. Workaround: link python and pip to  version 2. 
```bash
cd 
cd workspace-ns3
cd bake


./bake.py download
./bake.py build
./bake.py show
cd source/ns-3-dev
./waf clean
./waf configure --build-profile=debug --enable-examples --enable-tests
./waf


```
# Fourth step
Apply a few more bugfixes:

In case gccxml-ns3 failed (which will always be the case unless you are using a very ancient version of ubuntu:
```

# A bugfix needs to be done first for installing the (obsolete) 
# package gccxml.
# It turns out that the gccxml package can only be compiled using a very 
# old version of gcc.
# a patch to the repository is applied and downloaded automatically.
# see: https://groups.google.com/forum/#!topic/ns-3-users/2xwbyrQcQCc


# the quotation marks are actually a bugfix for zsh users.
git clone git@github.com:gccxml/gccxml.git



cd gccxml

curl "http://pkgs.fedoraproject.org/cgit/rpms/gccxml.git/plain/gccxml-gcc5.patch?h=f22" > file.patch
git apply -v file.patch
mkdir gccxml-build

cd gccxml-build
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=../../build -DCMAKE_C_FLAGS=-fgnu89-inline
make -j 16
sudo make install
```

Run step 4 again afterwards


# Important information
### Environments
Controls the use of logging, assertions and complier optimization. Always develop scenarios in debug mode. For evaluating the repetitive runs switch to optimized mode.
#### check which environment is currently running
```bash
# cd ~/workspacens3
./waf --check-profile
```

#### Switch between environments (during build)
```bash
./waf configure --build-profile=[PROFILE] --enable-examples --enable-tests
# where PROFILE is f.i. debug or optimized.
```

### On waf commands
some waf commands are also meaningful after the installation (e.g. --enable-sudo for emulation can be evoked after installation (emulation)). For more information check
```bash
./waf --help
```

### Attention
if followed the workaround I proposed linking to the old python version and suddenly errors occur, check whether the link has been updated in the meantime.


