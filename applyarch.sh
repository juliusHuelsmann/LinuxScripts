#!/bin/bash

# Include the x-copy script that can be used for 
# copying only in case the edit-timestamp of the
# file to be overwritten is newer.
source cpUtils.sh


#
# Defintion of the location of the cofiguration
# source and destination.
source archconfig.sh


#
# Execute the actual copy command.
cp2conf $conQute $locQute 




