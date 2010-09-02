# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

JAVA_PKG_IUSE="doc source"

inherit base java-pkg-2 java-ant-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://dist.neo4j.org/${P}-source.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
	dev-java/jta
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	dev-java/ant
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

src_unpack() {
	base_src_unpack
	cp "${FILESDIR}"/build.xml "${S}"
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}

