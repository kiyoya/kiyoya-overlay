# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

MY_PN="tokyocabinet"

DESCRIPTION="Tokyo Cabinet API for Perl"
HOMEPAGE="http://sourceforge.net/projects/tokyocabinet/"
SRC_URI="mirror://sourceforge/${MY_PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-db/tokyocabinet dev-lang/perl"
