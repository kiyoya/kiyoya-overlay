# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="Bitten"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A continuous integration plugin for Trac"
HOMEPAGE="http://bitten.edgewall.org/"
SRC_URI="http://ftp.edgewall.com/pub/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
	>=www-apps/trac-0.11"

S="${WORKDIR}/${MY_P}"
