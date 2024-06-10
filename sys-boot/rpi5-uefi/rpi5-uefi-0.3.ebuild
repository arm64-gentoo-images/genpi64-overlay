EAPI=7

DESCRIPTION="UEFI firmware for Raspberry Pi 5"
HOMEPAGE="https://github.com/worproject/rpi5-uefi"
SRC_URI="https://github.com/worproject/${PN}/releases/download/v${PV}/${PN}_Release_v${PV}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm64"
DEPEND="app-arch/unzip"
RDEPEND="!sys-boot/rpi4-uefi"

src_install() {
    insinto /boot/efi
    doins "${WORKDIR}"/*
}

