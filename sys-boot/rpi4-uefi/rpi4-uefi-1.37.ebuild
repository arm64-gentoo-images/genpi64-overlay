EAPI=7

DESCRIPTION="UEFI firmware for Raspberry Pi 4"
HOMEPAGE="https://github.com/pftf/RPi4"
SRC_URI="https://github.com/pftf/${PN}/releases/download/v${PV}/${PN}_UEFI_Firmware_v${PV}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm64"
DEPEND="app-arch/unzip"
RDEPEND="!sys-boot/rpi5-uefi"

src_install() {
    insinto /boot/efi
    doins "${WORKDIR}"/*
}
