# Copyright (c) 2017-8 sakaki <sakaki@deciban.com>
# License: GPL v2 or GPL v3+
# NO WARRANTY

EAPI=6

DESCRIPTION="Baseline packages for the gentoo-on-rpi3-64bit image"
HOMEPAGE="https://github.com/GenPi64/gentoo-on-rpi3-64bit"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+boot-fw +kernel-bin -porthash +weekly-genup +core +xfce pitop apps"
REQUIRED_USE="
	xfce? ( core )
	pitop? ( xfce )
	apps? ( xfce )"

# required by Portage, as we have no SRC_URI...
S="${WORKDIR}"

DEPEND="
	>=sys-apps/openrc-0.21
	>=app-shells/bash-4.0"
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
			>=sys-boot/rpi3-64bit-firmware-1.20180328[pitop(-)?]
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
	porthash? (
		<sys-apps/portage-2.3.49
		>=app-portage/rpi3-check-porthash-1.0.0-r3
	)
	!porthash? (
		!app-portage/rpi3-check-porthash
		>=sys-apps/portage-2.3.49
	)
	weekly-genup? ( >=app-portage/weekly-genup-1.1.0-r2 )
	!weekly-genup? ( !app-portage/weekly-genup )
	core? (
		>=app-admin/logrotate-3.14.0
		>=app-admin/sudo-1.8.25_p1
		>=app-admin/syslog-ng-3.17.2
		>=app-arch/lzop-1.04
		>=app-crypt/gnupg-2.2.10
		>=app-editors/nano-3.0-r1
		>=app-editors/vim-8.1.0034
		>=app-editors/vim-core-8.1.0034
		>=app-misc/screen-4.6.2
		>=app-portage/eix-0.33.2
		>=app-portage/euses-2.5.9
		>=app-portage/gentoolkit-0.4.2-r1
		>=app-portage/genup-1.0.16
		>=app-portage/mirrorselect-2.2.3
		>=app-portage/porthash-1.0.7
		>=app-portage/showem-1.0.3
		>=app-text/dos2unix-7.4.0
		>=app-text/psutils-1.17-r3
		>=dev-embedded/wiringpi-2.44-r7
		>=dev-libs/elfutils-0.173
		>=dev-python/pip-10.0.1
		>=dev-tcltk/expect-5.45
		>=dev-util/strace-4.24
		>=dev-vcs/git-2.19.0
		>=mail-client/mailx-8.1.2.20160123
		>=mail-client/mailx-support-20060102-r2
		>=media-libs/raspberrypi-userland-1.20170721-r1
		>=media-sound/alsa-tools-1.1.6
		>=net-analyzer/iptraf-ng-1.1.4-r2
		>=net-analyzer/nmap-7.70
		>=net-analyzer/tcpdump-4.9.2
		>=net-dialup/lrzsz-0.12.20-r4
		>=net-fs/nfs-utils-2.3.3
		>=net-fs/samba-4.9.0
		>=net-irc/irssi-1.1.1-r1
		>=net-misc/bridge-utils-1.6
		>=net-misc/chrony-3.4_pre1-r2
		>=net-misc/dhcpcd-7.0.8
		>=net-misc/iperf-3.6
		>=net-misc/keychain-2.8.5
		>=net-misc/networkmanager-1.12.2
		>=net-misc/networkmanager-openvpn-1.8.4
		>=net-misc/rpi3-ethfix-1.0.0
		>=net-vpn/openvpn-2.4.6
		>=net-wireless/iw-4.14
		|| ( >=sys-apps/util-linux-2.32.1 >=net-wireless/rfkill-0.5-r1 )
		>=net-wireless/rpi3-wifi-regdom-1.0
		>=net-wireless/wireless-tools-30_pre9
		>=net-wireless/wpa_supplicant-2.6-r3
		>=sys-apps/ack-2.22
		>=sys-apps/coreboot-utils-4.6
		>=sys-apps/ethtool-4.18
		>=sys-apps/flashrom-1.0
		>=sys-apps/hdparm-9.56
		>=sys-apps/i2c-tools-4.0
		>=sys-apps/me_cleaner-1.2
		>=sys-apps/mlocate-0.26-r2
		>=sys-apps/rng-tools-6.3.1
		>=sys-apps/rpi3-expand-swap-1.0-r1
		>=sys-apps/rpi3-zswap-1.0-r1
		>=sys-apps/smartmontools-6.6-r1
		>=sys-apps/usbutils-010-r1
		>=sys-devel/clang-6.0.1
		>=sys-devel/distcc-3.2_rc1-r5
		>=sys-fs/btrfs-progs-4.17.1
		>=sys-fs/dosfstools-4.1
		>=sys-fs/eudev-3.2.5
		>=sys-fs/f2fs-tools-1.10.0
		>=sys-fs/fuse-2.9.8
		>=sys-fs/multipath-tools-0.7.7
		>=sys-fs/zerofree-1.0.4
		>=sys-power/powertop-2.9
		>=sys-process/cronie-1.5.2
		>=sys-process/htop-2.2.0
		>=sys-process/iotop-0.6
	)
	xfce? (
		>=app-arch/xarchiver-0.5.4.13
		>=app-accessibility/onboard-1.4.1
		>=app-emulation/qemu-3.0.0
		>=app-office/orage-4.12.1-r1
		>=media-fonts/cantarell-0.101
		>=media-fonts/croscorefonts-1.31.0
		>=media-fonts/fontawesome-5.1.0
		>=media-fonts/libertine-5.3.0.20120702-r2
		>=media-fonts/ttf-bitstream-vera-1.10-r3
		>=media-libs/mesa-18.2.0-r1
		>=net-wireless/blueman-2.0.4-r1
		>=sci-calculators/qalculate-gtk-2.2.0
		>=sci-calculators/speedcrunch-0.12.0
		>=sys-apps/firejail-0.9.54
		>=x11-apps/mesa-progs-8.3.0
		>=x11-apps/xclock-1.0.7
		>=x11-apps/xdm-1.1.11-r3
		>=x11-apps/xev-1.2.2
		>=x11-apps/xmodmap-1.0.9
		>=x11-apps/xsetroot-1.1.2
		>=x11-base/xorg-server-1.20.1
		>=x11-misc/lightdm-1.28.0
		>=x11-misc/lightdm-gtk-greeter-2.0.6
		>=x11-misc/rpi3-safecompositor-1.0.0
		>=x11-misc/rpi3-safecursor-1.0.1
		>=x11-misc/twofing-0.1.2-r2
		>=x11-misc/xdiskusage-1.51
		>=x11-terms/xfce4-terminal-0.8.7.4
		>=x11-terms/xterm-333
		>=xfce-base/xfce4-meta-4.12-r1
		>=xfce-extra/thunar-archive-plugin-0.4.0
		>=xfce-extra/thunar-volman-0.9.0
		>=xfce-extra/tumbler-0.2.3
		>=xfce-extra/xfce4-alsa-plugin-0.1.1
		>=xfce-extra/xfce4-cpufreq-plugin-1.2.0
		>=xfce-extra/xfce4-cpugraph-plugin-1.0.5-r1
		>=xfce-extra/xfce4-fixups-rpi3-1.0.4
		>=xfce-extra/xfce4-indicator-plugin-2.3.3-r2
		>=xfce-extra/xfce4-mixer-4.99.0-r1
		>=xfce-extra/xfce4-notes-plugin-1.8.1
		>=xfce-extra/xfce4-power-manager-1.6.1
		>=xfce-extra/xfce4-screenshooter-1.9.3
		>=xfce-extra/xfce4-systemload-plugin-1.2.1
		>=xfce-extra/xfce4-taskmanager-1.2.1
	)
	pitop? (
		>=dev-embedded/pitop-speaker-1.1.0.1
		>=sys-apps/pitop-poweroff-1.0.2-r5
		>=xfce-extra/xfce4-battery-plugin-1.1.0-r1[pitop]
		>=xfce-extra/xfce4-keycuts-pitop-1.0.1
	)
	apps? (
		>=app-arch/p7zip-16.02-r4
		>=app-crypt/seahorse-3.20.0
		>=app-editors/emacs-26.1-r3
		>=app-editors/mousepad-0.4.0-r1
		>=app-office/libreoffice-6.0.6.2
		>=app-office/libreoffice-l10n-6.0.6.2
		>=app-portage/porthole-0.6.1-r6
		>=app-text/evince-3.28.2
		>=dev-util/meld-3.18.2
		>=mail-client/claws-mail-3.17.1
		>=mail-client/thunderbird-60.0-r2
		>=media-gfx/fotoxx-18.01.3
		>=media-gfx/gimp-2.10.4
		>=media-gfx/ristretto-0.8.3
		>=media-sound/clementine-1.3.1_p20180523
		>=media-sound/mpc-0.30
		>=media-sound/mpd-0.20.21
		>=media-tv/kodi-17.4_rc1
		>=media-video/mplayer-1.3.0-r5
		>=media-video/smplayer-18.6.0
		>=media-video/vlc-3.0.4
		>=net-irc/hexchat-2.14.2
		>=sys-apps/gnome-disk-utility-3.24.1
		>=sys-devel/portage-distccmon-gui-1.0
		>=www-client/firefox-61.0-r1
		>=www-client/links-2.17
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
	# migrate to appropriate sync-uri automatically, and force a sync
	# next time if we do, by deleting /usr/portage/metadata/timestamp.chk
	# (this is to ensure repo.hash{,.asc} gets added or removed, as
	# required)
	local RCONPATH="${ROOT%/}/etc/portage/repos.conf/gentoo.conf"
	if [ -e "${RCONPATH}" ]; then
		if use porthash && grep -q 'rsync://isshoni.org/gentoo-portage-pi64-gem$' "${RCONPATH}"; then
			sed -i 's#rsync://isshoni.org/gentoo-portage-pi64-gem$#rsync://isshoni.org/gentoo-portage-pi64#' "${RCONPATH}"
			rm -fv "${ROOT%/}/usr/portage/metadata/timestamp.chk"
			ewarn "This install has substituted:"
			ewarn " rsync://isshoni.org/gentoo-portage-pi64"
			ewarn "in place of:"
			ewarn " rsync://isshoni.org/gentoo-portage-pi64-gem"
			ewarn "as your gentoo repo's sync-uri"
			ewarn "in ${RCONPATH}."
			ewarn "The timestamp.chk file has also been deleted, to force"
			ewarn "this repo to sync next time you run genup."
		elif grep -q 'rsync://isshoni.org/gentoo-portage-pi64$' "${RCONPATH}"; then
			sed -i 's#rsync://isshoni.org/gentoo-portage-pi64$#rsync://isshoni.org/gentoo-portage-pi64-gem#' "${RCONPATH}"
			rm -fv "${ROOT%/}/usr/portage/metadata/timestamp.chk"
			ewarn "This install has substituted:"
			ewarn " rsync://isshoni.org/gentoo-portage-pi64-gem"
			ewarn "in place of:"
			ewarn " rsync://isshoni.org/gentoo-portage-pi64"
			ewarn "as your gentoo repo's sync-uri"
			ewarn "in ${RCONPATH}"
			ewarn "The timestamp.chk file has also been deleted, to force"
			ewarn "this repo to sync next time you run genup."
			rm -fv "${ROOT%/}/usr/portage"{,/local}"/repo.hash"{,.asc}
			ewarn "Any repo.hash{,.asc} files have also been deleted."
		fi
	else
		if use porthash; then
			ewarn "Please ensure you are using the following gentoo sync-uri:"
			ewarn "rsync://isshoni.org/gentoo-portage-pi64"
		fi
		# otherwise assume user knows what they are doing and is using the
		# main gentoo repo or similar
	fi
}
