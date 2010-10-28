# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A collection of machine-learning algorithms for classification"
HOMEPAGE="http://www.chokkan.org/software/classias/"
SRC_URI="http://www.chokkan.org/software/dist/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-libs/liblbfgs"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die
}
