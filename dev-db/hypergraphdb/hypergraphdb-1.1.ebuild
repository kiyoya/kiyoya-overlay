# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A general database system for storing strongly-typed hypergraphs"
HOMEPAGE="http://www.hypergraphdb.org/"

inherit subversion
ESVN_REPO_URI="http://hypergraphdb.googlecode.com/svn/tags/release${PV}"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5
	sys-libs/db:5.0[java]
	dev-java/smack:2.2"

EANT_GENTOO_CLASSPATH="db-5.0,smack-2.2"

src_compile() {
	eant full-jar || die
	eant peer-jar || die
	eant core-jar || die
	#eant docgen || die
}

src_install() {
	java-pkg_dojar *.jar
}
