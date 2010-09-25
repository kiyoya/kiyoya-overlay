# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib eutils

DESCRIPTION="Common files for the Canon CUPS Capt driver"
HOMEPAGE="http://cweb.canon.jp/drv-upd/lasershot/linux/lipssource.html"
SRC_URI="http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMTM0OTAz&cmp=ACM&lang=JA -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-cngplp"

DEPEND="net-print/cups
	=x11-libs/gtk+-2*
	x11-libs/cairo
	x11-libs/pango"

dir=/usr/$(get_libdir)
CNGPLP=""

QA_TEXTRELS="${dir:1}/libcaepcm.so.1.0
	${dir:1}/libc3pl.so.0.0.1
	${dir:1}/libcnlbcm.so.1.0
	${dir:1}/libcaiousb.so.1.0.0"

src_configure(){
	if hasuse cngplp; then CNGPLP="cngplp"; fi
	for i in buftool ${CNGPLP}; do
		cd ${i}
		NOCONFIGURE=1 ./autogen.sh
		econf
		cd ..
	done
	cd cpca
	NOCONFIGURE=1 ./autogen.sh
	econf --enable-shared --disable-static
	cd ..
}

src_compile() {
	for i in buftool cpca c3plmod_ipc ${CNGPLP}; do
		cd ${i}
		emake
		cd ..
	done
}

src_install() {
	for i in buftool cpca ${CNGPLP}; do
		cd ${i}
		make install DESTDIR=${D} || die "make install failed for ${i}" 
		cd ..
	done

	OABI=${ABI}
	has_multilib_profile && ABI="x86"
	for i in $(cd libs; ls *.so.?.?.?; cd ..); do
		dolib.so libs/${i}
		dosym ${i} /usr/$(get_libdir)/${i%.?}
		dosym ${i} /usr/$(get_libdir)/${i%.?.?}
		dosym ${i} /usr/$(get_libdir)/${i%.?.?.?}
	done
	for i in $(cd libs; ls *.so.?.?; cd ..); do
		dolib.so libs/${i}
		dosym ${i} /usr/$(get_libdir)/${i%.?}
		dosym ${i} /usr/$(get_libdir)/${i%.?.?}
	done

	dolib.so c3plmod_ipc/libcanonc3pl.so.1.0.0
	dosym  libcanonc3pl.so.1.0.0 /usr/$(get_libdir)/libcanonc3pl.so.1.0
	dosym  libcanonc3pl.so.1.0.0 /usr/$(get_libdir)/libcanonc3pl.so.1
	dosym  libcanonc3pl.so.1.0.0 /usr/$(get_libdir)/libcanonc3pl.so
	
	dobin libs/cnpkmodule
	dobin libs/c3pldrv

	ABI=${OABI}

	insinto /usr/share/caepcm
	doins data/*


	dodoc LICENSE-common-*.txt README
	for i in buftool cpca c3plmod_ipc ${CNGPLP}; do
		docinto ${i}
		dodoc ${i}/NEWS ${i}/README ${i}/AUTHORS ${i}/ChangeLog
	done
	docinto buftool
	dodoc buftool/LICENSE.txt
}
