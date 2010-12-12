# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="a Latent Dirichlet Allocation Package"
HOMEPAGE="http://chasen.org/~daiti-m/dist/lda/"
SRC_URI="http://chasen.org/~daiti-m/dist/lda/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s/^CC	= gcc/CC	= $(tc-getCC)/" \
		-e "s/^CFLAGS	= -O3/CFLAGS	= ${CFLAGS}/" \
		-e "s/^LDFLAGS	= -lm/LDFLAGS	= -lm ${LDFLAGS}/" \
		Makefile || die
}

src_compile() {
	emake || die
}

src_install() {
	dobin lda || die
	dodoc AUTHOR README train || die
}
