<xsl:stylesheet
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0"
    >
<!-- cf http://www.bramstein.com/projects/xsltjson/ for better
     coverage -->
<xsl:strip-space elements="*"/>

<xsl:output method="text" encoding="utf-8"/>

<xsl:output name="xmlSrc" method="xml" indent="no" omit-xml-declaration="yes" encoding="utf-8" use-character-maps="escapeInXML" />
<xsl:character-map name="escapeInXML">
  <xsl:output-character character="&#10;" string="&lt;lb /&gt;"/>
  <xsl:output-character character="\" string="\\"/>
</xsl:character-map>

<xsl:character-map name="escapeCtrl">
  <!-- <xsl:output-character character="&#8;" string="\b" /> -->
  <!-- <xsl:output-character character="&#12;" string="\f" /> -->
  <xsl:output-character character="&#9;" string="\t" />
  <xsl:output-character character="&#10;" string="\n" />
  <xsl:output-character character="&#13;" string="\r" />
  <xsl:output-character character="&#34;" string="\&#34;" />
  <xsl:output-character character="&#47;" string="\/" />
  <xsl:output-character character="&#92;" string="\\" />
</xsl:character-map>


<xsl:param name="inq">"</xsl:param>
<xsl:param name="outq">\\"</xsl:param>
<xsl:param name="esIndexName">saritindex</xsl:param>
<xsl:param name="esTypeName">element</xsl:param>
<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Set the revision number of the set of files you're indexing.</desc>
</doc>
<xsl:param name="revision">UNKNOWN</xsl:param>

<xsl:param name="includeXMLSrc">false</xsl:param>

<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Produce a simple title.</desc>
</doc>
<xsl:template name="getTitle">
  <xsl:param name="currentDoc"/>
  <xsl:for-each select="$currentDoc//descendant::titleStmt/descendant::title">
    <xsl:apply-templates/>
    <xsl:if test="position() != last()">
      <xsl:text> || </xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Produce a simple author statement.</desc>
</doc>
<xsl:template name="getAuthor">
  <xsl:param name="currentDoc"/>
  <xsl:for-each select="$currentDoc//descendant::titleStmt/descendant::author">
    <xsl:apply-templates/>
    <xsl:if test="position() != last()">
      <xsl:text> || </xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>The document is processed here. The main idea is to iterate
  over the elements in the body, collecting 1) the filename, 2) the
  title, 3) the author, and 4) some content: currently all paragraphs,
  lg-s, and notes.
  </desc>
</doc>
<xsl:template match="/">
  <xsl:message>Starting to process <xsl:value-of select="local-name()"/> on line <xsl:value-of select="saxon:line-number()"/></xsl:message>
  <xsl:variable name="baseURL">
    <xsl:choose>
      <xsl:when test="/teiCorpus/@xml:base">
	<xsl:value-of select="/teiCorpus/@xml:base"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:copy-of select="saxon:systemId()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:for-each select="//TEI/text/body">
    <xsl:variable name="currentTEIstartline" select="saxon:line-number(ancestor::TEI)" as="xs:integer"/>
    <xsl:message>New TEI doc starting at <xsl:value-of select="$currentTEIstartline"/></xsl:message>
    <xsl:variable name="currentDoc">
      <xsl:copy-of select="ancestor::TEI"/>
    </xsl:variable>
    <xsl:variable name="systemId">
      <xsl:choose>
	<xsl:when test="ancestor::TEI/@xml:base">
	  <xsl:value-of select="ancestor::TEI/@xml:base"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:copy-of select="saxon:systemId()"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="relativeLnum" as="xs:boolean">
      <xsl:choose>
	<xsl:when test="ancestor::TEI/@xml:base">
	  <xsl:value-of select="true()"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="false()"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="title">
      <xsl:call-template name="getTitle">
	<xsl:with-param name="currentDoc" select="$currentDoc"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="author">
      <xsl:call-template name="getAuthor">
	<xsl:with-param name="currentDoc" select="$currentDoc"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="xmlId">
      <xsl:value-of select="ancestor::TEI/@xml:id"/>
    </xsl:variable>
    <xsl:variable name="workId">
      <xsl:choose>
	<xsl:when test="$xmlId!='' and $revision!=''">
	  <xsl:value-of select="$revision"/>
	  <xsl:text>:</xsl:text>
	  <xsl:value-of select="$xmlId"/>
	</xsl:when>
	<xsl:when test="$revision!=''">
	  <xsl:value-of select="$revision"/>
	  <xsl:text>__workId__</xsl:text>
	  <xsl:value-of select="count(ancestor::TEI/preceding-sibling::TEI)"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text>badId__</xsl:text>
	  <xsl:value-of select="count(ancestor::TEI/preceding-sibling::TEI)"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:apply-templates select=".//p[not(ancestor::note)]" mode="pars">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="baseURL"><xsl:value-of select="$baseURL"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
      <xsl:with-param name="currentTEIstartline"><xsl:value-of select="$currentTEIstartline"/></xsl:with-param>
      <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
    </xsl:apply-templates>
    <xsl:apply-templates select=".//lg[not(ancestor::note)]" mode="linegroups">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="baseURL"><xsl:value-of select="$baseURL"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
      <xsl:with-param name="currentTEIstartline"><xsl:value-of select="$currentTEIstartline"/></xsl:with-param>
      <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
    </xsl:apply-templates>
    <xsl:apply-templates select=".//l[not(ancestor::lg)]" mode="lines">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="baseURL"><xsl:value-of select="$baseURL"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
      <xsl:with-param name="currentTEIstartline"><xsl:value-of select="$currentTEIstartline"/></xsl:with-param>
      <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
    </xsl:apply-templates>
    <xsl:apply-templates select=".//note" mode="notes">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="baseURL"><xsl:value-of select="$baseURL"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
<xsl:with-param name="currentTEIstartline"><xsl:value-of select="$currentTEIstartline"/></xsl:with-param>
      <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
    </xsl:apply-templates>
    <!-- avoid losing text -->
    <xsl:apply-templates select=".//*" mode="fallback">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="baseURL"><xsl:value-of select="$baseURL"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
      <xsl:with-param name="currentTEIstartline"><xsl:value-of select="$currentTEIstartline"/></xsl:with-param>
      <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
    </xsl:apply-templates>
  </xsl:for-each>
</xsl:template>

<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Produce some json output that suits elasticSearch's bulk feed methods.</desc>
</doc>
<xsl:template name="makeJson">
  <xsl:param name="context"/>
  <xsl:param name="title" />
  <xsl:param name="author" />
  <xsl:param name="systemId" />
  <xsl:param name="baseURL" />
  <xsl:param name="currentTEIstartline"/>
  <xsl:param name="relativeLnum" />
  <xsl:param name="lang"/>
  <xsl:param name="xmlId"/>
  <xsl:param name="workId"/>
  <xsl:param name="typeName"/>
  <xsl:param name="parent"/>
  <xsl:param name="ignoreText">false</xsl:param>
  <xsl:text>{ "index" : { "_index": "</xsl:text>
  <xsl:value-of select="$esIndexName"/>
  <xsl:if test="$workId!=''">
    <xsl:text>", "_id": "</xsl:text>
    <xsl:value-of select="$workId"/>
  </xsl:if>
  <xsl:text>" }}</xsl:text>
  <xsl:call-template name="newline"/>
  <xsl:text>{  "tag" : "</xsl:text>
  <xsl:value-of select="local-name()"/>
  <xsl:text>", "revision" :"</xsl:text>
  <xsl:value-of select="$revision"/>
  <xsl:text>", "xmlId" : "</xsl:text>
  <xsl:value-of select="$xmlId"/>
  <xsl:text>", "path" : "</xsl:text>
  <xsl:value-of select="saxon:path()"/>
  <xsl:text>", "lnum" : "</xsl:text>
  <!-- pretty much trial and error, here. -->
  <!-- <xsl:message> -->
  <!--   Line number: <xsl:value-of select="saxon:line-number()"/> -->
  <!--   Current TEI start: <xsl:value-of select="$currentTEIstartline"/> -->
  <!--   TEI doc number: <xsl:value-of select="count(ancestor::TEI/preceding-sibling::TEI) + 1"/> -->
  <!--   Variance: <xsl:value-of select="(count(ancestor::TEI/preceding-sibling::TEI) + 1) * 2"/> -->
  <!--   Text: <xsl:apply-templates/> -->
  <!--   Upshot: <xsl:value-of select="saxon:line-number() - $currentTEIstartline + count(ancestor::TEI/preceding-sibling::TEI)"/> -->
  <!-- I think the main idea is that saxon:line-number() starts from 0, and the xinclude removes the xml declarations. -->
  <!-- </xsl:message> -->
  <xsl:choose>
    <xsl:when test="$relativeLnum">
      <xsl:value-of select="saxon:line-number() - $currentTEIstartline + 2"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="saxon:line-number()"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>", "absLnum" : "</xsl:text>
  <xsl:value-of select="saxon:line-number()"/>
  <xsl:text>", "sysId" : "</xsl:text>
  <xsl:value-of select="$systemId"/>
  <xsl:text>", "lang" : "</xsl:text>
  <xsl:value-of select="$lang"/>
  <xsl:text>", "baseURL" : "</xsl:text>
  <xsl:value-of select="$baseURL"/>
  <xsl:if test="$ignoreText!='true'">
    <xsl:text>", "text" : "</xsl:text>
    <xsl:apply-templates />
  </xsl:if>
  <xsl:text>", "title" : "</xsl:text>
  <xsl:choose>
    <xsl:when test="ancestor::quote[matches(@type, 'base')]">
      <xsl:value-of select="string-join(ancestor::TEI/teiHeader//title[matches(@subtype, 'base')], ' | ')"/>
    </xsl:when>
    <xsl:when test="ancestor::TEI/teiHeader//title[matches(@subtype, 'comm')]">
      <xsl:value-of select="string-join(ancestor::TEI/teiHeader//title[matches(@subtype, 'comm')], ' | ')"/>
    </xsl:when>
    <xsl:when test="$title!=''">
      <xsl:value-of  select="$title"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>NO TITLE</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>", "author" : "</xsl:text>
  <xsl:choose>
    <xsl:when test="ancestor::quote[matches(@type, 'base')]">
      <xsl:value-of select="string-join(ancestor::TEI/teiHeader//author[matches(@role, 'base')], ' | ')"/>
    </xsl:when>
    <xsl:when test="ancestor::TEI/teiHeader//author[matches(@role, 'comm')]">
      <xsl:value-of select="string-join(ancestor::TEI/teiHeader//author[matches(@role, 'comm')], ' | ')"/>
    </xsl:when>
    <xsl:when test="$author!=''">
      <xsl:value-of  select="$author"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>Anonymous</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:if  test="$includeXMLSrc='true'">
    <xsl:text>", "xmlSrc" : "</xsl:text>
    <xsl:value-of select="replace(saxon:serialize(., 'xmlSrc'), '&#x22;', '\\&#x22;')"/>
  </xsl:if>
  <xsl:text>"}</xsl:text>
  <xsl:call-template name="newline"/>
</xsl:template>

<xsl:template match="p">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="p" mode="pars">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="baseURL"/>
  <xsl:param name="workId"/>
  <xsl:param name="currentTEIstartline"/>
  <xsl:param name="relativeLnum"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
      <xsl:value-of select="$title" />
    </xsl:with-param>
    <xsl:with-param name="author">
      <xsl:value-of select="$author" />
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="baseURL" select="$baseURL"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="currentTEIstartline" select="$currentTEIstartline"/>
    <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="lg">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="lg" mode="linegroups">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="baseURL"/>
  <xsl:param name="currentTEIstartline"/>
  <xsl:param name="relativeLnum"/>
  <xsl:param name="workId"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
	<xsl:value-of select="$title" />
    </xsl:with-param>
    <xsl:with-param name="author">
	<xsl:value-of select="$author" />
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="baseURL" select="$baseURL"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="currentTEIstartline" select="$currentTEIstartline"/>
    <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="l">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="l" mode="lines">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="baseURL"/>
  <xsl:param name="currentTEIstartline"/>
  <xsl:param name="relativeLnum"/>
  <xsl:param name="workId"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
	<xsl:value-of select="$title" />
    </xsl:with-param>
    <xsl:with-param name="author">
	<xsl:value-of select="$author" />
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="baseURL" select="$baseURL"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="currentTEIstartline" select="$currentTEIstartline"/>
    <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="note" />

<xsl:template match="note" mode="notes">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="baseURL"/>
  <xsl:param name="currentTEIstartline"/>
  <xsl:param name="relativeLnum"/>
  <xsl:param name="workId"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
	<xsl:value-of select="$title" />
    </xsl:with-param>
    <xsl:with-param name="author">
	<xsl:text>Editorial</xsl:text>
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="baseURL" select="$baseURL"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="currentTEIstartline" select="$currentTEIstartline"/>
    <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*">
  <xsl:apply-templates />
</xsl:template>

<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Fallback processing: take only nodes that were not parsed
  above and have interesting text content. TODO: improve with test
  cases.</desc>
</doc>
<xsl:template match="*" mode="fallback">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="baseURL"/>
  <xsl:param name="workId"/>
  <xsl:param name="currentTEIstartline"/>
  <xsl:param name="relativeLnum"/>
  <xsl:if test="not(string-join(text()/normalize-space(.), '') = '') and
		not(ancestor-or-self::note) and
		not(ancestor-or-self::lg) and
		not(ancestor-or-self::p) and
		not(ancestor-or-self::l[not(ancestor::lg)]) and
		string-join(.//text()[
		not(ancestor::note) and
		not(ancestor::lg) and
		not(ancestor::p) and
		not(ancestor::l[not(ancestor::lg)])]/normalize-space(.), '') != ''">
    <xsl:message>Fallback for <xsl:value-of select="saxon:path()"/></xsl:message>
    <xsl:call-template name="makeJson">
      <xsl:with-param name="title">
	  <xsl:value-of select="$title" />
      </xsl:with-param>
      <xsl:with-param name="author">
	  <xsl:value-of select="$author" />
      </xsl:with-param>
      <xsl:with-param name="systemId" select="$systemId"/>
      <xsl:with-param name="baseURL" select="$baseURL"/>
      <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
      <xsl:with-param name="typeName" select="$esTypeName"/>
      <xsl:with-param name="xmlId">
	<xsl:if test="@xml:id">
	  <xsl:value-of select="@xml:id"/>
	</xsl:if>
      </xsl:with-param>
      <xsl:with-param name="currentTEIstartline" select="$currentTEIstartline"/>
      <xsl:with-param name="relativeLnum" select="$relativeLnum"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template match="text()">
  <!-- <xsl:message>Before: "<xsl:value-of select="."/>"</xsl:message> -->
  <xsl:value-of select="replace(replace(replace(replace(.,'\\','\\\\'), '&#10;', ' '),$inq,$outq), '&#9;', '\\t')"/>
  <!-- <xsl:message>After: "<xsl:value-of select="replace(replace(replace(.,'\\','\\\\'), '&#10;', ' '),$inq,$outq)"/>"</xsl:message> -->
</xsl:template>

<xsl:template name="newline">
  <xsl:text>&#10;</xsl:text>
</xsl:template>
</xsl:stylesheet>
