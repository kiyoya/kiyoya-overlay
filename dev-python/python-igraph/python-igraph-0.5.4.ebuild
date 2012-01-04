# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="High performance graph data structures and algorithms"
HOMEPAGE="http://pypi.python.org/pypi/python-igraph"
SRC_URI="http://pypi.python.org/packages/source/p/python-igraph/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-libs/igraph"
RDEPEND="${DEPEND}"

