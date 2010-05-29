# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit autotools eutils

REV="46155"

DESCRIPTION="MessagePack is a binary-based efficient data interchange format"
HOMEPAGE="http://msgpack.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/${PN}/${REV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="perl python ruby test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( dev-util/gtest )"
PDEPEND="perl? ( dev-perl/Data-MessagePack )
	python? ( dev-python/msgpack )
	ruby? ( dev-ruby/msgpack )"

src_prepare() {
	epatch "${FILESDIR}/${P}-test.patch"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README || die
}
