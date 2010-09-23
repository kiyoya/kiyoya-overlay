# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils toolchain-funcs java-pkg-2

MY_PN="LGL"

DESCRIPTION="LGL is a compendium of applications for making the visualization of
large networks and trees tractable."
HOMEPAGE="http://lgl.sourceforge.net/"
SRC_URI="mirror://sourceforge/lgl/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="java"

RDEPEND="dev-libs/boost"
DEPEND="${RDEPEND}
	dev-lang/perl
	java? ( >=virtual/jdk-1.4 dev-java/jama )"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/${MY_PN}-${PV} "${S}" || die
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc4.3.3.patch

	cd "${S}"/src
	sed -i \
		-e "s:-Wall -O3 -ftemplate-depth-30:-Wall ${CFLAGS} -ftemplate-depth-50:" \
		Makefile || die
}

src_compile() {
	tc-export CC CXX CPP AR RANLIB

	perl setup.pl -i || die

	if use java; then
		cd Java || die


		ejavac -classpath $(java-config --classpath jama):. $(find -name *.java)

		jar cmf ImageMaker/META-INF/MANIFEST.MF imageMaker.jar Viewer2D Jama ImageMaker
		jar cmf Viewer2D/META-INF/MANIFEST.MF lglview.jar Viewer2D Jama
	fi
}

src_install() {
	cd bin
	dobin lglayout2D lglayout3D lglbreakup lglrebuild || die

	if use java; then
		cd ../Java
		java-pkg_dojar imageMaker.jar
		java-pkg_dojar lglview.jar
	fi
}
