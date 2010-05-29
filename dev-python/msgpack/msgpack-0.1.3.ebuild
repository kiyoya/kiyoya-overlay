# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

MY_PN="msgpack-python"

DESCRIPTION="MessagePack (de)serializer for Python"
HOMEPAGE="http://pypi.python.org/pypi/msgpack/"
SRC_URI="http://pypi.python.org/packages/source/m/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/msgpack
	virtual/python"
RDEPEND="${RDEPEND}"

src_compile() {
	python setup.py build || die
}

src_install() {
	python_need_rebuild
	python setup.py install --root="${D}" || die
}
