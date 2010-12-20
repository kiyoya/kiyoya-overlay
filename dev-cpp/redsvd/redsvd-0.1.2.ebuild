# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="a library for solving several matrix decompositions"
HOMEPAGE="http://code.google.com/p/redsvd/"
SRC_URI="http://redsvd.googlecode.com/files/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="=dev-cpp/eigen-3*"
RDEPEND="${DEPEND}"

REDSVD_TESTS="accuracy_test performance_test"

src_configure() {
	tc-export CC CXX CPP AR RANLIB
	./waf configure \
		--prefix=${EPREFIX}/usr \
		|| die
}

src_compile() {
	./waf || die
}

src_test() {
	cd "${S}/build/default/test" || die
	for i in ${REDSVD_TESTS}
	do
		einfo "Running test ${i}"
		./${i} || die
	done
}

src_install() {
	./waf --destdir="${D}" install || die
	dodoc README
}
