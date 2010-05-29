# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit perl-module

DESCRIPTION=""
HOMEPAGE="http://1978th.net/tokyocabinet/perldoc/"
SRC_URI="http://1978th.net/tokyocabinet/perlpkg//tokyocabinet-perl-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-db/tokyocabinet
	dev-lang/perl"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}
	mv tokyocabinet-perl-${PV} ${P}
}
