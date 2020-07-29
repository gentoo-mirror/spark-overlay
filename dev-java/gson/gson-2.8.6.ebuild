# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_P="${PN}-parent-${PV}"
JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java library to convert JSON to Java objects and vice-versa"
HOMEPAGE="https://github.com/google/gson"
SRC_URI="https://github.com/google/${PN}/archive/${MY_P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="2.7"
KEYWORDS="~amd64 ~x86"

MAVEN_ID="com.google.code.gson:gson:2.8.6"

CDEPEND="test? ( dev-java/junit:4 )"

DEPEND=">=virtual/jdk-1.7"
RDEPEND=">=virtual/jre-1.7"

S="${WORKDIR}/${PN}-${MY_P}"
JAVA_SRC_DIR=(
	"${PN}/src/main/java"
	"${PN}/src/main/java-templates"
)

JAVA_GENTOO_TEST_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="${PN}/src/test/java"
JAVA_TESTING_FRAMEWORK="junit"

JAVA_RM_FILES=( "${JAVA_SRC_DIR[0]}/module-info.java" )

src_prepare() {
	java-pkg-2_src_prepare

	sed -i "s/\${project.version}/${PV}/" \
		${JAVA_SRC_DIR[1]}/com/google/gson/internal/GsonBuildConfig.java\
		|| die
}