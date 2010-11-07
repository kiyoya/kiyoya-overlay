# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PN="neo4j.py"

ESVN_REPO_URI="https://svn.neo4j.org/components/${MY_PN}/trunk/"

inherit distutils subversion

DESCRIPTION="A Python wrapper for Neo4j"
HOMEPAGE="http://components.neo4j.org/neo4j.py/"
SRC_URI=""

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="|| ( dev-python/JCC dev-python/JPype )
	dev-java/neo4j-kernel
	dev-java/neo4j-index
	dev-java/neo4j-commons
	dev-java/neo4j-remote-graphdb
	dev-java/junit"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack
	cd "${S}"
	epatch "${FILESDIR}"/setup.py.patch
}

src_install() {
	distutils_src_install

	IFS_SAVE="$IFS"
	IFS=:

	local pylibdir classdir
	for pylibdir in "${ED}"usr/$(get_libdir)/python*; do
		classdir=${pylibdir}/site-packages/neo4j/classes
		mkdir -p ${classdir}
		for f in `java-config -d -p neo4j-kernel,neo4j-index,neo4j-commons,neo4j-remote-graphdb`; do
			ln -s ${f} ${classdir}/$(basename ${f})
		done
	done

	IFS="$IFS_SAVE"
}
