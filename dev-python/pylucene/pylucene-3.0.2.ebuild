# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2 java-ant-2

EAPI=3

MY_PV="3.0.2-1"

DESCRIPTION="PyLucene is a Python extension for accessing Java Lucene."
HOMEPAGE="http://lucene.apache.org/pylucene"
SRC_URI="mirror://apache/lucene/java/${PN}-${MY_PV}-src.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/JCC
	>=virtual/jdk-1.4
	dev-java/lucene
	dev-java/lucene-analyzers
	dev-java/lucene-snowball
	dev-java/lucene-highlighter
	dev-java/lucene-regex
	dev-java/lucene-queries
	dev-java/lucene-instantiated
	dev-java/ant-core
	dev-java/ant-python"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

src_compile() {
	emake JCC="python -m jcc" PREFIX_PYTHON="${EPREFIX}/usr" ANT=ant || die
}
