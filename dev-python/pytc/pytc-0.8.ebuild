# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION=""
HOMEPAGE="http://pypi.python.org/pypi/pytc/"
SRC_URI="http://pypi.python.org/packages/source/p/pytc/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-db/tokyocabinet"
DEPEND="${RDEPEND}
	dev-python/setuptools"

