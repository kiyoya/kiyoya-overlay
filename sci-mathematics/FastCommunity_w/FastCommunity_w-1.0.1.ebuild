# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="The fast modularity maximization algorithm (weighted version)"
HOMEPAGE="http://www.cs.unm.edu/~aaron/research/fastmodularity.htm"
SRC_URI="http://www.cs.unm.edu/~aaron/research/${PN}_GPL_v${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}_GPL_v${PV}

src_prepare() {
	epatch "${FILESDIR}"/${PF}-gcc.patch
	epatch "${FILESDIR}"/${PN}-ignore_ext.patch
	sed -i \
		-e "s:-O3 -fomit-frame-pointer -funroll-loops -fforce-mem -fforce-addr -fexpensive-optimizations:${CFLAGS}:" \
		-e "s:^LDFLAGS = :LDFLAGS = ${LDFLAGS}:" \
		Makefile || die
}

src_compile() {
	emake || die
}

src_install() {
	dobin FastCommunity_wMH || die
}
