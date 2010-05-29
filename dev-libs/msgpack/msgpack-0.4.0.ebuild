# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

REV="45459"

DESCRIPTION="A binary-based efficient data interchange format that is focused on high performance."
HOMEPAGE="http://msgpack.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/${PN}/${REV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="perl python ruby"

RDEPEND=""
DEPEND="${RDEPEND}"
PDEPEND="perl? ( dev-perl/Data-MessagePack )
	python? ( dev-python/msgpack )
	ruby? ( dev-ruby/msgpack )"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog INSTALL NEWS README || die
}
