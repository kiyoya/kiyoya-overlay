# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://repo.neo4j.org/org/neo4j/${PN}/${PV}/${P}-sources.jar"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE=""

COMMON_DEP="dev-libs/protobuf[java]
	dev-java/neo4j-kernel
	dev-java/neo4j-index"

RDEPEND=">=virtual/jre-1.5
	dev-java/jta
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_GENTOO_CLASSPATH="neo4j-index,neo4j-kernel,jta,protobuf"
EANT_DOC_TARGET=""

src_unpack() {
	unpack "${A}"
	mkdir -p "${S}"/src
	cd "${WORKDIR}"
	mv META-INF "${S}"
	mv org "${S}"/src
	cp "${FILESDIR}"/build.xml "${S}"
	cd "${S}"

	java-ant_rewrite-classpath
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}

