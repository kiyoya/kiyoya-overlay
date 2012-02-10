# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils git-2

DESCRIPTION="Render high-resolution maps of a Minecraft world with a Google Maps powered interface"
HOMEPAGE="http://overviewer.org/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/overviewer/Minecraft-Overviewer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="dev-python/setuptools
	dev-python/numpy
	dev-python/imaging"
DEPEND="${DEPEND}"
