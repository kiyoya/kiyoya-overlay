# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="Tokyo Tyrant API for Ruby"
HOMEPAGE="http://fallabs.com/tokyotyrant/rubydoc/"
SRC_URI="http://fallabs.com/tokyotyrant/rubypkg/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="net-misc/tokyotyrant
	dev-lang/ruby"
DEPEND="${RDEPEND}"

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
