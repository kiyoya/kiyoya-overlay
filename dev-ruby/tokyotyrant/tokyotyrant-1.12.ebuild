# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="Tokyo Tyrant API for Ruby"
HOMEPAGE="http://1978th.net/tokyotyrant/rubypkg/"
SRC_URI="http://1978th.net/tokyotyrant/rubypkg/tokyotyrant-ruby-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=""
DEPEND="net-misc/tokyotyrant dev-lang/ruby"

src_compile() {
	:
}

src_install() {
	local sitelibdir
	local bindir

	sitelibdir=`${RUBY} -rrbconfig -e 'puts Config::CONFIG["sitelibdir"]'`
	bindir=`${RUBY} -rrbconfig -e 'puts Config::CONFIG["sitelibdir"]'`

	insinto "$sitelibdir"
	doins "${S}/tokyotyrant.rb"
	insinto "$bindir"
	doins "${S}/tcrtest.rb"
}
