# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="High quality drawing interface for PIL"
HOMEPAGE="https://aggdraw.readthedocs.io"
SRC_URI+=" test? ( https://github.com/pytroll/aggdraw/raw/v${PV}/selftest.py -> ${P}-selftest.py )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/freetype:2"
RDEPEND="${DEPEND}"
BDEPEND="test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	use test && { cp {"${DISTDIR}"/${P}-,"${S}"/}selftest.py || die ; }

	distutils-r1_python_prepare_all
}

python_test() {
	${EPYTHON} selftest.py || die "Tests failed with ${EPYTHON}"
}
