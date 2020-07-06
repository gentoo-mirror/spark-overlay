# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-core-1.9.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/jersey/jersey-core/1.9/jersey-core-1.9-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-core-1.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311)
        production quality Reference Implementation for building
        RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-core/"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.jersey:jersey-core:1.9"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.mail:mail:1.4 -> >=dev-java/oracle-javamail-1.5.2:0
# javax.ws.rs:jsr311-api:1.1.1 -> >=dev-java/jsr311-api-1.1.1:0
# javax.xml.bind:jaxb-api:2.1 -> >=app-maven/jaxb-api-2.2:0
# org.osgi:osgi_R4_core:1.0 -> >=dev-java/osgi-core-4.0:4

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	>=app-maven/jaxb-api-2.2:0
	>=dev-java/jsr311-api-1.1.1:0
	>=dev-java/oracle-javamail-1.5.2:0
	>=dev-java/osgi-core-4.0:4
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="oracle-javamail,jsr311-api,jaxb-api,osgi-core-4"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}