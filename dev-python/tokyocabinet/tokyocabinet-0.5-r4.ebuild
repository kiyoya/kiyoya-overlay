# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils eutils

DESCRIPTION="a complete python wrapper for the Tokyo Cabinet library"
HOMEPAGE="http://pypi.python.org/pypi/tokyocabinet"
SRC_URI="http://pypi.python.org/packages/source/t/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="dev-db/tokyocabinet"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_prepare() {
	epatch "${FILESDIR}"/${P}-Table_hint.patch
	epatch "${FILESDIR}"/${P}-Table_iter.patch
	epatch "${FILESDIR}"/${P}-Hash_iter.patch
	epatch "${FILESDIR}"/${P}-tp_init.patch
}
