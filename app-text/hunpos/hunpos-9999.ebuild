# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Open source reimplementation of TnT"
HOMEPAGE="https://github.com/halacsy/hunpos"
SRC_URI=""
EGIT_REPO_URI="https://github.com/halacsy/hunpos.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x86-macos ~x64-macos"
IUSE=""

DEPEND="dev-lang/ocaml"
RDEPEND="${DEPEND}"

src_compile() {
	ocamlbuild \
		-libs str -I util -I hunpos -I hunpos/lib \
		trainer.native tagger.native || die
}

src_install() {
	dodoc ChangeLog
	newbin _build/hunpos/trainer.native hunpos-train
	newbin _build/hunpos/tagger.native hunpos-tag
}
