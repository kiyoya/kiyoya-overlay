# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="Python 2.x Binding of Kyoto Cabinet"
HOMEPAGE="http://fallabs.com/kyotocabinet/pythonlegacydoc/"
SRC_URI="http://fallabs.com/kyotocabinet/pythonlegacypkg/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND=">=dev-db/kyotocabinet-1.2.50"
DEPEND="${RDEPEND}
	dev-python/setuptools"

