# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/eigen/eigen-2.0.14.ebuild,v 1.1 2010/07/09 08:48:46 spatz Exp $

EAPI="2"

inherit cmake-utils

DESCRIPTION="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra"
HOMEPAGE="http://eigen.tuxfamily.org/"
SRC_URI="http://bitbucket.org/eigen/eigen/get/${PV//_/-}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
SLOT="3"
IUSE="debug doc examples"

COMMON_DEPEND="
	examples? (
		x11-libs/qt-gui:4
		x11-libs/qt-opengl:4
	)
"
DEPEND="${COMMON_DEPEND}
	doc? ( app-doc/doxygen )
"
RDEPEND="${COMMON_DEPEND}
	!dev-cpp/eigen:0
"

src_prepare() {
	mv 'eigen-eigen-c40708b9088d' ${P}
}

CMAKE_BUILD_TYPE='Release'

src_configure() {
	# benchmarks (BTL) brings up damn load of external deps including fortran
	# compiler
	# library hangs up complete compilation proccess, test later
	mycmakeargs=(
		-DEIGEN_BUILD_LIB=OFF
		-DEIGEN_BUILD_BTL=OFF
		$(cmake-utils_use examples EIGEN_BUILD_DEMOS)
		$(cmake-utils_use test EIGEN_BUILD_TESTS)
		$(cmake-utils_use test EIGEN_BUILD_NO_FORTRAN)
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
	if use doc; then
		cmake-utils_src_compile doc
	fi
}

src_install() {
	if use doc; then
		HTML_DOCS=( "${CMAKE_BUILD_DIR}/doc/html/" )
	fi
	cmake-utils_src_install
	if use examples; then
		cd "${CMAKE_BUILD_DIR}"/demos
		dobin mandelbrot/mandelbrot opengl/quaternion_demo || die "dobin failed"
	fi

	# install CMake modules (thx Sven)
	insinto /usr/share/doc/${PF}/cmake
	doins "${S}"/cmake/*.cmake
}

pkg_postinst() {
	einfo "CMake modules are installed into /usr/share/doc/${PF}/cmake ."
}
