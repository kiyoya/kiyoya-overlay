# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="South: Migrations for Django"
HOMEPAGE="http://south.aeracode.org/"
SRC_URI="http://pypi.python.org/packages/source/S/${PN}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools"

