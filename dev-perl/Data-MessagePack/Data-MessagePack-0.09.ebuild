# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module multilib

DESCRIPTION="MessagePack streaming deserializer for Perl"
HOMEPAGE="http://search.cpan.org/~tokuhirom/"
SRC_URI="mirror://cpan/authors/id/T/TO/TOKUHIROM/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl
	dev-libs/msgpack"
RDEPEND="${DEPEND}"

