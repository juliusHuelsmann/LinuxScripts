
# Installation instructions
Even tough there is a good documentation for the installation of the ns3 network simulation tool, for convenience the prerequieries and steps for installing are summerized here. Attention: the net upgrade size is approx. equal to 2 GB.

Ubuntu:
```bash
# for a complete installation of all features, install the following packages to your copy of Ubuntu.
sudo apt-get install gcc g++ python python-dev mercurial python-setuptools git qt4-dev-tools libqt4-dev cmake libc6-dev libc6-dev-i386 g++-multilib gdb valgrind gsl-bin libgsl2 libgsl-dev flex bison libfl-dev tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev libgtk2.0-0 libgtk2.0-dev vtun lxc uncrustify doxygen graphviz imagemagick texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portugese dvipng python-sphinx dia python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev ipython libboost-signals-dev libboost-filesystem-dev openmpi-bin openmpi-common openmpi-doc libopenmpi-dev
```

Arch:
There is no entire list of all recommended packages, I will list the packages I needed to add at my already set-up arch operating system below: 
```bash
# install CVS
sudo groupadd cvs
sudo useradd -md /home/cvsroot -g cvs -p Insecure0 cvs
sudo pacman -S cvs xinetd

pacman -S base-devel mercurial python-setuptools qt4 qt5-tools boost boost-libs dia
pacman -S doxygen flex goocanvas graphviz gsl gtk2 imagemagick libxml2 openmpi pygtk python2-pydot python2-setuptools qt4 sqlite fakeroot findutils bzr gdb python2-sphinx texlive-bin tcpdump uncrustify valgrind wireshark-gtk gtk-doc svn

# packages that are not in the official pacman list:
# pygccxml-svn, 	
# pygoocanvas,		https://aur.archlinux.org/pygoocanvas
# python2-pygraphviz	https://aur.archlinux.org/python2-pygraphviz.git 
# gccxml-git		
# goocanvasl		
# Those packages can be installed using the ArchLinux User community repository (AUR), a collection of instructions to build user-devied packages.


# Step 0:	Prerequieries that need to be set up once.
pachman -S base-devel # this package is necessary for installing packages from AUR

# Step 0a)	(recommended)
# 		Packages are downoaded via SVN and updated via abs
#		requires the packages to be located either in the 
#		home directory or at /var/abs/local.
groupadd abs		# add group for abs
gpasswd -a [UNAME] abs	# add the current user to abs 
mkdir -p /var/abs/local	# add the directory which will contain the installation
chown root:abs /var/abs/local
chmod 775 /var/abs/local
cd /var/abs/local


# Step 1:	clone repository, checkout the commit belonging to the required version
git clone https://aur.archlinux.org/goocanvas1
git clone https://aur.archlinux.org/gccxml-git
git clone https://aur.archlinux.org/python2-pygraphviz
git clone https://aur.archlinux.org/pygoocanvas
git clone https://aur.archlinux.org/pygccxml-svn

# Step 2: Build the files using
makepkg -si # inside each repository. BUT consider:
# the aur files have been cloned to /var/abs/local.
# please check the files PKGBUILD and [packagename].install
# manually for malicious commands
# and then run makepkg -si inside each repo separately
```
It is not possible to install the pygoocanvas directly due to a bug in the automake routine. Bugfix: temporarily remap python to python2.7. 

## Install ns3
```bash
cd
mkdir workspace-ns3
cd workspace-ns3
hg clone http://code.nsnam.org/bake
```

### set up bake env
```bash
export BAKE_HOME='pwd'
export PATH=$PATH:$BAKE_HOME:$BAKE_HOME/build/bin
export PYTHONPATH=H$PYTHONPATH:$BAKE_HOME:$BAKE_HOME/build/lib
```


### baking
```bash
./bake.py configure -e ns-3-allinone
./bake.py check
```
check if every status is okay. Install missing tools if needed.Afterwards:
```bash
./bake.py download
```


### build
The build command did not work properly at my machine for some unimportant functionalities. Workaround: link python and pip to  verision 2. 
```bash
./bake.py buid
./bake.py show
cd src/ns3-dev
./waf clean
./waf configure --build-profile=debug --enable-examples --enable-tests
./waf
```




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
if folowed the workaround I proposed linking to the old pyhton version and suddenly errors occur, check whether the link has been updated in the meantime.

