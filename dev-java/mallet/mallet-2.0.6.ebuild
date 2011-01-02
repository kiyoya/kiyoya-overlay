# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="MAchine Learning for LanguagE Toolkit"
HOMEPAGE="http://mallet.cs.umass.edu/"
SRC_URI="http://mallet.cs.umass.edu/dist/mallet-2.0.6.zip"

LICENSE="CPL-1.0"
SLOT="2"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

src_compile() {
	eant jar || die
}

src_install() {
	java-pkg_dojar "dist/${PN}.jar"
}

