# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/wagon-provider-api-2.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/maven/wagon/wagon-provider-api/2.4/wagon-provider-api-2.4-sources.jar --slot 0 --keywords "~amd64" --ebuild wagon-provider-api-2.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Maven Wagon API that defines the contract between different Wagon implementations"
HOMEPAGE="http://maven.apache.org/wagon/wagon-provider-api"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/maven/wagon/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.maven.wagon:wagon-provider-api:2.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.plexus:plexus-utils:3.0.8 -> >=app-maven/plexus-utils-3.0.8:0

CDEPEND="
	>=app-maven/plexus-utils-3.0.8:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="plexus-utils"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}