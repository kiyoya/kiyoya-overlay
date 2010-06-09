# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="Python Tokyo Cabinet interface"
HOMEPAGE="http://packages.python.org/tokyocabinet-python/"
SRC_URI="http://pypi.python.org/packages/source/t/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-db/tokyocabinet"
DEPEND="${RDEPEND}
	dev-python/setuptools"
