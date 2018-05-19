#!/bin/bash

#Checking for root permissions
if (( $EUID )); then
   echo "This script must be run as root" 
   exit 1
fi

echo "Starting Script"

cd build

if [ ! -d "custom.d" ]; then
  mkdir custom.d
fi
 

#Copying Scripts from ./scripts to /build/custom.d
find ../scripts -type f -name \* -exec cp {} ./custom.d/ \;

#Starting the Build Script
CONFIG_TEMPLATE="rpi3stretch-sugarizer" ./rpi*

rm -r custom.d
cd ..

if [ ! -d "images" ]; then
  mkdir images
fi


mv build/images/*.img ./images/
mv build/images/*.b* ./images/

rm -r build/images
