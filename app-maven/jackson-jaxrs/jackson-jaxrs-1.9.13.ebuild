# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-jaxrs-1.9.13.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/jackson/jackson-jaxrs/1.9.13/jackson-jaxrs-1.9.13-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-jaxrs-1.9.13.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jax-RS provider for JSON content type, based on 
Jackson JSON processor's data binding functionality."
HOMEPAGE="http://jackson.codehaus.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.jackson:jackson-jaxrs:1.9.13"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=app-maven/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=app-maven/jackson-mapper-asl-1.9.13:0

CDEPEND="
	>=app-maven/jackson-core-asl-1.9.13:0
	>=app-maven/jackson-mapper-asl-1.9.13:0
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

JAVA_GENTOO_CLASSPATH="jackson-core-asl,jackson-mapper-asl"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}