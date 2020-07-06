# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/audience-annotations-0.5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/yetus/audience-annotations/0.5.0/audience-annotations-0.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild audience-annotations-0.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Annotations for defining API boundaries and tools for managing javadocs"
HOMEPAGE="https://yetus.apache.org/audience-annotations"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/yetus/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.yetus:audience-annotations:0.5.0"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}