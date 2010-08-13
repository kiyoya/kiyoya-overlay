# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

MY_PN="Divisi2"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Divisi is a library for reasoning by analogy and association over
semantic networks, including common sense knowledge."
HOMEPAGE="http://divisi.media.mit.edu/"
SRC_URI="http://pypi.python.org/packages/source/D/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="2"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="dev-python/numpy"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_compile() {
	cd "${WORKDIR}"/${MY_P}
	distutils_src_compile
}

src_install() {
	cd "${WORKDIR}"/${MY_P}
	distutils_src_install
}
