# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils versionator

DESCRIPTION="JPype is an effort to allow python programs full access to java
class libraries."
HOMEPAGE="http://jpype.sourceforge.net/"
SRC_URI="mirror://sourceforge/jpype/$(get_version_component_range 1-3)/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/setuptools"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}"/prefix-macos.patch
	epatch "${FILESDIR}"/fix-sets.patch
}

src_compile() {
	export JAVA_HOME=`java-config -O`
	distutils_src_compile
}
