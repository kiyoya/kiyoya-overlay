# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

if [[ ${PV} == 9999 ]]; then
	inherit subversion
	ESVN_REPO_URI="http://thebeast.googlecode.com/svn/trunk/"
else
	SRC_URI="http://thebeast.googlecode.com/files/${P}.tar.gz"
fi

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Markov Logic / Statistical Relational Learning Software"
HOMEPAGE="http://code.google.com/p/thebeast/"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5
	dev-java/javacup:0
	dev-java/jline:0
	>=sci-mathematics/lpsolve-5.5[java]"

java_prepare() {
	epatch "${FILESDIR}"/${PN}-jar.patch
}

EANT_GENTOO_CLASSPATH="javacup,jline,lpsolve"

src_install() {
	dobin "${FILESDIR}"/${PN}
	java-pkg_dojar "${PN}.jar"
	dodoc CHANGES INSTALL README
	dodoc -r examples/
	use doc && java-pkg_dojavadoc doc
}
