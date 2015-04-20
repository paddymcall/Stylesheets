<xsl:stylesheet
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:saxon="http://saxon.sf.net/"
    version="2.0"
    >
<!-- cf http://www.bramstein.com/projects/xsltjson/ for better
coverage -->
<xsl:strip-space elements="*"/>
<xsl:output method="text" encoding="utf-8" />

<xsl:param name="inq">"</xsl:param>
<xsl:param name="outq">\\"</xsl:param>
<xsl:param name="esIndexName">saritindex</xsl:param>
<xsl:param name="esTypeName">element</xsl:param>
<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Set the revision number of the set of files you're indexing.</desc>
</doc>
<xsl:param name="revision">UNKNOWN</xsl:param>
<doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
  <desc>Whether to produce nested objects or not. If you decide on
  true, this stylesheet will try to create nested documents
  (http://www.elastic.co/guide/en/elasticsearch/guide/current/nested-objects.html),
  in the following way:

  TEI/text/body ==> lg-s,p-s,note-s.

  You have to make sure you have set up the elasticsearch server to
  map this correctly.
  </desc>
</doc>
<xsl:param name="nested">false</xsl:param>


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
  <xsl:for-each select="//TEI/text/body">
    <xsl:variable name="currentDoc">
      <xsl:copy-of select="ancestor::TEI"/>
    </xsl:variable>
    <xsl:variable name="systemId">
      <xsl:copy-of select="saxon:systemId()"/>
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

    <xsl:if test="$nested='true'">
      <xsl:call-template name="makeJson">
	<xsl:with-param name="title" select="$title"/>
	<xsl:with-param name="author" select="$author" />
	<xsl:with-param name="systemId" select="$systemId"/>
	<xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
	<xsl:with-param name="workId" select="$workId"/>
	<xsl:with-param name="xmlId" select="$xmlId"/>
	<xsl:with-param name="typeName">work</xsl:with-param>
	<xsl:with-param name="ignoreText">true</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select=".//p[not(ancestor::note)]" mode="pars">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
    </xsl:apply-templates>
    <xsl:apply-templates select=".//lg[not(ancestor::note)]" mode="linegroups">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
    </xsl:apply-templates>
    <xsl:apply-templates select=".//note" mode="notes">
      <xsl:with-param name="title"><xsl:value-of select="$title"/></xsl:with-param>
      <xsl:with-param name="author"><xsl:value-of select="$author"/></xsl:with-param>
      <xsl:with-param name="systemId"><xsl:value-of select="$systemId"/></xsl:with-param>
      <xsl:with-param name="workId"><xsl:value-of select="$workId"/></xsl:with-param>
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
  <xsl:param name="lang"/>
  <xsl:param name="xmlId"/>
  <xsl:param name="workId"/>
  <xsl:param name="typeName"/>
  <xsl:param name="parent"/>
  <xsl:param name="ignoreText">false</xsl:param>
  <xsl:text>{ "index" : { "_index": "</xsl:text>
  <xsl:value-of select="$esIndexName"/>
  <xsl:text>", "_type": "</xsl:text>
  <xsl:value-of select="$typeName"/>
  <xsl:if test="$workId!=''">
    <xsl:text>", "_id": "</xsl:text>
    <xsl:value-of select="$workId"/>
  </xsl:if>
  <xsl:if test="$parent!=''">
    <xsl:text>", "parent": "</xsl:text>
    <xsl:value-of select="$parent"/>
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
  <xsl:value-of select="saxon:line-number()"/>
  <xsl:text>", "sysId" : "</xsl:text>
  <xsl:value-of select="$systemId"/>
  <xsl:text>", "lang" : "</xsl:text>
  <xsl:value-of select="$lang"/>
  <xsl:if test="$ignoreText!='true'">
    <xsl:text>", "text" : "</xsl:text>
    <xsl:apply-templates />
  </xsl:if>
  <xsl:if test="$title!=''">
    <xsl:text>", "title" : "</xsl:text>
    <xsl:value-of  select="$title"/>
  </xsl:if>
  <xsl:if test="$author!=''">
    <xsl:text>", "author" : "</xsl:text>
    <xsl:value-of  select="$author"/>
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
  <xsl:param name="workId"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
      <xsl:if test="$nested!='true'">
	<xsl:value-of select="$title" />
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="author">
      <xsl:if test="$nested!='true'">
      <xsl:value-of select="$author" />
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="parent">
      <xsl:if test="$nested='true'">
	<xsl:value-of select="$workId"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="lg">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="lg" mode="linegroups">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="workId"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
      <xsl:if test="$nested!='true'">
	<xsl:value-of select="$title" />
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="author">
      <xsl:if test="$nested!='true'">
	<xsl:value-of select="$author" />
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="parent">
      <xsl:if test="$nested='true'">
	<xsl:value-of select="$workId"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="note" />

<xsl:template match="note" mode="notes">
  <xsl:param name="title"/>
  <xsl:param name="author"/>
  <xsl:param name="systemId"/>
  <xsl:param name="workId"/>
  <xsl:call-template name="makeJson">
    <xsl:with-param name="title">
      <xsl:if test="$nested!='true'">
	<xsl:value-of select="$title" />
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="author">
      <xsl:if test="$nested!='true'">
	<xsl:text>Editorial</xsl:text>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="systemId" select="$systemId"/>
    <xsl:with-param name="lang" select="./ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
    <xsl:with-param name="typeName" select="$esTypeName"/>
    <xsl:with-param name="parent">
      <xsl:if test="$nested='true'">
	<xsl:value-of select="$workId"/>
      </xsl:if>
    </xsl:with-param>
    <xsl:with-param name="xmlId">
      <xsl:if test="@xml:id">
	<xsl:value-of select="@xml:id"/>
      </xsl:if>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="text()">
  <xsl:value-of select="replace(replace(replace(normalize-space(.),'\\','\\\\'), '&#10;', ' '),$inq,$outq)"/>
</xsl:template>

<xsl:template name="newline">
  <xsl:text>&#10;</xsl:text>
</xsl:template>
</xsl:stylesheet>
