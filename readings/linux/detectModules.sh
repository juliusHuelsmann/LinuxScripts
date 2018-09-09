
#!/bin/bash

# This scripts allows for semi-automatic detection of modules to be activated
# when installing a custom kernel build in linux.
# Each output is printed to CLI and the resulting configuration has to be
# entered into the kernel makeconfig.

function getModule {
  verbose=false
  LINUX_SRC_DIR="/mnt/os2/usr/src/linux/"
  name=$1
  ifces="${@:2}"
  for ifce in $ifces; do

    if [[ -e /sys/class/net/$ifce/device/driver/module ]]; then
    module=$(basename `readlink /sys/class/net/$ifce/device/driver/module`)
    cfgs=$(find $LINUX_SRC_DIR -type f -name Makefile | xargs grep $module | grep CONFIG_)
    if $verbose; then
      echo -e " [i] $name interface $ifce: $module"
    fi
    echo -e "$module\n$cfgs\n"
  else
    if $verbose; then
      echo -e " [a] $name interface $ifce: no module found"
    fi
  fi


  done
}


#getModule "network" $(ls /sys/class/net)
