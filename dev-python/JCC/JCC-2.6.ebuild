# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="a C++ code generator for calling Java from C++/Python"
HOMEPAGE="http://pypi.python.org/pypi/JCC/"
SRC_URI="http://pypi.python.org/packages/source/J/${PN}/${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_compile() {
	export NO_SHARED="yes"
	export JCC_JDK=`java-config -O`
	export JCC_INCLUDES="${JCC_JDK}/include:${JCC_JDK}/include/linux"
	#export JCC_CFLAGS="${CFLAGS}"
	#export JCC_LFLAGS="${LDFLAGS}"
	#export JCC_IMPLIB_LFLAGS="${LDFLAGS}"
	export JCC_JAVAC="javac"
	distutils_src_compile
}
