# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-ant-2

EAPI=3

MY_PN="apache-solr"

DESCRIPTION="Solr is the popular, blazing fast open source enterprise search
platform from the Apache Lucene project."
HOMEPAGE="http://lucene.apache.org/solr/"
SRC_URI="mirror://apache/lucene/java/${MY_PN}-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="1.4"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="vim-syntax"

RDEPEND=">=virtual/jdk-1.4
	dev-java/lucene
	dev-java/lucene-analyzers
	dev-java/lucene-highlighter
	dev-java/lucene-memory
	dev-java/lucene-misc
	dev-java/lucene-queries
	dev-java/lucene-snowball
	dev-java/lucene-spellchecker"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	eant -Dstub.src.path="" dist || die
}

src_install() {
	dodoc CHANGES.txt NOTICE.txt README.txt || die
	java-pkg_newjar dist/${MY_PN}-cell-${PV}.jar ${PN}-cell-${PV}.jar
	java-pkg_newjar dist/${MY_PN}-clustering-${PV}.jar ${PN}-clustering-${PV}.jar
	java-pkg_newjar dist/${MY_PN}-core-${PV}.jar ${PN}-core-${PV}.jar
	java-pkg_newjar dist/${MY_PN}-dataimporthandler-${PV}.jar ${PN}-dataimporthandler-${PV}.jar
	java-pkg_newjar dist/${MY_PN}-dataimporthandler-extras-${PV}.jar ${PN}-dataimporthandler-extras-${PV}.jar
	java-pkg_newjar dist/${MY_PN}-solrj-${PV}.jar ${PN}-solrj-${PV}.jar

	if use doc; then
		dohtml -r docs/* || die
	fi
	use source && java-pkg_dosrc src/java/org
}
