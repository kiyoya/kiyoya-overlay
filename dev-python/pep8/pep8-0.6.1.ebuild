# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="Python style guide checker"
HOMEPAGE="http://pypi.python.org/pypi/pep8/"
SRC_URI="http://pypi.python.org/packages/source/p/pep8/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND=""
DEPEND="${DEPEND}
	dev-python/setuptools"

