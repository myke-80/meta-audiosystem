SECTION = "multimedia"
SUMMARY = "A stable, documented, asynchronous API library for interfacing MPD in the C, C++ & Objective C languages"
HOMEPAGE = "http://www.musicpd.org/libs/libmpdclient/"

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
PR = "r0"

SRC_URI="http://www.musicpd.org/download/libmpdclient/2/${BP}.tar.xz"
SRC_URI[md5sum] = "2a870c73a0b87183e944d2eb89e4411b"
SRC_URI[sha256sum] = "fa6bdab67c0e0490302b38f00c27b4959735c3ec8aef7a88327adb1407654464"

EXTRA_OECONF="--disable-documentation"

inherit meson

do_install_append () {
    find "${D}" -name 'vala' -exec rm -fr {} +
}
