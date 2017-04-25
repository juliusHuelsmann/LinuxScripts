# don't call as root

sudo pacman -S base-devel mercurial python-setuptools qt4 qt5-tools boost boost-libs dia
sudo pacman -S doxygen flex goocanvas graphviz gsl gtk2 imagemagick libxml2 openmpi pygtk python2-pydot python2-setuptools qt4 sqlite fakeroot findutils bzr gdb python2-sphinx texlive-bin tcpdump uncrustify valgrind wireshark-gtk gtk-doc svn

groupadd abs        # add group for abs
gpasswd -a juli abs  # add the current user to abs 
mkdir -p /var/abs/local # add the directory which will contain the installation
chown root:abs /var/abs/local
chmod 775 /var/abs/local
cd /var/abs/local


git clone https://aur.archlinux.org/goocanvas1
git clone https://aur.archlinux.org/gccxml-git
git clone https://aur.archlinux.org/python2-pygraphviz
git clone https://aur.archlinux.org/pygocanvas
git clone https://aur.archlinux.org/pygccxml-svn


echo "the aur files have been cloned to /var/abs/local."
echo "please check the files PKGBUILD and [packagename].install"
echo "manually for malicious commands"
echo "and then run makepkg -si inside each repo separately."
