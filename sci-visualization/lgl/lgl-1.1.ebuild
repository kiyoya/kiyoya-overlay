# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

MY_PN="LGL"

DESCRIPTION="LGL is a compendium of applications for making the visualization of
large networks and trees tractable."
HOMEPAGE="http://lgl.sourceforge.net/"
SRC_URI="mirror://sourceforge/lgl/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="dev-libs/boost"
DEPEND="${RDEPEND}
	dev-lang/perl"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/${MY_PN}-${PV} "${S}" || die
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc4.3.3.patch

	cd "${S}"/src
	sed -i \
		-e "s:-Wall -O3 -ftemplate-depth-30:-Wall ${CFLAGS} -ftemplate-depth-50:" \
		Makefile || die
}

src_compile() {
	cd "${S}"
	perl setup.pl -i || die
}

src_install() {
	cd "${S}"/bin
	dobin lglayout2D lglayout3D lglbreakup lglrebuild || die
}
