# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit perl-module

DESCRIPTION="Perl Binding of Tokyo Cabinet"
HOMEPAGE="http://fallabs.com/tokyocabinet/perldoc/"
SRC_URI="http://fallabs.com/tokyocabinet/perlpkg/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~amd64-linux ~x86-linux ~x86-macos ~x64-macos"
IUSE=""

DEPEND="dev-db/tokyocabinet
	dev-lang/perl"
RDEPEND="${DEPEND}"
