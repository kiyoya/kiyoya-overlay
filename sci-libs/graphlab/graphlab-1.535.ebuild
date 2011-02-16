# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

EAPI=3

MY_PN="graphlabapi"
MY_PV="v$(get_major_version)_$(get_after_major_version)"

DESCRIPTION="GraphLab is a new parallel framework for machine learning."
HOMEPAGE="http://www.graphlab.ml.cmu.edu/"
SRC_URI="http://${MY_PN}.googlecode.com/files/${MY_PN}_${MY_PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="tcmalloc"

DEPEND=">=dev-libs/boost-1.37
	>=dev-util/cmake-2.6
	tcmalloc? ( >=dev-util/google-perftools-1.4 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-prefix.patch
}

src_configure() {
	econf || die
}

src_compile() {
	pushd release
	emake || die
	popd
}

src_install() {
	pushd release
	emake DESTDIR="${D}" install || die
	popd
}
