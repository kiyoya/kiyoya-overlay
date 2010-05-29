# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18 ruby19"

DESCRIPTION="Ruby API for MessagePack"
HOMEPAGE="http://msgpack.sourceforge.jp/"
LICENSE="Apache-2.0"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-libs/msgpack"
