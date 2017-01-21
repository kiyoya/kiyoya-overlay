# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs git-r3

DESCRIPTION="a library for solving several matrix decompositions"
HOMEPAGE="https://github.com/hillbig/redsvd"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hillbig/redsvd.git"
EGIT_COMMIT="81003509e79819489e700cc27a3f9d02bafac149"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-cpp/eigen:3"
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
}
