# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="A C++ Locality Sensitive Hashing Library"
HOMEPAGE="http://lshkit.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos ~x86-macos ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="sci-libs/gsl
	>=dev-libs/boost-1.36"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-cmake.patch
	epatch "${FILESDIR}"/${P}-macos.patch
}

src_install() {
	if use test; then
		dobin "${CMAKE_BUILD_DIR}"/bin/* || die
	fi
	dolib.a "${CMAKE_BUILD_DIR}"/lib/liblshkit.a || die
	dodoc INSTALL NEWS README

	insinto /usr/include
	doins -r include/*
}
