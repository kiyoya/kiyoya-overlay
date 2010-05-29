# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A high performance database library similar to the DBM family"
HOMEPAGE="http://sourceforge.net/projects/tokyocabinet/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="bzip2 custom-optimization java lua perl pthread ruby static swab uyield zlib"

RDEPEND=""
DEPEND="${RDEPEND}
	bzip2? ( >=app-arch/bzip2-1.0.5 )
	zlib? ( >=sys-libs/zlib-1.2.3 )"
PDEPEND="java? ( dev-db/tokyocabinet-java )
	lua? ( dev-db/tokyocabinet-lua )
	perl? ( dev-db/tokyocabinet-perl )
	ruby? ( dev-db/tokyocabinet-ruby )"

src_compile() {
	local myconf
	# --enable-debug
	# --enable-devel
	# --enable-profile
	# --enable-off64
	use bzip2 || myconf="${myconf} --disable-bzip"
	use custom-optimization && myconf="${myconf} --enable-fastest"
	use pthread || myconf="${myconf} --disable-pthread"
	use static && myconf="${myconf} --enable-static --disable-shared"
	use swab && myconf="${myconf} --enable-swab"
	use uyield && myconf="${myconf} --enable-uyield"
	use zlib || myconf="${myconf} --disable-zlib"

	econf ${myconf} || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog THANKS || die
	dohtml doc/* || die
}
