# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit multilib eutils

DESCRIPTION="Canon LIPS4 Printer Driver"
HOMEPAGE="http://www.canon.com/"
SRC_URI="http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMTM1MTAz&cmp=ACM&lang=JA -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=net-print/cndrvcups-common-2.10"

src_configure() {
	for i in driver pstolipscpca ppd; do
		pushd ${i}
		NOCONFIGURE=1 ./autogen.sh
		econf \
			--libdir=/usr/libexec
		popd
	done
}

src_compile() {
	for i in driver pstolipscpca ppd; do
		pushd ${i}
		emake
	done
}

src_install() {
	emake install DESTDIR=${D}
}
