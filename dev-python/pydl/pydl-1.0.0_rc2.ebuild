# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Astropy affiliated package for accessing Virtual Observatory data and services"
HOMEPAGE="https://pyvo.readthedocs.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="all doc intersphinx"
PROPERTIES="test_network"
RESTRICT="test
	intersphinx? ( network-sandbox )"
REQUIRED_USE="intersphinx? ( doc )"

RDEPEND="dev-python/astropy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]
	doc? (
		${RDEPEND}
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
		media-gfx/graphviz
	)
	test? (
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

PATCHES=( "${FILESDIR}"/${P}-fix-astropy-5.1.patch )

distutils_enable_tests pytest
#distutils_enable_sphinx docs dev-python/sphinx-astropy

python_compile_all() {
	if use doc; then
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/install/$(python_get_sitedir) \
			emake "SPHINXOPTS=$(usex intersphinx '' '-D disable_intersphinx=1')" -C docs html
		HTML_DOCS=( docs/_build/html/. )
	fi
}
