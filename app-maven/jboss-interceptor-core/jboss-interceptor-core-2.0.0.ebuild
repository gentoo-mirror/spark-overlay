# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-interceptor-core-2.0.0.CR1.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/interceptor/jboss-interceptor-core/2.0.0.CR1/jboss-interceptor-core-2.0.0.CR1-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-interceptor-core-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss EJB 3.1 Common Interceptor Library Parent"
HOMEPAGE="http://www.jboss.org/jboss-interceptor-parent/jboss-interceptor-core"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/interceptor/${PN}/${PV}.CR1/${P}.CR1-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.interceptor:jboss-interceptor-core:2.0.0.CR1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.CR1.pom
# com.google.guava:guava:r06 -> >=dev-java/guava-29.0:0
# javassist:javassist:3.12.0.GA -> >=dev-java/javassist-3.21.0:3
# org.jboss.interceptor:jboss-interceptor-spi:2.0.0.CR1 -> >=app-maven/jboss-interceptor-spi-2.0.0:0
# org.slf4j:slf4j-api:1.5.6 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/jboss-interceptor-spi-2.0.0:0
	>=dev-java/guava-29.0:0
	>=dev-java/javassist-3.21.0:3
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.CR1.pom
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> !!!artifactId-not-found!!!

DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
	!!!artifactId-not-found!!!
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,javassist-3,jboss-interceptor-spi,slf4j-api"
JAVA_CLASSPATH_EXTRA="!!!artifactId-not-found!!!"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}