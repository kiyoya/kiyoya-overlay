# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit eutils distutils flag-o-matic toolchain-funcs

SRC_URI="http://downloads.skewed.de/${PN}/${P}.tar.bz2"
DESCRIPTION="An efficient python module for manipulation and statistical analysis of graphs."
HOMEPAGE="http://graph-tool.skewed.de/"
LICENSE="GPL-3"

SLOT="0"
IUSE="openmp"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

DEPEND=">=sys-devel/gcc-4.4
	>=dev-lang/python-2.5
	dev-libs/boost
	sci-libs/scipy
	sci-mathematics/cgal"

RDEPEND="${CDEPEND}
	media-gfx/graphviz[python]
	dev-python/matplotlib"

DOCS="README NEWS COPYING Changelog"

# most people won't have enough ram for parallel build
MAKEOPTS="-j1" 

src_configure() {
	econf $(use_enable openmp)
}

src_compile() {
	emake || die
}