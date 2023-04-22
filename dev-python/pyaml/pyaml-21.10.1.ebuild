# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="PyYAML-based module to produce pretty and readable YAML-serialized data"
HOMEPAGE="https://github.com/mk-fg/pretty-yaml"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/pyyaml[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/unidecode[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
