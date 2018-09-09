


# Find modules for devices
## a) from a running, completely functional kernel
Execute `detectModulesFromWorkingKernel.sh` (e.g. with root privileges for
making sure everything is detected, but non-root should also be sufficient).

### General steps
For finding out which network interface card currently is in used
1. Find the network device name of interest `ls /sys/class/net`, Check if the 
    interface is up and running; `ip addr`
2. Find the module name ```basename `readlink /sys/class/net/wlp48s0/device/driver/module```
3. Find the kernel configuration controlling it.
4. enable it in the settings ;)

Perform that for each entry in `lsusb`, each network device and each device
inside lspci.


### Example
#### Step 1) Interface name
Find interfaces, start with for instance the wifi interface device:
```bash
> ls /sys/class/net/
(...)
enp0s31f6
```
The `ip addr` command shows that it's an ethernet devic having valid ip
addresses assigned.
```bash 
> ip addr
(...)
2: wlp58s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1440 qdisc mq state UP group default qlen 1000
    link/ether f8:59:71:49:99:4f brd ff:ff:ff:ff:ff:ff
    inet 172.18.77.14/16 brd 172.18.255.255 scope global dynamic noprefixroute wlp58s0
       valid_lft 2925sec preferred_lft 2925sec
    inet6 fe80::42ba:57e9:51ae:544e/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
``` 

#### Step 2) Module name
The device module is referenced in the directory `device/driver/module` located
in the aforementioned device's directory (`/sys/class/net/[iface_name]`). The
reference points to the general devices directory `/sys/devices`
```bash
>ls /sys/class/net/wlp58s0 -la | grep device
lrwxrwxrwx 1 root root 0 Aug 24 23:35 /sys/class/net/wlp58s0 -> /sys/devices/pci0000:00/0000:00:1c.2/0000:3a:00.0/net/wlp58s0
```
For finding out which module is used, follow the symlink and strip the path:
```bash
> basename `readlink /sys/class/net/wlp48s0/device/driver/module`
iwlwifi
```
Thus the module `iwlwifi` controls the module of interest.


#### Step 3) Detect corresponding configuration option
- find -type f -name Makefile | xargs grep e1000 | grep CONFIG_


#### Step 4) 
- Enable the configuration in the kernel configuration
- Location of kernel configuration in distribution kernel `/proc/config.gz`












## b) from scratch
### PCI devices

