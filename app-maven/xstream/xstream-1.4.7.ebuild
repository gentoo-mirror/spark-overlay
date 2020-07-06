# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xstream-1.4.7.pom --download-uri https://repo.maven.apache.org/maven2/com/thoughtworks/xstream/xstream/1.4.7/xstream-1.4.7-sources.jar --slot 0 --keywords "~amd64" --ebuild xstream-1.4.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="XStream is a serialization library from Java objects to XML and back."
HOMEPAGE="http://codehaus.org/xstream-parent/xstream/"
SRC_URI="https://repo.maven.apache.org/maven2/com/thoughtworks/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.thoughtworks.xstream:xstream:1.4.7"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# cglib:cglib-nodep:2.2 -> >=dev-java/cglib-3.1:3
# dom4j:dom4j:1.6.1 -> >=dev-java/dom4j-1.6.1:1
# joda-time:joda-time:1.6 -> >=dev-java/joda-time-2.7:0
# net.sf.kxml:kxml2:2.3.0 -> >=dev-java/kxml-2.3.0:2
# net.sf.kxml:kxml2-min:2.3.0 -> >=dev-java/kxml-2.3.0:2
# org.codehaus.jettison:jettison:1.2 -> >=dev-java/jettison-1.3.7:0
# org.codehaus.woodstox:wstx-asl:3.2.7 -> >=app-maven/wstx-asl-3.2.7:0
# org.jdom:jdom:1.1.3 -> >=dev-java/jdom-1.1.3:0
# org.jdom:jdom2:2.0.5 -> >=dev-java/jdom-2.0.6:2
# org.json:json:20080701 -> >=dev-java/json-20150729:0
# stax:stax:1.2.0 -> >=java-virtuals/stax-api-1:0
# stax:stax-api:1.0.1 -> >=java-virtuals/stax-api-1:0
# xmlpull:xmlpull:1.1.3.1 -> >=app-maven/xmlpull-1.1.3.1:0
# xom:xom:1.1 -> >=dev-java/xom-1.2.10:0
# xpp3:xpp3_min:1.1.4c -> >=dev-java/xpp3-1.1.4c:0

CDEPEND="
	>=app-maven/wstx-asl-3.2.7:0
	>=app-maven/xmlpull-1.1.3.1:0
	>=dev-java/cglib-3.1:3
	>=dev-java/dom4j-1.6.1:1
	>=dev-java/jdom-1.1.3:0
	>=dev-java/jdom-2.0.6:2
	>=dev-java/jettison-1.3.7:0
	>=dev-java/joda-time-2.7:0
	>=dev-java/json-20150729:0
	>=dev-java/kxml-2.3.0:2
	>=dev-java/xom-1.2.10:0
	>=dev-java/xpp3-1.1.4c:0
	>=java-virtuals/stax-api-1:0
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

JAVA_GENTOO_CLASSPATH="cglib-3,dom4j-1,joda-time,kxml-2,kxml-2,jettison,wstx-asl,jdom,jdom-2,json,stax-api,stax-api,xmlpull,xom,xpp3"
JAVA_SRC_DIR="src/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}