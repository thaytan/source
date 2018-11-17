#!/bin/sh

## This script will change the .config file to only build packages that are included in the firmware
## Results in a much faster compile time

sed -e "s/\(.*\)=m/\# \1 is not set/" -i .config

echo "> Done"

