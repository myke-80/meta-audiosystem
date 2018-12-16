FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI_append_raspberrypi0-wifi = " file://brcm43438.service "

do_install_append_raspberrypi0-wifi() {
	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
		install -d ${D}${systemd_unitdir}/system
		install -m 0644 ${WORKDIR}/brcm43438.service ${D}${systemd_unitdir}/system
	fi
}

SYSTEMD_SERVICE_${PN}_append_raspberrypi0-wifi = " brcm43438.service"
