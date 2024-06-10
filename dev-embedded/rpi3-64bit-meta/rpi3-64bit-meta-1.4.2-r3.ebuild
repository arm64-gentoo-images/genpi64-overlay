# Copyright (c) 2017-9 sakaki <sakaki@deciban.com>
# License: GPL v2 or GPL v3+
# NO WARRANTY

EAPI=6

DESCRIPTION="Baseline packages for the gentoo-on-rpi3-64bit image"
HOMEPAGE="https://github.com/GenPi64/gentoo-on-rpi3-64bit"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+boot-fw +kernel-bin +core +xfce pitop apps"
REQUIRED_USE="
	xfce? ( core )
	pitop? ( xfce )
	apps? ( xfce )"

# required by Portage, as we have no SRC_URI...
S="${WORKDIR}"

DEPEND="
	>=sys-apps/openrc-0.40
	>=app-shells/bash-5.0"
RDEPEND="
	${DEPEND}
	kernel-bin? (
		boot-fw? (
			|| (
				>=sys-kernel/bcmrpi3-kernel-bin-4.14.31.20180401[with-matching-boot-fw(-),pitop(-)?]
				>=sys-kernel/bcmrpi3-kernel-bis-bin-4.14.44.20180601[with-matching-boot-fw(-),pitop(-)?]
			)
		)
		!boot-fw? (
			|| (
				>=sys-kernel/bcmrpi3-kernel-bin-4.14.31.20180401[-with-matching-boot-fw(-)]
				>=sys-kernel/bcmrpi3-kernel-bis-bin-4.14.44.20180601[-with-matching-boot-fw(-)]
			)
		)
	)
	!kernel-bin? (
		boot-fw? (
			>=sys-boot/rpi3-64bit-firmware-1.20180328[pitop(-)?,dtbo(+)]
		)
		!boot-fw? (
			!sys-boot/rpi3-64bit-firmware
		)
	)
	>=net-wireless/rpi3-bluetooth-1.1-r6
	>=sys-apps/rpi3-init-scripts-1.1.5
	>=sys-apps/rpi3-ondemand-cpufreq-1.1.1
	>=sys-firmware/b43-firmware-5.100.138
	>=sys-firmware/bluez-firmware-1.2
	>=sys-firmware/brcm43430-firmware-20180402
	core? (
		>=app-admin/logrotate-3.15.0
		>=app-admin/sudo-1.8.27-r1
		>=app-admin/syslog-ng-3.20.1
		>=app-arch/lzop-1.04
		>=app-crypt/gnupg-2.2.16-r1
		>=app-editors/nano-4.2
		>=app-editors/vim-8.1.0648
		>=app-editors/vim-core-8.1.0648
		>=app-misc/screen-4.6.2-r1
		>=app-portage/eix-0.33.7
		>=app-portage/euses-2.5.9
		>=app-portage/gentoolkit-0.4.5
		>=app-portage/mirrorselect-2.2.5
		>=app-portage/porthash-1.0.7
		>=app-portage/showem-1.0.3
		>=app-text/dos2unix-7.4.0
		>=app-text/psutils-1.17-r3
		>=dev-embedded/wiringpi-2.44-r7
		>=dev-libs/elfutils-0.176-r1
		>=dev-python/pip-10.0.1
		>=dev-tcltk/expect-5.45.4
		>=dev-util/strace-5.1
		>=dev-vcs/git-2.22.0
		>=mail-client/mailx-8.1.2.20160123
		>=mail-client/mailx-support-20060102-r2
		>=media-libs/raspberrypi-userland-1.20190114
		>=media-sound/alsa-tools-1.1.7
		>=net-analyzer/iptraf-ng-1.1.4-r2
		>=net-analyzer/nmap-7.70
		>=net-analyzer/tcpdump-4.9.2
		>=net-dialup/lrzsz-0.12.20-r4
		>=net-fs/nfs-utils-2.4.1
		>=net-fs/samba-4.10.4
		>=net-irc/irssi-1.2.0-r2
		>=net-misc/bridge-utils-1.6
		>=net-misc/chrony-3.5
		>=net-misc/dhcpcd-7.2.2
		>=net-misc/iperf-3.6
		>=net-misc/keychain-2.8.5
		>=net-misc/networkmanager-1.16.2
		>=net-misc/rpi3-ethfix-1.0.0-r1
		>=net-vpn/networkmanager-openvpn-1.8.10
		>=net-vpn/openvpn-2.4.7-r1
		>=net-wireless/iw-5.0.1
		|| ( >=sys-apps/util-linux-2.33.2 >=net-wireless/rfkill-0.5-r1 )
		>=net-wireless/rpi3-wifi-regdom-1.0
		>=net-wireless/wireless-tools-30_pre9
		>=net-wireless/wpa_supplicant-2.8-r1
		>=sys-apps/ack-2.28
		>=sys-apps/coreboot-utils-4.6
		>=sys-apps/ethtool-5.1
		>=sys-apps/flashrom-1.0
		>=sys-apps/hdparm-9.58
		>=sys-apps/i2c-tools-4.1-r1
		>=sys-apps/me_cleaner-1.2
		>=sys-apps/mlocate-0.26-r2
		>=sys-apps/rng-tools-6.7-r1
		>=sys-apps/rpi3-expand-swap-1.0-r4
		>=sys-apps/rpi3-i2cdev-1.0.1-r1
		>=sys-apps/rpi3-spidev-1.0.0
		>=sys-apps/rpi3-zswap-1.0-r1
		>=sys-apps/smartmontools-7.0-r1
		>=sys-apps/usbutils-012
		>=sys-devel/clang-8.0.0
		>=sys-fs/btrfs-progs-5.1.1
		>=sys-fs/dosfstools-4.1
		>=sys-fs/eudev-3.2.8
		>=sys-fs/f2fs-tools-1.12.0-r1
		>=sys-fs/fuse-2.9.9
		>=sys-fs/multipath-tools-0.8.1
		>=sys-fs/ncdu-1.14
		>=sys-fs/zerofree-1.0.4
		>=sys-power/powertop-2.10
		>=sys-process/cronie-1.5.4
		>=sys-process/htop-2.2.0
		>=sys-process/iotop-0.6
	)
	xfce? (
		>=app-arch/xarchiver-0.5.4.14
		>=app-accessibility/onboard-1.4.1
		>=app-emulation/qemu-4.0.0-r3
		>=app-misc/mc-4.8.22
		>=app-office/orage-4.12.1-r1
		>=media-fonts/cantarell-0.111
		>=media-fonts/croscorefonts-1.31.0
		>=media-fonts/fontawesome-5.1.0
		>=media-fonts/libertine-5.3.0.20120702-r3
		>=media-fonts/ttf-bitstream-vera-1.10-r3
		>=media-libs/gst-plugins-bad-1.14.3
		>=media-libs/mesa-19.1.0
		>=media-tv/v4l-utils-1.16.3-r1
		>=media-video/pi-ffcam-1.0.0
		>=media-video/pi-ffplay-1.0.3-r1
		>=net-wireless/blueman-2.0.4-r1
		>=sci-calculators/qalculate-gtk-2.8.1
		>=sci-calculators/speedcrunch-0.12.0
		>=sys-apps/firejail-0.9.56-r1
		>=sys-apps/pyconfig_gen-1.0.2
		>=x11-apps/mesa-progs-8.4.0
		>=x11-apps/xclock-1.0.8
		>=x11-apps/xdm-1.1.12
		>=x11-apps/xev-1.2.3
		>=x11-apps/xmodmap-1.0.10
		>=x11-apps/xsetroot-1.1.2
		>=x11-base/xorg-server-1.20.5
		>=x11-misc/lightdm-1.30.0
		>=x11-misc/lightdm-gtk-greeter-2.0.6
		>=x11-misc/rpi3-safecompositor-1.0.2
		>=x11-misc/twofing-0.1.2-r2
		>=x11-misc/xdiskusage-1.51
		>=x11-terms/xfce4-terminal-0.8.7.4
		>=x11-terms/xterm-337
		>=xfce-base/xfce4-meta-4.12-r1
		>=xfce-extra/thunar-archive-plugin-0.4.0
		>=xfce-extra/thunar-volman-0.9.2
		>=xfce-extra/tumbler-0.2.4
		>=xfce-extra/xfce4-alsa-plugin-0.1.1
		>=xfce-extra/xfce4-cpufreq-plugin-1.2.1
		>=xfce-extra/xfce4-cpugraph-plugin-1.0.5-r3
		>=xfce-extra/xfce4-fixups-rpi3-1.0.4
		>=xfce-extra/xfce4-indicator-plugin-2.3.3-r2
		>=xfce-extra/xfce4-mixer-4.99.0-r1
		>=xfce-extra/xfce4-noblank-1.0.0-r2
		>=xfce-extra/xfce4-notes-plugin-1.8.1-r1
		>=xfce-extra/xfce4-power-manager-1.6.2
		>=xfce-extra/xfce4-screenshooter-1.9.5
		>=xfce-extra/xfce4-systemload-plugin-1.2.2
		>=xfce-extra/xfce4-taskmanager-1.2.2
	)
	pitop? (
		>=dev-embedded/pitop-speaker-1.1.0.1
		>=sys-apps/pitop-poweroff-1.0.2-r5
		>=xfce-extra/xfce4-battery-plugin-1.1.0-r2[pitop]
		>=xfce-extra/xfce4-keycuts-pitop-1.0.2
	)
	apps? (
		>=app-arch/p7zip-16.02-r4
		>=app-crypt/seahorse-3.30.1.1
		>=app-editors/emacs-26.2
		>=app-editors/mousepad-0.4.1
		>=app-office/libreoffice-6.2.4.2
		>=app-office/libreoffice-l10n-6.2.4.2
		>=app-portage/porthole-0.6.1-r6
		>=app-text/evince-3.32.0
		>=dev-util/meld-3.20.1
		>=mail-client/claws-mail-3.17.3-r1
		>=mail-client/thunderbird-60.7.0
		>=media-gfx/fotoxx-18.01.3
		>=media-gfx/gimp-2.10.10-r1
		>=media-gfx/ristretto-0.8.4
		>=media-sound/clementine-1.3.1_p20190127
		>=media-sound/mpc-0.31-r1
		>=media-sound/mpd-0.21.10
		>=media-tv/kodi-18.0
		>=media-video/mplayer-1.3.0-r5
		>=media-video/mpv-0.27.2
		>=media-video/smplayer-19.5.0
		>=media-video/vlc-3.0.7
		>=net-irc/hexchat-2.14.2
		>=net-p2p/transmission-2.94
		>=sys-apps/gnome-disk-utility-3.30.2-r1
		>=www-client/chromium-74.0.3729.169-r1
		>=www-client/firefox-67.0
		>=www-client/links-2.18
		dev-java/icedtea:8
	)
"

src_install() {
	# basic framework file to enable / disable USE flags for this package
	insinto "/etc/portage/package.use/"
	newins "${FILESDIR}/package.use_${PN}-2" "${PN}"
}

pkg_postinst() {
	# ensure we have at least a system JVM set (if javac installed)
	if [ -e /usr/bin/javac ] && ! /usr/bin/javac -version &>/dev/null; then
		if eselect java-vm set system 1 &>/dev/null; then
			ewarn "Your JVM setup is now as follows:"
			ewarn "$(eselect java-vm show)"
			ewarn "Please modify (using eselect java-vm set ...) if incorrect"
		fi
	fi
}
