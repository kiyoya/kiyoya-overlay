# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="open source HMM tagger"
HOMEPAGE="http://code.google.com/p/hunpos/"

inherit subversion
ESVN_REPO_URI="http://hunpos.googlecode.com/svn/trunk/"

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
