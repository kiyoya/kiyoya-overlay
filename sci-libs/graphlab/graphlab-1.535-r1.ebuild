# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils versionator

EAPI=3

MY_PN="graphlabapi"
MY_PV="v$(get_major_version)_$(get_after_major_version)"

DESCRIPTION="GraphLab is a new parallel framework for machine learning."
HOMEPAGE="http://www.graphlab.ml.cmu.edu/"
SRC_URI="http://${MY_PN}.googlecode.com/files/${MY_PN}_${MY_PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="doc tcmalloc"

DEPEND=">=dev-libs/boost-1.37
	>=dev-util/cmake-2.6
	tcmalloc? ( >=dev-util/google-perftools-1.4 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

src_configure() {
	mycmakeargs=(
		-D CMAKE_BUILD_TYPE=Release
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	if use doc; then
		cd "${S}"/doc/doxygen
		dohtml -r html/* || die
	fi
}
