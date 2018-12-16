SUMMARY = "OpenAL is a cross-platform 3D audio API"
HOMEPAGE = "http://kcat.strangesoft.net/openal.html"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"

inherit cmake pkgconfig

SRC_URI = "https://github.com/kcat/openal-soft/archive/${BP}.tar.gz"
SRC_URI[md5sum] = "a714a3ee1a5d5e2d963f996bc9af50f2"
SRC_URI[sha256sum] = "ad9095f0b9b62903f3a43e2c7df429a44d563aa0c93f7931338ab8fc4035b5c4"

S = "${WORKDIR}/${BPN}-${BPN}-${PV}"

PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
PACKAGECONFIG[pulseaudio] = "-DPULSEAUDIO=TRUE, -DPULSEAUDIO=FALSE, pulseaudio"
# currently doesn't work with libav-9
# PKG_CHECK_MODULES(FFMPEG libavcodec>=53.61.100 libavformat>=53.32.100 libavutil>=51.35.100)
# but alffmpeg.c:418:44: error: 'AV_CH_LAYOUT_MONO' undeclared (first use in this function)
PACKAGECONFIG[examples] = "-DEXAMPLES=TRUE, -DEXAMPLES=FALSE, libav"

FILES_${PN} += "${datadir}/openal"