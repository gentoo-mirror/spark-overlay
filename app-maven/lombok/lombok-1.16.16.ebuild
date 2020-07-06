# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lombok-1.16.16.pom --download-uri https://repo.maven.apache.org/maven2/org/projectlombok/lombok/1.16.16/lombok-1.16.16-sources.jar --slot 0 --keywords "~amd64" --ebuild lombok-1.16.16.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Spice up your java: Automatic Resource Management, automatic generation of getters, setters, equals, hashCode and toString, and more!"
HOMEPAGE="https://projectlombok.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/project${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.projectlombok:lombok:1.16.16"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}