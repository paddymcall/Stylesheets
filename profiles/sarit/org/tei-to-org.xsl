<xsl:stylesheet 
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:tei-examples="http://www.tei-c.org/ns/Examples"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:import href="../../../common/common.xsl"/>
  
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
    <desc>
      <p>Attempt to get plain text output in OrgMode format (see
      <ref
          target="http://orgmode.org/worg/dev/org-syntax.html"/>). Started
      off as a copy of the markdown converter.
      </p>
    </desc>
  </doc>
  
  

  <xsl:strip-space elements="additional address adminInfo
			     altGrp altIdentifier analytic
			     app appInfo application
			     arc argument attDef
			     attList availability back
			     biblFull biblStruct bicond
			     binding bindingDesc body
			     broadcast cRefPattern calendar
			     calendarDesc castGroup
			     castList category certainty
			     char charDecl charProp
			     choice cit classDecl
			     classSpec classes climate
			     cond constraintSpec correction
			     custodialHist decoDesc
			     dimensions div div1 div2
			     div3 div4 div5 div6
			     div7 divGen docTitle eLeaf
			     eTree editionStmt
			     editorialDecl elementSpec
			     encodingDesc entry epigraph
			     epilogue equipment event
			     exemplum fDecl fLib
			     facsimile figure fileDesc
			     floatingText forest front
			     fs fsConstraints fsDecl
			     fsdDecl fvLib gap glyph
			     graph graphic group
			     handDesc handNotes history
			     hom hyphenation iNode if
			     imprint incident index
			     interpGrp interpretation join
			     joinGrp keywords kinesic
			     langKnowledge langUsage
			     layoutDesc leaf lg linkGrp
			     list listBibl listChange
			     listEvent listForest listNym
			     listOrg listPerson listPlace
			     listRef listRelation
			     listTranspose listWit location
			     locusGrp macroSpec metDecl
			     moduleRef moduleSpec monogr
			     msContents msDesc msIdentifier
			     msItem msItemStruct msPart
			     namespace node normalization
			     notatedMusic notesStmt nym
			     objectDesc org particDesc
			     performance person personGrp
			     physDesc place population
			     postscript precision
			     profileDesc projectDesc
			     prologue publicationStmt
			     quotation rdgGrp recordHist
			     recording recordingStmt
			     refsDecl relatedItem relation
			     relationGrp remarks respStmt
			     respons revisionDesc root
			     row samplingDecl schemaSpec
			     scriptDesc scriptStmt seal
			     sealDesc segmentation
			     seriesStmt set setting
			     settingDesc sourceDesc
			     sourceDoc sp spGrp space
			     spanGrp specGrp specList
			     state stdVals subst
			     substJoin superEntry
			     supportDesc surface surfaceGrp
			     table tagsDecl taxonomy
			     teiCorpus teiHeader terrain
			     text textClass textDesc
			     timeline titlePage titleStmt
			     trait transpose tree
			     triangle typeDesc vAlt
			     vColl vDefault vLabel
			     vMerge vNot vRange valItem
			     valList vocal"/>

  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
    <desc>

      <p>This software is dual-licensed:

      1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
      Unported License http://creativecommons.org/licenses/by-sa/3.0/ 

      2. http://www.opensource.org/licenses/BSD-2-Clause
      


      Redistribution and use in source and binary forms, with or without
      modification, are permitted provided that the following conditions are
      met:

      * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.

      * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

      This software is provided by the copyright holders and contributors
      "as is" and any express or implied warranties, including, but not
      limited to, the implied warranties of merchantability and fitness for
      a particular purpose are disclaimed. In no event shall the copyright
      holder or contributors be liable for any direct, indirect, incidental,
      special, exemplary, or consequential damages (including, but not
      limited to, procurement of substitute goods or services; loss of use,
      data, or profits; or business interruption) however caused and on any
      theory of liability, whether in contract, strict liability, or tort
      (including negligence or otherwise) arising in any way out of the use
      of this software, even if advised of the possibility of such damage.
      </p>
      <p>Author: See AUTHORS</p>
      
      <p>Copyright: 2013, TEI Consortium</p>
    </desc>
  </doc>

  
  <xsl:character-map name="escape-stars">
    <xsl:output-character character="*" string="\*"/>
    <xsl:output-character character="⋆" string="*"/>
  </xsl:character-map>

  <xsl:character-map name="escape-vertical-lines">
    <xsl:output-character character="|" string="\vert"/>
  </xsl:character-map>
  
  <xsl:output method="text" use-character-maps="escape-stars escape-vertical-lines"/>
  <xsl:output name="xmlout" method="xml" omit-xml-declaration="yes" indent="yes"/>

  <xsl:template match="teiHeader">
    <xsl:text>#+TITLE: </xsl:text>
    <xsl:for-each select=".//tei:titleStmt/tei:title">
      <xsl:value-of select="text()"/>
      <xsl:if test="following-sibling::tei:title">
	<xsl:text> || </xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test=".//tei:titleStmt/tei:author">
      <xsl:call-template name="newline"/>
      <xsl:text>#+AUTHOR: </xsl:text>
      <xsl:for-each select=".//tei:titleStmt/tei:author">
	<xsl:value-of select="text()"/>
	<xsl:if test="following-sibling::tei:author">
	  <xsl:text> || </xsl:text>
	</xsl:if>
      </xsl:for-each>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:text>#+OPTIONS: broken-links:mark</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:call-template name="newline"/>
    <xsl:text>⋆ Header</xsl:text>
    <xsl:call-template name="newline"/>
    <xsl:call-template name="makeBlock">
      <xsl:with-param name="style" select="'SRC'"/>
      <xsl:with-param name="extras" select="'xml'"/>
    </xsl:call-template>
    <xsl:call-template name="newline"/>
  </xsl:template>
  
  <xsl:template match="figDesc"/>
  
  <xsl:template match="gap/desc"/>
  
  <xsl:template match="choice">
    <xsl:apply-templates select="*[1]"/>
  </xsl:template>
  
  <xsl:template match="speaker"/>
  
  <xsl:template match="facsimile"/>

  <xsl:template name="appReading">
    <xsl:param name="lemma"/>
    <xsl:param name="lemmawitness"/>
    <xsl:param name="readings"/>
  </xsl:template>

  <xsl:template match="tei:hi">
    <xsl:call-template name="emphasize">
      <xsl:with-param name="class">
	<xsl:value-of select="@rend" />
      </xsl:with-param>
      <xsl:with-param name="content">
	<xsl:apply-templates/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="emphasize">
    <xsl:param name="class"/>
    <xsl:param name="content"/>
    <xsl:variable name="decorator">
      <xsl:choose>
	<xsl:when test="matches($class, 'it')">/</xsl:when>
	<xsl:when test="matches($class, 'b')">⋆</xsl:when>
	<xsl:when test="matches($class, 'v')">=</xsl:when>
	<xsl:when test="$class='strike-through'">+</xsl:when>
	<xsl:when test="$class='underline'">_</xsl:when>
	<xsl:when test="$class='code'">~</xsl:when>
	<xsl:otherwise>/</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$decorator"/>
    <xsl:value-of select="$content"/>
    <xsl:value-of select="$decorator"/>
  </xsl:template>


  <xsl:template name="generateEndLink">
    <xsl:param name="where"/>
  </xsl:template>

  <xsl:template name="horizontalRule">
    <xsl:text>&#10;---&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="makeBlock">
    <xsl:param name="style" as="xs:string"/>
    <xsl:param name="extras" select="''" as="xs:string"/>
    <xsl:call-template name="newline"/>
    <xsl:text>#+BEGIN_</xsl:text>
    <xsl:value-of select="fn:upper-case($style)"/>
    <xsl:if test="fn:upper-case($style)='SRC' and $extras!=''">
      <xsl:text> </xsl:text>
      <xsl:value-of select="$extras"/>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:choose>
      <xsl:when test="fn:upper-case($style)='SRC' and ($extras='nxml' or $extras='xml')">
	<!-- just output xml here -->
	<xsl:copy-of select="saxon:serialize(., 'xmlout')"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="newline"/>
    <xsl:text>#+END_</xsl:text>
    <xsl:value-of select="fn:upper-case($style)"/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template name="makeInline">
    <xsl:param name="before"/>
    <xsl:param name="style"/>
    <xsl:param name="after"/>
  </xsl:template>

  <xsl:template name="makeSpan">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:p">
    <xsl:call-template name="newline"/>
    <xsl:if test="matches(fn:normalize-space((.//text())[1]), '^\|')">
      <xsl:text>\</xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="tei:p" mode="note">
    <xsl:if test="preceding-sibling::tei:p">
      <xsl:call-template name="newline"/>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="tei:title">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:del">
    <xsl:text>(- </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="tei:add">
    <xsl:text>(+ </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="tei:unclear">
    <xsl:text>(? </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="tei:label">
    <xsl:choose>
      <xsl:when test="not(preceding-sibling::*)">
	<xsl:variable name="depth">
	  <xsl:value-of  select="count(ancestor::tei:div)"/>
	</xsl:variable>
	<xsl:for-each select="1 to $depth">
	  <xsl:text>⋆</xsl:text>
	</xsl:for-each>
	<xsl:text> </xsl:text>
	<xsl:apply-templates />
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:head">
    <xsl:choose>
      <xsl:when test="parent::castList"/>
      <xsl:when test="parent::figure"/>
      <xsl:when test="parent::list"/>
      <xsl:when test="parent::table"/>
      <xsl:when test="preceding-sibling::head">
	<xsl:text> || </xsl:text>
	<xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="depth">
          <xsl:value-of select="count(ancestor::node())"/>
        </xsl:variable>
        <xsl:call-template name="newline"/>
	<xsl:for-each select="4 to $depth">
	  <xsl:text>⋆</xsl:text>
	</xsl:for-each>
	<xsl:text> </xsl:text>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="not(following-sibling::head)">
      <xsl:call-template name="newline"/>
    </xsl:if>
    <xsl:if test="starts-with(parent::*/local-name(), 'div') and parent::node()[@xml:id]">
      <xsl:call-template name="insertTarget">
	<xsl:with-param name="target" select="parent::node()/@xml:id"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/tei:TEI" mode="note">
    <xsl:if test="count(//tei:app) > 0">
      <xsl:call-template name="newline"/>
      <xsl:text>⋆ Text-Critical Notes</xsl:text>
      <xsl:call-template name="newline"/>
      <xsl:apply-templates select="//tei:app" mode="note"/>
    </xsl:if>
    <xsl:if test="count(//tei:note[not(ancestor::tei:app)]) > 0">
      <xsl:call-template name="newline"/>
      <xsl:text>⋆ Footnotes</xsl:text>
      <xsl:call-template name="newline"/>
      <xsl:apply-templates select="//tei:note" mode="note" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="makeOrgLink">
    <xsl:param name="pointer" as="xs:string"/>
    <xsl:param name="name" as="xs:string" select="''"/>
    <xsl:variable name="linkTo">
      <xsl:choose>
	<xsl:when test="matches($pointer, '^#')">
	  <xsl:value-of select="substring-after($pointer, '#')"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$pointer"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="not($name='')">
	<xsl:value-of select="concat('[[', $linkTo, '][', $name, ']]')"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="concat('[[', $linkTo, ']]')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:app">
    <xsl:choose>
      <xsl:when test="ancestor::tei:listApp"/>
      <xsl:otherwise>
	<xsl:if test="not(@from) and not(@to)">
	  <xsl:value-of select="(tei:lem|tei:rdg)[1]"/>
	</xsl:if>
	<xsl:text>&#8205;</xsl:text>
	<xsl:text>[fn:c-</xsl:text>
	<xsl:number level="any" count="tei:app"/>
	<xsl:text>]</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:listApp" />

  <xsl:template match="tei:app" mode="note">
    <xsl:call-template name="newline"/>
    <xsl:text>[fn:c-</xsl:text>
    <xsl:number level="any" count="tei:app"/>
    <xsl:text>] </xsl:text>
    <xsl:text>App entry: </xsl:text>
    <xsl:if test="@xml:id">
      <xsl:call-template name="insertTarget">
	<xsl:with-param name="target" select="@xml:id"/>
      </xsl:call-template>
      <xsl:call-template name="newline"/>
    </xsl:if>
    <xsl:choose>
      <xsl:when test=".//lem">
	<xsl:value-of select="(.//lem)[1]"/>
      </xsl:when>
      <xsl:when test=".//rdg">
	<xsl:value-of select="(.//rdg)[1]"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="'(no lemma)'"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="newline"/>
    <xsl:if test="@from">
      <xsl:text>- from </xsl:text>
      <xsl:call-template name="makeOrgLink">
	<xsl:with-param name="pointer" select="@from"/>
      </xsl:call-template>
      <xsl:call-template name="newline"/>
    </xsl:if>
    <xsl:if test="@to">
      <xsl:text>- to </xsl:text>
      <xsl:call-template name="makeOrgLink">
	<xsl:with-param name="pointer" select="@to"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:call-template name="newline"/>
    <xsl:apply-templates/>
    <xsl:call-template name="newline"/>
    <xsl:call-template name="makeBlock">
      <xsl:with-param name="style" select="'SRC'"/>
      <xsl:with-param name="extras" select="'xml'"/>
    </xsl:call-template>
    <xsl:call-template name="newline"/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="tei:rdg|tei:lem">
    <xsl:text>- </xsl:text>
    <xsl:value-of select="local-name()"/>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates />
    <xsl:if test="count(@wit|@source|@cit|@resp) > 0">
      <xsl:text> (</xsl:text>
    </xsl:if>
    <xsl:for-each select="@wit|@source|@cit|@resp">
      <xsl:value-of select="local-name()"/>
      <xsl:text>: </xsl:text>
      <xsl:for-each select="tokenize(string(), '\s+')">
        <xsl:call-template name="makeOrgLink">
	  <xsl:with-param name="pointer" select="."/>
        </xsl:call-template>
        <xsl:if test="not(position() = last())">
	  <xsl:text>, </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:choose>
	<xsl:when test="position() = last()">
	  <xsl:text>)</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:text>, </xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:call-template name="newline"/>
  </xsl:template>
  
  <xsl:template match="tei:note">
    <!-- Putting in a zero width joiner since it won't work at beginning of line. -->
    <xsl:text>&#8205;</xsl:text>
    <xsl:choose>
      <xsl:when test="ancestor::tei:app|tei:note">
        <xsl:apply-templates mode="note"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>[fn:</xsl:text>
        <xsl:number level="any" count="tei:note"/>
        <xsl:text>]</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:note" mode="note">
    <xsl:choose>
      <xsl:when test="ancestor::tei:app|tei:note"/>
      <xsl:otherwise>
        <xsl:call-template name="newline"/>
        <xsl:text>[fn:</xsl:text>
        <xsl:number level="any" count="tei:note"/>
        <xsl:text>] </xsl:text>
        <xsl:apply-templates mode="note"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:item|tei:biblStruct">
    <xsl:call-template name="newline"/>
    <xsl:choose>
      <xsl:when test="tei:isOrderedList(..)">1. </xsl:when>
      <xsl:otherwise>- </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="tei:quote">
    <xsl:call-template name="makeBlock">
      <xsl:with-param name="style">quote</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="tei:lg">
    <xsl:call-template name="makeBlock">
      <xsl:with-param name="style">verse</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="tei:l">
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::tei:l">
      <xsl:call-template name="newline"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="tei:lb"/>
  <xsl:template match="tei:pb"/>

  <xsl:template match="tei:choice">
    <xsl:text>[ </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>] </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:corr">
    <xsl:apply-templates/>
    <xsl:text> (corr.)</xsl:text>
  </xsl:template>

  <xsl:template match="tei:sic">
    <xsl:apply-templates/>
    <xsl:text> (sic)</xsl:text>
  </xsl:template>

  <xsl:template match="tei:q">
    <xsl:text>``</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:anchor[@xml:id]">
    <xsl:call-template name="insertTarget">
      <xsl:with-param name="target" select="@xml:id"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="newline">
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="tei-examples:egXML">
    <xsl:text>~</xsl:text>
    <xsl:for-each select="child::*">
      <xsl:value-of select="saxon:serialize(., 'xmlout')"/>
    </xsl:for-each>
    <xsl:text>~</xsl:text>
  </xsl:template>

  <xsl:template match="*">
    <xsl:if test="@xml:id and
		  not(matches(local-name(), '^div') and count(child::tei:head) > 0)">
      <xsl:call-template name="insertTarget">
	<xsl:with-param name="target" select="@xml:id"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:message>Default processing for <xsl:value-of select="saxon:path()"/></xsl:message> 
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="/tei:TEI">
    <xsl:apply-templates/>
    <xsl:apply-templates select="/tei:TEI" mode="note"/>
  </xsl:template>

  <xsl:template name="insertTarget">
    <xsl:param name="target"/>
    <xsl:text>&lt;&lt;</xsl:text>
    <xsl:value-of select="$target"/>
    <xsl:text>&gt;&gt;</xsl:text>
    <!-- insert reference to possible later app -->
    <xsl:for-each select="//tei:app[@to|@from=concat('#', $target)]">
      <xsl:text>[fn:c-</xsl:text>
      <xsl:number level="any" count="tei:app"/>
      <xsl:text>]</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="insertLink">
    <xsl:param name="target"/>
    <xsl:text>[[</xsl:text>
    <xsl:choose>
      <xsl:when test="matches($target, '^#')">
	<xsl:value-of select="substring-after($target, '#')"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="$target"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>]]</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>
