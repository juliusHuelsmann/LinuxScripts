sudo groupadd cvs
sudo useradd -md /home/cvsroot -g cvs -p Insecure0 cvs

cd
mkdir workspace-ns3
cd workspace-ns3
hg clone http://code.nsnam.org/bake

export BAKE_HOME='pwd'
export PATH=$PATH:$BAKE_HOME:$BAKE_HOME/build/bin
export PYTHONPATH=H$PYTHONPATH:$BAKE_HOME:$BAKE_HOME/build/lib

cd bake
./bake.py configure -e ns-3-allinone
./bake.py check

# check status!
