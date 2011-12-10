# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 versionator

MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Stanford Log-linear Part-Of-Speech Tagger"
HOMEPAGE="http://nlp.stanford.edu/software/tagger.shtml"
SRC_URI="http://nlp.stanford.edu/software/${PN}-${MY_PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x86-macos ~x64-macos"
IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEP}"

S="${WORKDIR}"/${MY_P}

src_unpack() {
	unpack "${A}"
	cd "${S}" || die
	unzip -qq ${PN}-src-${MY_PV}.zip || die
	if use doc; then
		unzip -qq ${PN}-javadoc-${MY_PV}.zip || die
	fi
}

src_compile() {
	emake || die
}

src_install() {
	java-pkg_dojar ${PN}.jar

	dobin "${FILESDIR}"/${PN}

	dodoc README.txt sample-input.txt sample-output.txt

	insinto /usr/share/doc/${PF}/models
	doins models/*

	use doc && java-pkg_dojavadoc javadoc
	use source && java-pkg_dosrc src
}
