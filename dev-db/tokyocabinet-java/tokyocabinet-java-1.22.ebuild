# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2

MY_PN="tokyocabinet"

DESCRIPTION="Tokyo Cabinet API for Java"
HOMEPAGE="http://sourceforge.net/projects/tokyocabinet/"
SRC_URI="mirror://sourceforge/${MY_PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.4"
DEPEND="dev-db/tokyocabinet >=virtual/jdk-1.4"

src_compile() {
	econf || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dohtml doc/* || die
}
