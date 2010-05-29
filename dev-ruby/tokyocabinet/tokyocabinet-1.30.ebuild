# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

USE_RUBY="ruby18 ruby19"

DESCRIPTION=""
HOMEPAGE="http://1978th.net/tokyocabinet/rubydoc/"
SRC_URI="http://1978th.net/tokyocabinet/rubypkg/tokyocabinet-ruby-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-db/tokyocabinet
	dev-lang/ruby"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}
	mv tokyocabinet-ruby-${PV} ${P}
}
