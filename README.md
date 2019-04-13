# meta-audiosystem

meta-audiosystem is a personal layer to be applied over image meta-myrpi to have a car system audio

## Dependencies

This rpi layer depends on:

* URI: git://git.yoctoproject.org/poky
  * branch: master

* URI: git://git.openembedded.org/meta-openembedded
  * layers: meta-oe, meta-multimedia, meta-networking, meta-python
  * branch: master

* URI: git://github.com/agherzan/meta-raspberrypi (fine for u-boot)
  * layers: meta-raspberrypi
  * branch: master

* URI: git://github.com/meta-qt5/meta-qt5
  * layers: meta-qt5
  * branch: master

* URI: git://github.com/myke-80/meta-myrpi
  * layers: meta-rpi
  * branch: master

## How to build 

1. Download all dependencies
2. source poky/oe-init-build-env build
3. Set local.conf with all dependency layers
4. bitbake rpi-audiosystem-image
5. dd the rpi-sdimage file into an sd-card

## Devices

This images were installed in a rpi zero w.

## Last build with

meta                 
meta-poky            
meta-yocto-bsp       = "sumo:84b78df15ff77b2fe2aeb62fcaa265dce7ebfbbb"
meta-oe              
meta-networking      
meta-multimedia      
meta-python          = "sumo:8760facba1bceb299b3613b8955621ddaa3d4c3f"
meta-raspberrypi     = "sumo:2d40b000021bc8a9ef7f329ed0ad410f8d227b97"
meta-qt5             = "sumo:d4e7f73d04e8448d326b6f89908701e304e37d65"
meta-myrpi           = "sumo:f72a40ace43e6da0a27c7db190811a7e6591e6be"
