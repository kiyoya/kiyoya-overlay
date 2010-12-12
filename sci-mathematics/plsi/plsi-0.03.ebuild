# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Probablistic Latent Semantic Indexing"
HOMEPAGE="http://chasen.org/~taku/software/plsi/"
SRC_URI="http://chasen.org/~taku/software/plsi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-stdlib.patch
	epatch "${FILESDIR}"/${P}-sstream.patch
}

src_configure() {
	econf || die
}

src_compile() {
	emake || die
}

src_install() {
	dobin plsi || die
	dodoc AUTHORS ChangeLog INSTALL NEWS README README.ja train || die
}
