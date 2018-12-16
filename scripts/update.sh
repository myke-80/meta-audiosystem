#!/bin/sh

MYRPI_BRANCH="sumo"

if [ -z "$1" ]; then 
	echo "Please provide base folder"
	exit 1
fi
if [ ! -d "$1" ]; then 
	echo "Folder $1 doesn't exists"
	exit 2
fi

SCRIPT_PATH=$(pwd)/$(dirname "$0")
ROOT=${1%/}

if [ ! -d "${ROOT}/poky" ]; then 
	echo "Folder ${ROOT}/poky doesn't exists"
	exit 3
fi

cd ${ROOT}/poky/meta-myrpi
echo Updating Myrpi
git fetch
git checkout ${MYRPI_BRANCH}
git pull
git reset HEAD --hard

${SCRIPT_PATH}/../../../poky/meta-myrpi/scripts/update.sh $1
