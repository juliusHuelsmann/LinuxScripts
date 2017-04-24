
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
pacman -S base-devel mercurial python-setuptools qt4 qt5-tools boost boost-libs dia
pacman -S doxygen flex goocanvas graphviz gsl gtk2 imagemagick libxml2 openmpi pygtk python2-pydot python2-setuptools qt4 sqlite fakeroot findutils bzr gdb python2-sphinx texlive-bin tcpdump uncrustify valgrind wireshark-gtk

# packages that are not in the official pacman list:
# pygccxml-svn, 	x
# pygoocanvas,
# python2-pygraphviz
# gccxml-git		x
# 
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



```

