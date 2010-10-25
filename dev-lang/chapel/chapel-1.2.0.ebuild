# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

EAPI=3

DESCRIPTION="Chapel is a new parallel programming language being developed by
Cray Inc."
HOMEPAGE="http://chapel.cray.com/"
SRC_URI="mirror://sourceforge/chapel/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${S}/chapel"

src_compile() {
	emake -j1 CC="$(tc-getCC)" CXX="$(tc-getCXX)" \
		CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" \
		LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	mkdir -p ${ED}/opt/${P}
	cp -R . ${ED}/opt/${P}
	mkdir -p ${ED}/etc/env.d
	cat > ${ED}/etc/env.d/99chapel <<EOM
CHPL_HOME="/opt/${P}"
CHPL_HOST_PLATFORM="`./util/chplenv/platform`"
PATH="/opt/${P}/bin/`./util/chplenv/platform`"
MANPATH="/opt/${P}/man"
EOM
}
