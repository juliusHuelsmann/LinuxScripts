# Hints for using ns3
```
cd 
mkdir repos 
cd repos 
hg clone http://code.nsnam.org/ns-3-allinone 
cd ns-3-allinone 
./download.py
./build.py --enable-examples --enable-tests
cd ns-3-dev
./test.py -c core
cd netanim; make clean; qmake NetAnim.pro; make
```
###### Hint 1
- logging and assertions are only available in debug builds. 
- Recommended practice is to develop your scenario in debug mode, then conduct repetitive runs (for statistics or changing parameters) in optimized build profile.- If you have code that should only run in specific build profiles, use the indicated Code Wrapper macro:

```c++NS_BUILD_DEBUG (std::cout << "Part of an output line..." << std::flush; timer.Start ());DoLongInvolvedComputation ();NS_BUILD_DEBUG (timer.Stop (); std::cout << "Done: " << timer << std::endl;)```



###### Hint: multiple builds (deply & run?)
- work with multiple builds simultatiously?
- When you switch, Waf will only compile what it has to, instead of recompiling everything.

```bash
 ./waf configure --build-profile=debug --out=build/debug ./waf build ./waf configure --build-profile=optimized --out=build/optimized ./waf build
```
###### Hint: program arguments
in the background, $s is replaced with name of the program (```<ns3-program>```). From that we can infer the correct use of a debugger.

```bash
$ ./waf --run <ns3-program> --command-template="%s <args>"
```


debugger ```gdb```
```bash
./waf --run=hello-simulator --command-template="gdb %s --args <args>"
```


###### Hint: convention for placement of binaries

```c++
function waff {
	CWD="$PWD"    cd $NS3DIR >/dev/null    ./waf --cwd="$CWD" $*    cd - >/dev/null}

```



# Concepts of ns3
- API found [here](https://www.nsnam.org/docs/release/3.26/doxygen/index.html)

- Node = basic computing device abstraction. Class ```Node```. Think of as of a device such as a computer.
- The ```Application``` class provides methods for managing the representations of our version of user-level applications in simulations. Inherited e.g. b.y ```UdpEchoClientApplication```
- ```Channel``` ~ connection channel in real live(e.g. wire/ ethernet switch) (link between nodes) . Implemented e.g. by ```WifiChannel```
- Protocols
- ```NetDevie```In ns-3 the net device abstraction covers both the software driver and the simulated hardware. A net device is “in- stalled” in a Node in order to enable the Node to communicate with other Nodes in the simulation via Channels. Just as in a real computer, a Node may be connected to more than one Channel via multiple NetDevices (e.g. ```WifiNetDevice```)


Since connecting NetDevices to Nodes, NetDevices to Channels, assigning IP addresses, etc., are such common tasks in ns-3, we provide what we call topology helpers to make this as easy as possible

