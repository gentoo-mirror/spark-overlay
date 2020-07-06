# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-client-2.5.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-yarn-client/2.5.1/hadoop-yarn-client-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-client-2.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-client:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# com.sun.jersey:jersey-client:1.9 -> >=app-maven/jersey-client-1.9:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=app-maven/hadoop-annotations-2.5.1:0
# org.apache.hadoop:hadoop-yarn-api:2.5.1 -> >=app-maven/hadoop-yarn-api-2.5.1:0
# org.apache.hadoop:hadoop-yarn-common:2.5.1 -> >=app-maven/hadoop-yarn-common-2.5.1:0
# org.mortbay.jetty:jetty-util:6.1.26 -> >=app-maven/jetty-util-6.1.26:0

CDEPEND="
	>=app-maven/hadoop-annotations-2.5.1:0
	>=app-maven/hadoop-yarn-api-2.5.1:0
	>=app-maven/hadoop-yarn-common-2.5.1:0
	>=app-maven/jersey-client-1.9:0
	>=app-maven/jetty-util-6.1.26:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/log4j-1.2.17:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:2.5.1 -> >=app-maven/hadoop-common-2.5.1:0

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-common-2.5.1:0
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,jersey-client,commons-cli-1,commons-lang-2.1,commons-logging,log4j,hadoop-annotations,hadoop-yarn-api,hadoop-yarn-common,jetty-util"
JAVA_CLASSPATH_EXTRA="hadoop-common"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}