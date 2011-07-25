# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

JAVA_PKG_IUSE="doc source"

ESVN_REPO_URI="http://google-gson.googlecode.com/svn/tags/${P}/"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="A Java library to convert JSON to Java objects and vice-versa"
HOMEPAGE="http://code.google.com/p/google-gson/"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE="test"

COMMON_DEP="dev-java/junit:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

src_compile() {
	mkdir build || die
	find src -name "*.java" > "${T}/sources" || die
	ejavac -d build -cp $(java-pkg_getjars junit) "@${T}/sources"

	cd build
	find -type f >> "${T}/classes" || die
	jar cf ${PN}.jar "@${T}/classes" || die
}

src_install() {
	java-pkg_dojar "build/${PN}.jar"
	#use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}

