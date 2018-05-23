# Sugarizer Linux Image For RPi Gen Script
## Introduction
This script is a fork of https://github.com/drtyhlpr/rpi23-gen-image. we have customized it accordingly to make a Sugarizer Client
and Sugarizer Server ready raspbian image for rpi2/3.

## Usage 

```shell
cd sugarizer-school-box
sudo sh run.sh
```

## Flashing The Generated Raspbian Image

```shell
bmaptool copy ./images/*.img /dev/mmcblk0
```
### Note
Find your sdcard's mount point and replace it with "mmcblk0" while flashing.

### Debugging
Have a look at the dependencies and instructions here : https://github.com/drtyhlpr/rpi23-gen-image