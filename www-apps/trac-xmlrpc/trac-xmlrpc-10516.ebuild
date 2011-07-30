# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Remote Procedure Call plugin for Trac"
HOMEPAGE="http://trac-hacks.org/wiki/XmlRpcPlugin"
SRC_URI="http://trac-hacks.org/changeset/${PV}/xmlrpcplugin?old_path=/&format=zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	app-arch/unzip"
RDEPEND=">=www-apps/trac-0.11"

S="${WORKDIR}/xmlrpcplugin/trunk"
