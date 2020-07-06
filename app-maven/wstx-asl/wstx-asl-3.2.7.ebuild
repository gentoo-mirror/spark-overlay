# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/wstx-asl-3.2.7.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/woodstox/wstx-asl/3.2.7/wstx-asl-3.2.7-sources.jar --slot 0 --keywords "~amd64" --ebuild wstx-asl-3.2.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Woodstox is a high-performance XML processor that implements Stax (JSR-173) API"
HOMEPAGE="http://woodstox.codehaus.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/woodstox/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.woodstox:wstx-asl:3.2.7"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# stax:stax-api:1.0.1 -> >=java-virtuals/stax-api-1:0

CDEPEND="
	>=java-virtuals/stax-api-1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}