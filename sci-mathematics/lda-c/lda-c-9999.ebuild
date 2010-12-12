# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="Latent Dirichlet allocation"
HOMEPAGE="http://www.cs.princeton.edu/~blei/lda-c/"
SRC_URI="http://www.cs.princeton.edu/~blei/lda-c/${PN}-dist.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/lda-c-dist

src_prepare() {
	pwd
	sed -i \
		-e "s/^CC= gcc/CC= $( tc-getCC )/" \
		-e "s/^CFLAGS= -O3 -Wall -g/CFLAGS= ${CFLAGS}/" \
		-e "s/^LDFLAGS= -lm/LDFLAGS= -lm ${LDFLAGS}/" \
		Makefile || die
}

src_compile() {
	emake || die
	mv lda lda-c || die
}

src_install() {
	dobin lda-c || die
	dodoc inf-settings.txt readme.txt settings.txt todo.txt topics.py
}
