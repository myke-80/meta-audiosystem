SECTION = "console/multimedia"
SUMMARY = "Changes the default values for alsa configuration"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://asoundrc"
S = "${WORKDIR}"

do_install() {
    install -d ${D}/home/root
    install -m 0644 asoundrc ${D}/home/root/.asoundrc
}

FILES_${PN} = "/home/root/"
