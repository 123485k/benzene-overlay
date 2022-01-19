# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Pytest plugin used for controlling access to data files hosted online"
HOMEPAGE="https://github.com/astropy/pytest-remotedata"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="!test? ( test )"	# Test phase runs with fails
RDEPEND=">=dev-python/pytest-4.6[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]"

distutils_enable_tests pytest