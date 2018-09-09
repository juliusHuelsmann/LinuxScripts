#!/bin/bash

# Detects all modules that are currently in use and tied to specific hardware.
# In case 
#   1) new hardware is added to the machine
#   2) some features / devices do not work on the current version of linux
#      (livecd or distro)
# this is not sufficient.


for i in `find /sys/ -name modalias -exec cat {} \;`; do
    /sbin/modprobe --config /dev/null --show-depends $i 2> /dev/null;
done | rev | cut -f 1 -d '/' | rev | sort -u 
