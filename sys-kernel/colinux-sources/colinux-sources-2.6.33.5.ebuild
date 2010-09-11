# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/vanilla-sources/vanilla-sources-2.6.33.5.ebuild,v 1.5 2010/07/18 14:02:13 nixnut Exp $

K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
ETYPE="sources"
inherit kernel-2
detect_version

MY_PN="devel-colinux"
MY_PV="20100727"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Full sources for the Linux kernel"
HOMEPAGE="http://www.kernel.org"
SRC_URI="${KERNEL_URI} mirror://sourceforge/colinux/${MY_P}.tar.gz"

KEYWORDS="~x86"
IUSE=""

src_unpack(){
	kernel-2_src_unpack
	cd "${WORKDIR}"
	unpack "${MY_P}.tar.gz"
	cd "${S}"
	for name in `cat ../${MY_P}/patch/series-${CKV}`;
	do
		EPATCH_OPTS="-p1" epatch ../${MY_P}/patch/${name}
	done
}

src_install(){
	kernel-2_src_install
	cp "${WORKDIR}"/${MY_P}/conf/linux-${CKV}-config "${ED}"/usr/src/linux-${CKV}/.config
}
