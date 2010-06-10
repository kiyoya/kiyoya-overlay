# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="A set of utility for Python and Django that the Commonsense
Computing project uses in multiple projects."
HOMEPAGE="http://divisi.media.mit.edu/"
SRC_URI="http://pypi.python.org/packages/source/c/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools"

