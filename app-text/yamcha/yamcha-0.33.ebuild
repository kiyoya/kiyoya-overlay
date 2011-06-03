# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3

inherit eutils

DESCRIPTION="Yet Another Multipurpose CHunk Annotator"
HOMEPAGE="http://chasen.org/~taku/software/yamcha/"
SRC_URI="http://chasen.org/~taku/software/yamcha/src/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE=""

RDEPEND="sci-misc/tinysvm
	dev-lang/perl"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc43.ebuild
}

src_test() {
	make check || die
}

src_install() {
	make DESTDIR=${D} install || die

	dodoc AUTHORS README
}
