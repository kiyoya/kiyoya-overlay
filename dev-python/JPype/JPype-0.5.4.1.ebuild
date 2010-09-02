# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base distutils versionator

MY_PN="jpype"

DESCRIPTION="JPype is an effort to allow python programs full access to java
class libraries."
HOMEPAGE="http://jpype.sourceforge.net/"
SRC_URI="mirror://sourceforge/${MY_PN}/$(get_version_component_range 1-3)/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-java/java-config"
RDEPEND="${DEPEND}"

src_compile() {
	export JAVA_HOME=`java-config -O`
	distutils_src_compile
}
