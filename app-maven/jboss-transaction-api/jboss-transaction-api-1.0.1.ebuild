# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-transaction-api_1.2_spec-1.0.1.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/spec/javax/transaction/jboss-transaction-api_1.2_spec/1.0.1.Final/jboss-transaction-api_1.2_spec-1.0.1.Final-sources.jar --slot 1.2_spec --keywords "~amd64" --ebuild jboss-transaction-api-1.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Java Transaction 1.2 API classes"
HOMEPAGE="http://www.jboss.org/jboss-transaction-api_1.2_spec"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/spec/javax/transaction/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="1.2_spec"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.spec.javax.transaction:jboss-transaction-api_1.2_spec:1.0.1.Final"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_1.2_spec-${PV}.Final.pom
# javax.enterprise:cdi-api:1.2 -> >=dev-java/cdi-api-1.2:1.2
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.2_spec:1.0.0.Final -> >=app-maven/jboss-interceptors-api-1.0.0:1.2_spec

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	>=app-maven/jboss-interceptors-api-1.0.0:1.2_spec
	>=dev-java/cdi-api-1.2:1.2
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="cdi-api-1.2,jboss-interceptors-api-1.2_spec"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}