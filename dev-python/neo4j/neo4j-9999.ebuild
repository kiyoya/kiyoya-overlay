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

DEPEND="dev-python/JCC"
RDEPEND="${DEPEND}
	dev-java/neo4j-kernel"

