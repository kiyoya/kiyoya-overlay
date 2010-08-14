# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="Python module for convex optimization"
HOMEPAGE="http://abel.ee.ucla.edu/cvxopt/"
SRC_URI="http://abel.ee.ucla.edu/src/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="fftw glpk gsl" # dsdp mosek

DEPEND="dev-python/setuptools
	fftw? ( sci-libs/fftw )
	glpk? ( sci-mathematics/glpk )
	gsl? ( sci-libs/gsl )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	sed -i \
		-e "s:^ATLAS_LIB_DIR = '/usr/lib':ATLAS_LIB_DIR = '${EPREFIX}/usr/$(get_libdir)':" \
		src/setup.py || die

	#if use dsdp; then
	#	sed -i \
	#		-e "s:^BUILD_DSDP = 0:BUILD_DSDP = 1:" \
	#		-e "s:^DSDP_LIB_DIR = '/usr/lib':DSDP_LIB_DIR = '${EPREFIX}/usr/$(get_libdir)':" \
	#		src/setup.py || die
	#fi

	if use fftw; then
		sed -i \
			-e "s:^BUILD_FFTW = 0:BUILD_FFTW = 1:" \
			-e "s:^FFTW_LIB_DIR = '/usr/lib':FFTW_LIB_DIR = '${EPREFIX}/usr/$(get_libdir)':" \
			src/setup.py || die
	fi
	
	if use glpk; then
		sed -i \
			-e "s:^BUILD_GLPK = 0:BUILD_GLPK = 1:" \
			-e "s:^GLPK_LIB_DIR = '/usr/lib':GLPK_LIB_DIR = '${EPREFIX}/usr/$(get_libdir)':" \
			src/setup.py || die
	fi
	
	if use gsl; then
		sed -i \
			-e "s:^BUILD_GSL = 0:BUILD_GSL = 1:" \
			-e "s:^GSL_LIB_DIR = '/usr/lib':GSL_LIB_DIR = '${EPREFIX}/usr/$(get_libdir)':" \
			src/setup.py || die
	fi
}

src_compile() {
	cd "${S}"/src; distutils_src_compile; cd ..
}

src_install() {
	cd "${S}"/src; distutils_src_install; cd ..
}
