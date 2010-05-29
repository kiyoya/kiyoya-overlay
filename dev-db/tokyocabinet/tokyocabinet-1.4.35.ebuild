# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A library of routines for managing a database"
HOMEPAGE="http://1978th.net/tokyocabinet/"
SRC_URI="${HOMEPAGE}${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc-macos ~x64-solaris"
IUSE="bzip2 custom-optimization debug doc examples java lua perl pthread ruby static swab uyield zlib"

RDEPEND=""
DEPEND="${RDEPEND}
	bzip2? ( >=app-arch/bzip2-1.0.5 )
	zlib? ( >=sys-libs/zlib-1.2.3 )"
PDEPEND="java? ( dev-db/tokyocabinet-java )
	lua? ( dev-db/tokyocabinet-lua )
	perl? ( dev-db/tokyocabinet-perl )
	ruby? ( dev-db/tokyocabinet-ruby )"

src_prepare() {
	epatch "${FILESDIR}/fix_rpath.patch"
}

src_compile() {
	local myconf
	# --enable-devel
	# --enable-profile
	# --enable-off64
	use bzip2 || myconf="${myconf} --disable-bzip"
	use debug && myconf="${myconf} --enable-debug"
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

	if use examples; then
		dodoc examples/* || die
	fi

	if use doc; then
		dohtml doc/* || die
	fi

	dodoc ChangeLog THANKS || die
}

src_test() {
	emake -j1 check || die
}
