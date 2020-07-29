# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-transport-rxtx-5.0.0.Alpha2.pom --download-uri https://repo1.maven.org/maven2/io/netty/netty-transport-rxtx/5.0.0.Alpha2/netty-transport-rxtx-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-transport-rxtx-5.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty-transport-rxtx/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-transport-rxtx:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# io.netty:netty-buffer:5.0.0.Alpha2 -> >=dev-java/netty-buffer-5.0.0:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=dev-java/netty-transport-5.0.0:0
# org.rxtx:rxtx:2.1.7 -> >=dev-java/rxtx-2.2_pre2:2

CDEPEND="
	>=dev-java/netty-buffer-5.0.0:0
	>=dev-java/netty-transport-5.0.0:0
	>=dev-java/rxtx-2.2_pre2:2
"


DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="netty-buffer,netty-transport,rxtx-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
