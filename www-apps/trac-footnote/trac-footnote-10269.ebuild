# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Add footnotes to Trac wiki"
HOMEPAGE="http://trac-hacks.org/wiki/FootNoteMacro"
SRC_URI="http://trac-hacks.org/changeset/${PV}/footnotemacro/0.11?old_path=/&format=zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools
	app-arch/unzip"
RDEPEND=">=www-apps/trac-0.11"

S="${WORKDIR}/footnotemacro/0.11"

src_prepare() {
	find . -type f | xargs chmod 0644 || die
	sed -i \
		-e "s/version = '.\+\?'/version = '${PV}'/" \
		setup.py || die
}
