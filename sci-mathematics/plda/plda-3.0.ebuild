# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils toolchain-funcs

DESCRIPTION="A parallel C++ implementation of fast Gibbs sampling of Latent Dirichlet Allocation"
HOMEPAGE="http://code.google.com/p/plda/"
SRC_URI="http://plda.googlecode.com/files/plda-3.0.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}

src_prepare() {
	epatch "${FILESDIR}"/${P}-memset.patch

	sed -i \
		-e "s:CC=g++:CC=$(tc-getCXX):" \
		-e "s:CFLAGS=-O3 -Wall -Wno-sign-compare:CFLAGS=${CXXFLAGS}:" \
		Makefile || die
}

src_compile() {
	emake lda infer || die
	cp lda plda-train || die
	cp infer plda-infer  || die
}

src_install() {
	dobin plda-train plda-infer || die
	dodoc README INSTALL || die
}
