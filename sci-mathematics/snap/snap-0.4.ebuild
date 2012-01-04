# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Large-scale Graph Analysis"
HOMEPAGE="http://sourceforge.net/projects/snap-graph/"
SRC_URI="mirror://sourceforge/snap-graph/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="openmp"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable openmp)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog INSTALL NEWS README
}
