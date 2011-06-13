# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils toolchain-funcs versionator

MYPN="lp_solve"
DESCRIPTION="Library for solving (mixed integer) linear programming problems"
HOMEPAGE="http://lpsolve.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PV}/${MYPN}_${PV}_source.tar.gz
	java? ( mirror://sourceforge/${PN}/${PN}/${PV}/${MYPN}_${PV}_java.zip )"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE="java static-libs examples"
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MYPN}_$(get_version_component_range 1-2)"

PLIB=lpsolve55

src_prepare() {
	epatch "${FILESDIR}"/lpsolve-5.5-platform.patch
	case "${CHOST}" in
	*-darwin*)
		COMPILE_COMMAND="ccc.osx"

		sed -i \
			-e "s|-dynamiclib |-install_name ${EPREFIX}/usr/$(get_libdir)/lib${PLIB}$(get_libname) -dynamiclib |g" \
			${PLIB}/${COMPILE_COMMAND} || die
		;;
	*)
		COMPILE_COMMAND="ccc"
		;;
	esac
	sed -i \
		-e "s|^c=.*$$|c=$(tc-getCC)|g" \
		-e 's|^opts=.*$|opts="${CFLAGS}"|g' \
		-e "s|-fpic|-fPIC|g" \
		-e "s|-ldl||g" \
		lp_solve/${COMPILE_COMMAND} ${PLIB}/${COMPILE_COMMAND} || die
}

src_compile() {
	for d in lp_solve ${PLIB}; do
		pushd $d &> /dev/null
		bash -x ${COMPILE_COMMAND}
		popd &> /dev/null
	done
}

src_install() {
	dobin lp_solve/bin/`cat lp_solve/ccc.platform`/lp_solve || die
	insinto /usr/include/lpsolve
	doins declare.h fortify.h ini.h lp_*.h lpkit.h lpsolve.h ufortify.h yacc_read.h
	dolib.so ${PLIB}/bin/`cat ${PLIB}/ccc.platform`/lib${PLIB}$(get_libname)
	if use static-libs; then
		dolib.a lib${PLIB}.a || die
	fi
	dosym lib${PLIB}$(get_libname) /usr/$(get_libdir)/lib${PLIB}$(get_libname 1)
}
