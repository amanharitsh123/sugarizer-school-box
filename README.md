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
Windows user can use Etcher(https://etcher.io/) to flash image.

### Some Important Instructions
- Find your sdcard's mount point and replace it with "mmcblk0" while flashing.
- Default ssid is "SugarizerSchoolBox" and passphrase is "sugarizer". These can be changed in image_scripts/hotspot.sh by changing $ssid and $pass variables.
- In the first boot,make sure that pi has a working ethernet connection. Docker images will be loaded and containers will be made, followed by network setup.Pi will reboot as soon as the setup is done, now you can connect to the AP.
- It will take 30-35mins approx for the setting server up.
- After connecting , sugarizer will be accessible at 192.168.42.1:8080. 

### Download Latest Image
Download Link: https://drive.google.com/drive/folders/1Jt8X6kHLJqGvl7gSm7xkM1mMRhPBLWWl?usp=sharing

### Documentation
https://wiki.sugarlabs.org/go/User:Amanharitsh123

### Debugging
Have a look at the dependencies and instructions here : https://github.com/drtyhlpr/rpi23-gen-image
