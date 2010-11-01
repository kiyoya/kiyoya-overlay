# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/lucene-analyzers/lucene-analyzers-2.3.2.ebuild,v 1.5 2010/02/13 16:41:40 grobian Exp $

JAVA_PKG_IUSE="source"
inherit java-pkg-2 java-ant-2 java-osgi

MY_PN="${PN/lucene-}"
MY_P="${P/-${MY_PN}}"

DESCRIPTION="Lucene Spellchecker additions"
HOMEPAGE="http://lucene.apache.org/java"
SRC_URI="mirror://apache/lucene/java/${MY_P}-src.tar.gz"
LICENSE="Apache-2.0"
SLOT="3.0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""
DEPEND=">=virtual/jdk-1.4"
RDEPEND=">=virtual/jre-1.4"

S="${WORKDIR}/${MY_P}/contrib/${MY_PN}"

src_compile() {
	eant || die
}

src_install() {
	pushd "${WORKDIR}/${MY_P}/build/contrib/${MY_PN}" || die

	java-pkg_newjar ${PN}-${SLOT}-dev.jar ${PN}-${SLOT}.jar

	use source && java-pkg_dosrc "${S}/src/java/org"
}
