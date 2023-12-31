# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Pytest Snapshot Test Utility"
HOMEPAGE="https://tophat.github.io/syrupy"
SRC_URI="https://github.com/tophat/syrupy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
