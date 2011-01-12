# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION=""
HOMEPAGE="http://www.logos.t.u-tokyo.ac.jp/gxp/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dodir /opt/
	cp -R "${S}" "${ED}/opt" || die

	dodir /usr/bin
	ln -s ${EPREFIX}/opt/${P}/gxpc "${ED}/usr/bin/gxpc" || die
}
