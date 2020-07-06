# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-posix-3.0.12.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-posix/3.0.12/jnr-posix-3.0.12-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-posix-3.0.12.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Common cross-project/cross-platform POSIX APIs"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/jnr-posix"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.jnr:jnr-posix:3.0.12"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jnr-constants:0.8.7 -> >=dev-java/jnr-constants-0.8.7:0
# com.github.jnr:jnr-ffi:2.0.3 -> >=dev-java/jnr-ffi-2.0.3:0

CDEPEND="
	>=dev-java/jnr-constants-0.8.7:0
	>=dev-java/jnr-ffi-2.0.3:0
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

JAVA_GENTOO_CLASSPATH="jnr-constants,jnr-ffi"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}