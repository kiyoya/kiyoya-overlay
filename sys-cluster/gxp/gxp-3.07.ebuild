# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION=""
HOMEPAGE="http://www.logos.t.u-tokyo.ac.jp/gxp/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dodir /opt/${P}
	cp -R "${S}/" "${D}/opt/" || die
	dodir /usr/bin
	ln -s /opt/${PR}/gxpc "${D}/usr/bin/gxpc" || die
}
