# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

MY_P=${PN}-4.0rc4

DESCRIPTION="A Python API to a Semantic Network Representation of the Open Mind
Common Sense Project"
HOMEPAGE="http://conceptnet.media.mit.edu/"
SRC_URI="http://pypi.python.org/packages/source/C/${PN}/${MY_P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-python/django
	dev-python/South"
RDEPEND="${DEPEND}
	dev-python/setuptools"

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}
	mv ${MY_P} ${P}
}
