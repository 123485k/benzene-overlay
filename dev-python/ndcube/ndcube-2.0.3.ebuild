# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="For multi-dimensional contiguious and non-contiguious coordinate aware arrays"
HOMEPAGE="https://docs.sunpy.org/projects/ndcube"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="plotting reproject"

RDEPEND=">dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/astropy-4.2[${PYTHON_USEDEP}]
	>=dev-python/gwcs-0.15[${PYTHON_USEDEP}]
	plotting? (
		>=dev-python/matplotlib-3.2[${PYTHON_USEDEP}]
		>=dev-python/mpl-animators-1.0[${PYTHON_USEDEP}]
	)
	reproject? (
		>=dev-python/reproject-0.7.1[${PYTHON_USEDEP}]
		<dev-python/reproject-0.10[${PYTHON_USEDEP}]
	)
"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]
	doc? (
		media-gfx/graphviz
	)
	test? (
		dev-python/pytest-doctestplus[${PYTHON_USEDEP}]
		dev-python/mpl-animators[${PYTHON_USEDEP}]
		dev-python/reproject[${PYTHON_USEDEP}]
		dev-python/sunpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-automodapi \
	dev-python/sphinx-changelog \
	dev-python/sunpy-sphinx-theme \
	dev-python/mpl-animators \
	dev-python/pytest-doctestplus

python_prepare_all() {
	use doc && { mkdir -p changelog || die ; }
#	use test && { sed -i -e '/ignore:distutils/a \	ignore:"order" was deprecated in version 0.9' \
#		-e "/ignore:distutils/a \	ignore:The default kernel will change from 'Hann' to  'Gaussian'" \
#		-e "/ignore:distutils/a \	ignore:The default boundary mode will change from 'ignore' to  'strict'" setup.cfg || die ; }

	distutils-r1_python_prepare_all
}
