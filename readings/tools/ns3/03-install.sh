cd 
cd workspace-ns3
cd bake



# not listed
sudo apt-get install flex bison
sudo apt-get install python-pygoocanvas qt4-default python-dev libxml2-dev python-pygraphviz gccxml libgccxml-dev python3-pygraphviz
sudo apt-get install gccxml python-ctypeslib python-py++
sudo pip install pygccxml

./bake.py download
./bake.py build
./bake.py show
cd source/ns-3-dev
./waf clean
./waf configure --build-profile=debug --enable-examples --enable-tests
./waf

