#!/bin/sh
SCRIPTPATH=$(pwd)/$(dirname "$0")

if [ -z "$1" ]; then 
	echo "Please provide base folder"
	exit 1
fi
if [ ! -d "$1" ]; then 
	echo "Folder $1 doesn't exists"
	exit 2
fi

ROOT=${1%/}

cd ${ROOT}

if [ ! -d "${ROOT}/poky" ]; then
	git clone -b master git://git.yoctoproject.org/poky
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-openembedded" ]; then
	git clone -b master git://git.openembedded.org/meta-openembedded
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-raspberrypi" ]; then
	git clone -b master https://github.com/agherzan/meta-raspberrypi.git
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-qt5" ]; then
	git clone -b master https://github.com/meta-qt5/meta-qt5
fi

cd ${ROOT}/poky

if [ ! -d "${ROOT}/poky/meta-myrpi" ]; then
	git clone -b master https://github.com/myke-80/meta-myrpi
fi

if [ ! -d "${ROOT}/build" ]; then
	mkdir ${ROOT}/build
fi

if [ ! -d "${ROOT}/build/conf" ]; then
	mkdir ${ROOT}/build/conf
	sed -e "s+BASE_PATH+${ROOT}+g" ${SCRIPTPATH}/../conf/bblayers.conf.sample > ${ROOT}/build/conf/bblayers.conf
	sed -e "s+BASE_PATH+${ROOT}+g" ${SCRIPTPATH}/../conf/local.conf.sample > ${ROOT}/build/conf/local.conf 
fi

