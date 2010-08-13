# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

USE_RUBY="ruby18 ruby19"

DESCRIPTION=""
HOMEPAGE="http://fallabs.com/tokyocabinet/rubydoc/"
SRC_URI="http://fallabs.com/tokyocabinet/rubypkg/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~amd64-linux ~x86-linux ~x86-macos ~x64-macos"
IUSE=""

DEPEND="dev-db/tokyocabinet
	dev-lang/ruby"
RDEPEND="${DEPEND}"
