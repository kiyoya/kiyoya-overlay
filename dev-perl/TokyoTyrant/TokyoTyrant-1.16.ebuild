# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Tokyo Tyrant API for Perl"
HOMEPAGE="http://1978th.net/tokyotyrant/perlpkg/"
SRC_URI="http://1978th.net/tokyotyrant/perlpkg/tokyotyrant-perl-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/tokyotyrant dev-lang/perl"
RDEPEND="${RDEPEND}"
