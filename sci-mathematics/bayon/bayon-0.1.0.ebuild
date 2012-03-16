# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=4

DESCRIPTION="A simple and fast clustering tool"
HOMEPAGE="http://code.google.com/p/bayon/"
SRC_URI="http://bayon.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-ldpath.patch || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README TODO
}
