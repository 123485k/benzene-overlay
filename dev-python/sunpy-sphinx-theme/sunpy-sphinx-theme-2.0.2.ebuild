# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="The sphinx theme for the SunPy website and documentation"
HOMEPAGE="https://github.com/sunpy/sunpy-sphinx-theme"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/sphinx[${PYTHON_USEDEP}]
	<dev-python/pydata-sphinx-theme-0.14[${PYTHON_USEDEP}]
"
BDEPEND=">=dev-python/setuptools-scm-6.2[$PYTHON_USEDEP]"

distutils_enable_tests nose
distutils_enable_sphinx docs --no-autodoc
