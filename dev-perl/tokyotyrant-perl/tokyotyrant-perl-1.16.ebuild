# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Tokyo Tyrant API for Perl"
HOMEPAGE="http://fallabs.com/tokyotyrant/perldoc/"
SRC_URI="http://fallabs.com/tokyotyrant/perlpkg/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="net-misc/tokyotyrant
	dev-lang/perl"
DEPEND="${RDEPEND}"
