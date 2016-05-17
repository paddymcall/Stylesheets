<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dbk="http://docbook.org/ns/docbook" xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:exsl="http://exslt.org/common" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="xlink dbk rng tei teix xhtml a html xs xsl" version="2.0">
  <xsl:import href="../../../latex/latex.xsl"/>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
    <desc>
      <p>This software is dual-licensed:

1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
Unported License http://creativecommons.org/licenses/by-sa/3.0/ 

2. http://www.opensource.org/licenses/BSD-2-Clause
		
All rights reserved.

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
      <p>Id: $Id$</p>
      <p>Copyright: 2013, TEI Consortium</p>
    </desc>
  </doc>
  <xsl:param name="publisher">SARIT</xsl:param>
  <xsl:param name="title">SARIT title</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout" type="string">
    <desc>Revision for the current conversion, usually as specified by
    a content versioning system.</desc>
  </doc>
  <xsl:param name="revision">HEAD</xsl:param>
  <xsl:param name="useHeaderFrontMatter">true</xsl:param>
  <xsl:param name="debuglatex">true</xsl:param>
  <xsl:param name="documentclass">memoir</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout" type="string">
    <desc>Optional parameters for documentclass</desc>
  </doc>
  <xsl:param name="classParameters">article,12pt</xsl:param>
  <xsl:param name="homeURL">http://sarit.indology.info</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">What to add to the $homeURL to get the resolution of canonical references (needs an external program, of course).</doc>
  <xsl:param name="cRef-query-string">/?cref=</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="style" type="string">
    <desc>Character to insert at end of quote.</desc>
  </doc>
  <xsl:param name="postQuote"></xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="style" type="string">
    <desc>Character to insert at start of quote</desc>
  </doc>
  <xsl:param name="preQuote"></xsl:param>
  <xsl:param name="ledmac">true</xsl:param>
  <xsl:param name="per-page-footnotes">true</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="style" type="string">
    <desc>Whether to typeset footnotes as text critical notes (only
    works if $ledmac is also enabled).</desc>
  </doc>
  <xsl:param name="footnotes-as-critical-notes">true</xsl:param>
  <xsl:param name="printtoc">true</xsl:param>
  <xsl:param name="skipTocDiv">true</xsl:param>
  <xsl:param name="reencode">false</xsl:param>
  <xsl:param name="defaultfontfeatures">Scale=MatchLowercase,Mapping=tex-text</xsl:param>
  <xsl:param name="romanFont">TeX Gyre Schola</xsl:param>
  <xsl:param name="latinFont">TeX Gyre Pagella</xsl:param>
  <xsl:param name="devanagariFont">Chandas</xsl:param>
  <xsl:param name="devanagariFontScale"></xsl:param>
  <xsl:param name="devanagariNumerals">true</xsl:param>
  <xsl:param name="boFont">Tibetan Machine Uni</xsl:param>
  <xsl:param name="boFontScale">1.2</xsl:param>
  <xsl:param name="sansFont">TeX Gyre Bonum</xsl:param>
  <xsl:param name="lemmaColor">DodgerBlue3</xsl:param>
  <xsl:param name="showteiheader">true</xsl:param>
  <xsl:param name="standalone">false</xsl:param>
  <xsl:param name="userpackage"/>
  <xsl:param name="biblatex">true</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <p>This bibliography value is only used when no other bibliography
    can be found. Currently searches for, and prefers,
    //listBibl[@corresp] values.</p>
  </doc>
  <xsl:param name="bibliography">https://raw.githubusercontent.com/paddymcall/Stylesheets/---revision-spec---/profiles/sarit/latex/bib/sarit.bib</xsl:param>
  <xsl:param name="usetitling">true</xsl:param>
  <xsl:param name="leftside" as="xs:boolean">false</xsl:param>
  <xsl:param name="rightside" as="xs:boolean">false</xsl:param>
  <xsl:param name="showLineBreaks" as="xs:boolean">true</xsl:param>
  <xsl:param name="showPageBreaks" as="xs:boolean">true</xsl:param>
  <xsl:param name="pagebreakStyle"/>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">Whether to handle canonical references strictly (if true, no
  priority for internal links).</doc>
  <xsl:param name="cRef-strict">false</xsl:param>
  <doc>Specify the line spacing. Valid values: 1, 1.5, 2.</doc>
  <xsl:param name="lineSpacing" as="xs:decimal">1</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>At which level to restart the numbering</desc>
  </doc>
  <xsl:param name="ledmacNumberDepth">0</xsl:param>
  <xsl:param  name="ledmac-firstlinenum">5</xsl:param>
  <xsl:param  name="ledmac-linenumincrement">5</xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>An output format for saxon's serialize</desc>
  </doc>
  <xsl:output name="xmlstring" indent="yes" omit-xml-declaration="yes"/>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>
      <p>LaTeX setup</p>
      <p>The basic LaTeX setup which you should not 
really tinker with unless you really understand  why and how. Note
that we need to set up a mapping here for Unicode 8421, 10100 and
10100 to glyphs for backslash and the two curly brackets, to provide literal
characters. The normal characters remain active for LaTeX commands.
Note that if $reencode is set to false, no input or output encoding
packages are loaded, since it is assumed you are using a TeX variant
capable of dealing with UTF-8 directly.
</p>
    </desc>
  </doc>
  <xsl:template name="latexSetup">
    <xsl:call-template name="latexSetupHook"/>
    <xsl:choose>
      <xsl:when test="$reencode='true'">
\IfFileExists{utf8x.def}%
 {\usepackage[utf8x]{inputenc}
    \PrerenderUnicode{–}
  }%
 {\usepackage[utf8]{inputenc}}

<xsl:call-template name="latexBabel"/>
\usepackage[T1]{fontenc}
\usepackage{float}
\usepackage[]{ucs}
\uc@dclc{8421}{default}{\textbackslash }
\uc@dclc{10100}{default}{\{}
\uc@dclc{10101}{default}{\}}
\uc@dclc{8491}{default}{\AA{}}
\uc@dclc{8239}{default}{\,}
\uc@dclc{20154}{default}{ }
\uc@dclc{10148}{default}{&gt;}
\def\textschwa{\rotatebox{-90}{e}}
\def\textJapanese{}
\def\textChinese{}
</xsl:when>
      <xsl:otherwise>
        <xsl:text>
	  \usepackage{euler}
	  \usepackage{xltxtra}
  \usepackage{polyglossia}
  \PolyglossiaSetup{sanskrit}{
  hyphenmins={2,3},% default is {1,3}
  }
  \setdefaultlanguage</xsl:text>
  <xsl:value-of select="$defaultlanguageoptions"/>
  <xsl:text>{</xsl:text>
  <xsl:value-of select="$defaultlanguage"/>
  <xsl:text>}</xsl:text>
  <xsl:text>
  % english should be available, notes and stuff
  \setotherlanguage{english}
  \setotherlanguage[numerals=arabic]{tibetan}
  \usepackage{fontspec}
  %% redefine some chars (either changed by parsing, or not commonly in font)
  \catcode`⃥=\active \def⃥{\textbackslash}
  \catcode`❴=\active \def❴{\{}
  \catcode`❵=\active \def❵{\}}
  \catcode`〔=\active \def〔{{[}}% translate 〔OPENING TORTOISE SHELL BRACKET
  \catcode`〕=\active \def〕{{]}}% translate 〕CLOSING TORTOISE SHELL BRACKET
  \catcode` =\active \def {\,}
  \catcode`·=\active \def·{\textbullet}
  %% BREAK PERMITTED HERE: \discretionary{-}{}{}\nobreak\hspace{0pt}
  \catcode`=\active \def{\-}
  \catcode`ꣵ=\active \defꣵ{%
  </xsl:text>
  <xsl:choose>
    <xsl:when test="$defaultlanguage='sanskrit'">
      <xsl:text>म्</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>m</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>\textsuperscript{cb}%for candrabindu
  }
  %% show a lot of tolerance
  \tolerance=9000
  \def\textJapanese{\fontspec{Kochi Mincho}}
  \def\textChinese{\fontspec{HAN NOM A}}
  \def\textKorean{\fontspec{Baekmuk Gulim} }
  % make sure English font is there
  \newfontfamily\englishfont[Mapping=tex-text]{</xsl:text>
  <xsl:value-of select="$romanFont"/>
  <xsl:text>}</xsl:text>
  <xsl:text>
    % set up a devanagari font
  \newfontfamily\devanagarifont</xsl:text>
  <xsl:choose>
    <xsl:when test="//tei:text[@xml:lang='sa'] or //tei:text[@xml:lang='sa-Deva'] or //tei:body[@xml:lang='sa'] or //tei:body[@xml:lang='sa-Deva']">
      <xsl:text>[Script=Devanagari</xsl:text>
      <xsl:if test="not($devanagariFontScale='')">
	<xsl:text>,Scale=</xsl:text>
	<xsl:value-of select="$devanagariFontScale" />
      </xsl:if>
      <xsl:if test="$devanagariNumerals">
	<xsl:text>,Mapping=devanagarinumerals,</xsl:text>
      </xsl:if>
      <!-- the numbers don't seem to change anything? -->
      <xsl:text>AutoFakeBold=1.5,AutoFakeSlant=0.3]{</xsl:text>
      <xsl:value-of select="$devanagariFont"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="not(latinFont='')">
          <xsl:text>{</xsl:text>
          <xsl:value-of select="$latinFont"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>{%no latinFont set!
	  TeX Gyre Pagella</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
        <xsl:text>}</xsl:text>
        <xsl:text>
	\newfontfamily\rmlatinfont[Mapping=tex-text]{</xsl:text>
        <xsl:choose>
          <xsl:when test="not(latinFont='')">
            <xsl:value-of select="$latinFont"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>%no latinFont set!
    TeX Gyre Pagella</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>}
	\newfontfamily\tibetanfont[Script=Tibetan</xsl:text>
	<xsl:if test="not($boFontScale='')">
	  <xsl:text>,Scale=</xsl:text>
	  <xsl:value-of select="$boFontScale"/>
	</xsl:if>
	<xsl:text>]{</xsl:text>
        <xsl:value-of select="$boFont"/>
        <xsl:text>}
  \newcommand\bo\tibetanfont
  </xsl:text>
        <xsl:if test="not($defaultfontfeatures='')">
    \defaultfontfeatures{<xsl:value-of select="$defaultfontfeatures"/>}
	</xsl:if>
	<xsl:text>\setmainfont{</xsl:text>
	<xsl:choose>
	  <xsl:when test="$defaultlanguage='tibetan'">
	    <xsl:value-of select="$boFont"/>
	  </xsl:when>
	  <xsl:when test="$defaultlanguage='sanskrit' and $defaultEncoding='devanagari'">
	    <xsl:value-of select="$devanagariFont"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:choose>
		<xsl:when test="not(latinFont='')">
		  <xsl:value-of select="$latinFont"/>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:text>Computer Modern</xsl:text>
		</xsl:otherwise>
	    </xsl:choose>
	  </xsl:otherwise>
	</xsl:choose>
	<xsl:text>}</xsl:text>
	<xsl:if test="not($sansFont='')">
    \setsansfont{<xsl:value-of select="$sansFont"/>}
  </xsl:if>
        <xsl:text>
  \setmonofont{</xsl:text>
        <xsl:value-of select="$typewriterFont"/>
        <xsl:text>}</xsl:text>
	<xsl:text>
	  %% page layout start: fit to a4 and US letterpaper (example in memoir.pdf)
	  %% page layout start
	  % stocksize (actual size of paper in the printer) is a4 as per class
	  % options;
	  
	  % trimming, i.e., which part should be cut out of the stock (this also
	  % sets \paperheight and \paperwidth):
	  % \settrimmedsize{0.9\stockheight}{0.9\stockwidth}{*}
	  % \settrimmedsize{225mm}{150mm}{*}
	  % % say where you want to trim
	  \setlength{\trimtop}{\stockheight}    % \trimtop = \stockheight
	  \addtolength{\trimtop}{-\paperheight} %           - \paperheight
	  \setlength{\trimedge}{\stockwidth}    % \trimedge = \stockwidth
	  \addtolength{\trimedge}{-\paperwidth} %           - \paperwidth
	  % % this makes trims equal on top and bottom (which means you must cut
	  % % twice). if in doubt, cut on top, so that dust won't settle when book
	  % % is in shelf
	  \settrims{0.5\trimtop}{0.5\trimedge}

	  % figure out which font you're using
	  \setxlvchars
	  \setlxvchars
	  % \typeout{LENGTH: lxvchars: \the\lxvchars}
	  % \typeout{LENGTH: xlvchars: \the\xlvchars}

	  % set the size of the text block next:
	  % this sets \textheight and \textwidth (not the whole page including
	  % headers and footers)
	  \settypeblocksize{230mm}{130mm}{*}

	  % left and right margins:
	  % this way spine and edge margins are the same
	  % \setlrmargins{*}{*}{*}
	  \setlrmargins{*}{*}{1.5}

	  % upper and lower, same logic as before
	  % \setulmargins{*}{*}{*}% upper = lower margin
	  % \uppermargin = \topmargin + \headheight + \headsep
	  %\setulmargins{*}{*}{1.5}% 1.5*upper = lower margin
	  \setulmargins{*}{*}{1.5}% 

	  % header and footer spacings
	  \setheadfoot{2\baselineskip}{2\baselineskip}

	  % \setheaderspaces{ headdrop }{ headsep }{ ratio }
	  \setheaderspaces{*}{*}{1.5}

	  % see memman p. 51 for this solution to widows/orphans 
	  \setlength{\topskip}{1.6\topskip}
	  % fix up layout
	  \checkandfixthelayout
	  \sloppybottom
	  %% page layout end
	</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$documentclass='memoir'">
	<xsl:message>Line spacing: <xsl:value-of select="$lineSpacing"/></xsl:message>
	<xsl:choose>
	  <xsl:when test="$lineSpacing=1.5">
	    <xsl:text>
	      \OnehalfSpacing
	    </xsl:text>
	  </xsl:when>
	  <xsl:when test="$lineSpacing=2">
	    <xsl:text>
	      \DoubleSpacing
	    </xsl:text>
	  </xsl:when>
	</xsl:choose>
        <xsl:text>
	    % numbering depth
	    \maxtocdepth{section}
	    % set up layout of toc
	    \setpnumwidth{4em}
	    \setrmarg{5em}
	    \setsecnumdepth{all}
	    \newenvironment{docImprint}{\vskip 6pt}{\ifvmode\par\fi }
	    \newenvironment{docDate}{}{\ifvmode\par\fi }
	    \newenvironment{docAuthor}{\ifvmode\vskip4pt\fontsize{16pt}{18pt}\selectfont\fi\itshape}{\ifvmode\par\fi }
	    % \newenvironment{docTitle}{\vskip6pt\bfseries\fontsize{18pt}{22pt}\selectfont}{\par }
	    \newcommand{\docTitle}[1]{#1}
	    \newenvironment{titlePart}{ }{ }
	    \newenvironment{byline}{\vskip6pt\itshape\fontsize{16pt}{18pt}\selectfont}{\par }
	    % setup title page; see CTAN /info/latex-samples/TitlePages/, and memoir
	  \newcommand*{\plogo}{\fbox{$\mathcal{SARIT}$}}
	  \newcommand*{\makeCustomTitle}{\begin{english}\begingroup% from example titleTH, T&amp;H Typography
	  \thispagestyle{empty}
	  \raggedleft
	  \vspace*{\baselineskip}
	  </xsl:text>
        <xsl:variable name="titleauthor">
          <xsl:sequence select="tei:generateAuthor(/*)"/>
        </xsl:variable>
        <xsl:if test="$titleauthor != ''">
          <xsl:text>
	      % author(s)
	    {\Large </xsl:text>
          <xsl:value-of select="$titleauthor"/>
          <xsl:text>}\\[0.167\textheight]</xsl:text>
        </xsl:if>
        <xsl:variable name="titlepretitle">
          <xsl:sequence select="tei:generatePreTitleHeader(/*)"/>
          <!-- <xsl:text>No pretitle</xsl:text> -->
        </xsl:variable>
        <xsl:if test="$titlepretitle != ''">
          <xsl:text>
	      % pretitle
	    {\bfseries </xsl:text>
          <xsl:value-of select="$titlepretitle"/>
          <xsl:text>}\\[\baselineskip]</xsl:text>
        </xsl:if>
        <xsl:variable name="maintitle">
          <xsl:sequence select="tei:generateMetadataTitle(/*)"/>
        </xsl:variable>
        <xsl:variable name="title">
          <xsl:sequence select="tei:generateMetadataTitle(/*)"/>
        </xsl:variable>
        <xsl:if test="$maintitle != ''">
          <xsl:text>
	    % maintitle
	    {\Huge </xsl:text>
          <xsl:value-of select="$maintitle"/>
          <!-- title 2 -->
          <xsl:text>}\\[\baselineskip]</xsl:text>
        </xsl:if>
        <xsl:variable name="titlesubtitle">
          <xsl:sequence select="tei:generateSubTitleHeader(/*)"/>
        </xsl:variable>
        <xsl:if test="$titlesubtitle !=''">
          <xsl:text>
	    % titlesubtitle
	    {\small </xsl:text>
          <!-- subtitle -->
          <xsl:value-of select="$titlesubtitle"/>
          <xsl:text>}\\[\baselineskip]</xsl:text>
        </xsl:if>
        <xsl:variable name="titleeditor">
          <!-- the editor -->
          <xsl:sequence select="string-join(tei:generateEditor(/*), ',')"/>
        </xsl:variable>
        <xsl:if test="$titleeditor != ''">
          <xsl:text>
	    {\Large Edited by </xsl:text>
          <xsl:value-of select="$titleeditor"/>
          <xsl:text> }\\
	    \vfill</xsl:text>
        </xsl:if>
        <xsl:variable name="titlepublisher">
          <xsl:sequence select="tei:generatePublisher(/*,$publisher)"/>
        </xsl:variable>
        <xsl:if test="$titlepublisher != ''">
          <xsl:text>
	    {\Large </xsl:text>
          <xsl:value-of select="$titlepublisher"/>
          <xsl:text>}\\</xsl:text>
        </xsl:if>
        <xsl:text>\vspace*{\baselineskip}\plogo</xsl:text>
        <xsl:text>\par
	  \vspace*{3\baselineskip}
	  \endgroup
	  \end{english}}
	  \newcommand{\gap}[1]{}
	  \newcommand{\corr}[1]{($^{x}$#1)}
	  \newcommand{\sic}[1]{($^{!}$#1)}
	  \newcommand{\reg}[1]{#1}
	  \newcommand{\orig}[1]{#1}
	  \newcommand{\abbr}[1]{#1}
	  \newcommand{\expan}[1]{#1}
	  \newcommand{\unclear}[1]{($^{?}$#1)}
	  \newcommand{\add}[1]{($^{+}$#1)}
	  \newcommand{\deletion}[1]{($^{-}$#1)}
	  \newcommand{\pratIka}[1]{\textcolor{cyan}{#1}}
	  \newcommand{\name}[1]{#1}
	  \newcommand{\persName}[1]{#1}
	  \newcommand{\placeName}[1]{#1}
	  </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <!-- \DeclareTextSymbol{\textpi}{OML}{25} -->
        <!-- \usepackage{relsize} -->
        <!-- \def\textsubscript#1{% -->
        <!--   \@textsubscript{\selectfont#1}} -->
        <!-- \def\@textsubscript#1{% -->
        <!--   {\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@#1}}}}} -->
        <!-- \def\textquoted#1{‘#1’} -->
        <!-- \def\textsmall#1{{\small #1}} -->
        <!-- \def\textlarge#1{{\large #1}} -->
        <!-- \def\textoverbar#1{\ensuremath{\overline{#1}}} -->
        <!-- \def\textgothic#1{{\fontspec{<xsl:value-of select="$gothicFont"/>}#1}} -->
        <!-- \def\textcal#1{{\fontspec{<xsl:value-of select="$calligraphicFont"/>}#1}} -->
        <!-- \newenvironment{biblfree}{}{\ifvmode\par\fi } -->
        <!-- \newenvironment{docImprint}{\vskip 6pt}{\ifvmode\par\fi } -->
        <!-- \newenvironment{docDate}{}{\ifvmode\par\fi } -->
        <!-- \newenvironment{docAuthor}{\ifvmode\vskip4pt\fontsize{16pt}{18pt}\selectfont\fi\itshape}{\ifvmode\par\fi } -->
        <!-- \newenvironment{docTitle}{\vskip6pt\bfseries\fontsize{18pt}{22pt}\selectfont}{\par } -->
        <!-- \newenvironment{titlePart}{}{\par } -->
        <!-- \newenvironment{byline}{\vskip6pt\itshape\fontsize{16pt}{18pt}\selectfont}{\par } -->
        <!-- \newenvironment{citbibl}{}{\ifvmode\par\fi } -->
        <!-- \newenvironment{bibl}{}{} -->
        <!-- \newenvironment{rubric}{}{} -->
        <!-- \newenvironment{msItem}{\vskip 6pt}{\par} -->
        <!-- \newenvironment{msHead}{\vskip 6pt}{\par} -->
        <!-- \def\titlem#1{\emph{#1}} -->
        <!-- \def\corr#1{#1} -->
        <!-- \def\sic#1{#1} -->
        <!-- \def\reg#1{#1} -->
        <!-- \def\orig#1{#1} -->
        <!-- \def\gap{} -->
        <!-- \def\abbr#1{#1} -->
        <!-- \def\expan#1{#1} -->
        <!-- \RequirePackage{array} -->
        <!-- \def\@testpach{\@chclass -->
        <!--  \ifnum \@lastchclass=6 \@ne \@chnum \@ne \else -->
        <!--   \ifnum \@lastchclass=7 5 \else -->
        <!--    \ifnum \@lastchclass=8 \tw@ \else -->
        <!--     \ifnum \@lastchclass=9 \thr@@ -->
        <!--    \else \z@ -->
        <!--    \ifnum \@lastchclass = 10 \else -->
        <!--    \edef\@nextchar{\expandafter\string\@nextchar}% -->
        <!--    \@chnum -->
        <!--    \if \@nextchar c\z@ \else -->
        <!--     \if \@nextchar l\@ne \else -->
        <!--      \if \@nextchar r\tw@ \else -->
        <!--    \z@ \@chclass -->
        <!--    \if\@nextchar |\@ne \else -->
        <!--     \if \@nextchar !6 \else -->
        <!--      \if \@nextchar @7 \else -->
        <!--       \if \@nextchar (8 \else -->
        <!--        \if \@nextchar )9 \else -->
        <!--   10 -->
        <!--   \@chnum -->
        <!--   \if \@nextchar m\thr@@\else -->
        <!--    \if \@nextchar p4 \else -->
        <!--     \if \@nextchar b5 \else -->
        <!--    \z@ \@chclass \z@ \@preamerr \z@ \fi \fi \fi \fi -->
        <!--    \fi \fi  \fi  \fi  \fi  \fi  \fi \fi \fi \fi \fi \fi} -->
        <!-- \gdef\arraybackslash{\let\\=\@arraycr} -->
        <!-- \def\textxi{\ensuremath{\xi}} -->
        <!-- \def\Panel#1#2#3#4{\multicolumn{#3}{){\columncolor{#2}}#4}{#1}} -->
        <xsl:text disable-output-escaping="yes">
          <!-- \newcolumntype{L}[1]{){\raggedright\arraybackslash}p{#1}} -->
          <!-- \newcolumntype{C}[1]{){\centering\arraybackslash}p{#1}} -->
          <!-- \newcolumntype{R}[1]{){\raggedleft\arraybackslash}p{#1}} -->
          <!-- \newcolumntype{P}[1]{){\arraybackslash}p{#1}} -->
          <!-- \newcolumntype{B}[1]{){\arraybackslash}b{#1}} -->
          <!-- \newcolumntype{M}[1]{){\arraybackslash}m{#1}} -->
          <!-- \definecolor{label}{gray}{0.75} -->
          <!-- \def\unusedattribute#1{\sout{\textcolor{label}{#1}}} -->
          <!-- \DeclareRobustCommand*{\xref}{\hyper@normalise\xref@} -->
          <!-- \def\xref@#1#2{\hyper@linkurl{#2}{#1}} -->
          <!-- \begingroup -->
          <!-- \catcode`\_=\active -->
          <!-- \gdef_#1{\ensuremath{\sb{\mathrm{#1}}}} -->
          <!-- \endgroup -->
          <!-- \mathcode`\_=\string"8000 -->
          <!-- \catcode`\_=12\relax -->
        </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex] <param name="ptr">ptr</param>
         <param name="dest">dest</param>
      </desc>
  </doc>
  <xsl:template name="makeExternalLink">
    <xsl:param name="ptr" as="xs:boolean" select="false()"/>
    <xsl:param name="dest"/>
    <xsl:param name="title" select="''"/>
    <xsl:choose>
      <xsl:when test="$ptr or $title=''">
        <xsl:text>\url{</xsl:text>
        <xsl:sequence select="$dest"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\href{</xsl:text>
        <xsl:value-of select="$dest"/>
        <xsl:text>}{</xsl:text>
	<xsl:value-of select="tei:escapeChars($title,.)"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>
      <p>LaTeX package setup</p>
      <p>Declaration of the LaTeX packages needed to implement
    this markup</p>
    </desc>
  </doc>
  <xsl:template name="latexPackages">
    <xsl:text>% running latexPackages template
     \usepackage[x11names]{xcolor}
     \definecolor{shadecolor}{gray}{0.95}
     \usepackage{longtable}
     \usepackage{ctable}
     \usepackage{rotating}
     \usepackage{lscape}
     \usepackage{ragged2e}
     </xsl:text>
    <xsl:choose>
      <xsl:when test="not($documentclass='memoir')"><xsl:text>
       \usepackage[</xsl:text><xsl:value-of select="$latexPaperSize"/><xsl:text>,</xsl:text><xsl:value-of select="$latexGeometryOptions"/><xsl:text>]{geometry}
       \usepackage{framed}
       </xsl:text><xsl:text>
	 \usepackage{xcolor}
	 \definecolor{shadecolor}{gray}{0.95}
	 \usepackage{longtable}
	 \usepackage[normalem]{ulem}
	 \usepackage{fancyvrb}
       </xsl:text>
       \usepackage{fancyhdr}
     </xsl:when>
      <xsl:otherwise><xsl:text>
	 \usepackage{titling}
	 \usepackage{marginnote}
	 \renewcommand*{\marginfont}{\color{black}\rmlatinfont\scriptsize}
	 \setlength\marginparwidth{.75in}
	 \usepackage{graphicx}
	 \usepackage{csquotes}
       </xsl:text><xsl:if test="key('ENDNOTES',1)">
	 \usepackage{endnotes}
	 <xsl:choose><xsl:when test="key('FOOTNOTES',1)">
	     \def\theendnote{\@alph\c@endnote}
	   </xsl:when><xsl:otherwise>
	     \def\theendnote{\@arabic\c@endnote}
	   </xsl:otherwise></xsl:choose>
       </xsl:if><xsl:text>
	 \def\Gin@extensions{.pdf,.png,.jpg,.mps,.tif}
       </xsl:text>
       <xsl:if test="$ledmac='true'">
	 <xsl:call-template name="ledmacOptions"/>
       </xsl:if>
       <xsl:if test="$biblatex='true'">
	 <xsl:text>%% biblatex stuff start
	 \usepackage[backend=biber,%
	 citestyle=authoryear,%
	 bibstyle=authoryear,%
	 language=english,%
	 sortlocale=en_US,%
	 ]{biblatex}
	 </xsl:text>
	 <xsl:choose>
	   <xsl:when test="//tei:listBibl[@corresp]">
	     <xsl:for-each select="//tei:listBibl[@corresp]">
	       <xsl:text>
		 \addbibresource{</xsl:text>
		 <xsl:value-of select="substring-after(resolve-uri(@corresp, base-uri()), 'file:')"/>
	       <xsl:text>}</xsl:text>
	     </xsl:for-each>
	   </xsl:when>
	   <xsl:otherwise>
	     <xsl:choose>
	       <xsl:when test="$bibliography != ''">
		 <xsl:text>
		 \addbibresource</xsl:text>
		 <xsl:if test="not(substring-before($bibliography, '://') = '') or not(substring-before($bibliography, '://') = 'file')">
		   <xsl:text>[location=remote]</xsl:text>
		 </xsl:if>
		 <xsl:text>{</xsl:text>
		 <xsl:value-of select="replace($bibliography, '---revision-spec---', $revision)"/>
		 <xsl:text>}</xsl:text>
	       </xsl:when>
	     <xsl:otherwise>
	       <xsl:message>No bibliographies found!</xsl:message>
	     </xsl:otherwise>
	     </xsl:choose>
	   </xsl:otherwise>
	 </xsl:choose>
	 <xsl:text>
	 \renewcommand*{\citesetup}{%
	 \rmlatinfont
	 \biburlsetup
	 \frenchspacing}
	 \renewcommand{\bibfont}{\rmlatinfont}
	 \DeclareFieldFormat{postnote}{:#1}
	 \renewcommand{\postnotedelim}{}
	 %% biblatex stuff end
	 </xsl:text>
       </xsl:if>
       <xsl:if test="$debuglatex='true'">
	 \setcounter{errorcontextlines}{400}
       </xsl:if><xsl:if test="$showteiheader='true'">
	 \usepackage{lscape}
	 \usepackage{minted}
       </xsl:if><xsl:choose><xsl:when test="$reencode='true'"><xsl:text>
	     \IfFileExists{tipa.sty}{\usepackage{tipa}}{}
	     \usepackage{times}
	   </xsl:text></xsl:when></xsl:choose><xsl:if test="$userpackage != 'false' and not($userpackage='')">
	 \usepackage{<xsl:value-of select="$userpackage"/>}
       </xsl:if>
       <xsl:choose>
	 <xsl:when test="$documentclass='memoir'">
	   % pagestyles
	   \pagestyle{ruled}
	   <!-- \makeoddhead{ruled}{{\small\rmlatinfont <xsl:value-of select="tei:generateSimpleTitle(.)"/>}}{}{} -->
	   \makeoddfoot{ruled}{{\tiny\rmlatinfont \textit{Compiled: \today}}}{}{\rmlatinfont\thepage}
	   \makeevenfoot{ruled}{\rmlatinfont\thepage}{}{{\tiny\rmlatinfont \textit{Compiled: \today}}}
	   
	 </xsl:when>
	 <xsl:otherwise>
	   \pagestyle{fancy} 
	 </xsl:otherwise>
       </xsl:choose>
       <xsl:if test="$per-page-footnotes='true'">
	 <xsl:text>
	   \usepackage{perpage}
           \MakePerPage{footnote}
	 </xsl:text>
       </xsl:if>
       \usepackage[destlabel=true,% use labels as destination names; ; see dvipdfmx.cfg, option 0x0010, if using xelatex
       pdftitle={<xsl:sequence select="tei:generateSimpleTitle(.)"/>},
       pdfauthor={<xsl:sequence select="replace(string-join(/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher,''),';','')"/>}]{hyperref}
       \hyperbaseurl{<xsl:value-of select="$baseURL"/>}
       \renewcommand\UrlFont{\rmlatinfont}
       \usepackage[english]{cleveref}% clashes with eledmac &lt; 1.10.1!
       % \newcommand{\cref}{\href}
     </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="mainDocument">
    <xsl:if test="not($realFigures='true')">
      <xsl:text>%BEGINFIGMAP</xsl:text>
      <xsl:if test="not($latexLogo='')">
        <xsl:text>
%FIGMAP </xsl:text>
        <xsl:value-of select="$latexLogo"/>
        <xsl:text> FIG0 </xsl:text>
      </xsl:if>
      <xsl:for-each select="//tei:figure">
        <xsl:variable name="c">
          <xsl:number level="any"/>
        </xsl:variable>
        <xsl:text>
%FIGMAP </xsl:text>
        <xsl:variable name="f">
          <xsl:choose>
            <xsl:when test="@url">
              <xsl:sequence select="tei:resolveURI(.,@url)"/>
            </xsl:when>
            <xsl:when test="@entity">
              <xsl:value-of select="unparsed-entity-uri(@entity)"/>
            </xsl:when>
            <xsl:when test="tei:graphic">
              <xsl:sequence select="tei:resolveURI(tei:graphic,tei:graphic/@url)"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="contains($f,'.')">
            <xsl:value-of select="$f"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($f,'.png')"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text> FIG</xsl:text>
        <xsl:value-of select="$c + 1000"/>
        <xsl:text>
</xsl:text>
      </xsl:for-each>
      <xsl:text>
%ENDFIGMAP
</xsl:text>
    </xsl:if>
    <xsl:text>\documentclass[</xsl:text>
    <xsl:value-of select="$classParameters"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="$latexPaperSize"/>
    <xsl:text>]{</xsl:text>
    <xsl:value-of select="$documentclass"/>
    <xsl:text>}</xsl:text>
    <xsl:call-template name="latexSetup"/>
    <xsl:call-template name="latexPackages"/>
    <!-- <xsl:call-template name="latexLayout"/> -->
    <!-- <xsl:call-template name="latexOther"/> -->
    <xsl:text>
\begin{document}
    </xsl:text>
    <xsl:if test="$usetitling='true'">
        <xsl:call-template name="printTitleAndLogo"/>
      </xsl:if>
    <!-- certainly don't touch this line -->
    <xsl:text disable-output-escaping="yes">\let\tabcellsep&amp;</xsl:text>
    <xsl:call-template name="beginDocumentHook"/>
    <xsl:apply-templates/>
    <xsl:if test="key('ENDNOTES',1)">
      <xsl:text>
\theendnotes</xsl:text>
    </xsl:if>
    <xsl:call-template name="endDocumentHook"/>
    <xsl:text>
\end{document}
</xsl:text>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>
      <p>LaTeX setup commands for ledmac package</p>
    </desc>
  </doc>
  <xsl:template name="ledmacOptions">
    <xsl:text>
      \usepackage[noend,series={A,B}]{reledmac}
       % simplify what ledmac does with fonts, because it breaks. From the documentation of ledmac:
       % The notes are actually given seven parameters: the page, line, and sub-line num-
       % ber for the start of the lemma; the same three numbers for the end of the lemma;
       % and the font specifier for the lemma. 
       \makeatletter
       \def\select@lemmafont#1|#2|#3|#4|#5|#6|#7|%
       {}
       \makeatother
       \setlength{\stanzaindentbase}{20pt}
     \setstanzaindents{3,</xsl:text>
    <xsl:for-each select="1 to tei:maxstanzalines(.)">
      <xsl:text>2,2,</xsl:text>
    </xsl:for-each>
    <xsl:text>}
     % \setstanzapenalties{1,5000,10500}
     \lineation{page}
     % \linenummargin{inner}
     \linenumberstyle{arabic}
     \firstlinenum{</xsl:text>
     <xsl:value-of select="$ledmac-firstlinenum"/>
     <xsl:text>}
    \linenumincrement{</xsl:text>
    <xsl:value-of select="$ledmac-linenumincrement"/>
    <xsl:text>}
    \renewcommand*{\numlabfont}{\normalfont\scriptsize\color{black}}
    \addtolength{\skip\Afootins}{1.5mm}
    \Xnotenumfont{\bfseries\footnotesize}
    \sidenotemargin{outer}
    \linenummargin{inner}
    \Xarrangement{twocol}
    \arrangementX{twocol}
    </xsl:text>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[common] Count the maximum number of lines in a linegroup, documentwide.</desc>
  </doc>
  <xsl:function name="tei:maxstanzalines">
    <xsl:param name="context"/>
    <xsl:variable name="lines" as="item()*">
      <xsl:for-each select="$context//tei:lg">
        <xsl:sequence select="count(./tei:l)"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="max($lines)"/>
  </xsl:function>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>
      <p>Process element app</p>
      <p>Process lem and rdg within app. Sends lots of information
	 to a footnote. If a lem is not found, the first rdg is
	 used as the base text. 
	 </p>
    </desc>
  </doc>
  <xsl:template match="tei:app">
    <xsl:choose>
      <xsl:when test="ancestor::tei:listApp">
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="makeApp"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>
      <p>Creating an apparatus criticus reading.</p>
    </desc>
  </doc>
  <xsl:template name="appReading">
    <xsl:param name="endpoint" as="xs:boolean" select="false()"/>
    <xsl:param name="lemma"/>
    <xsl:param name="lemmawitness"/>
    <xsl:param name="readings"/>
    <xsl:param name="from"/>
    <xsl:param name="to"/>
    <xsl:text>\edtext{</xsl:text>
    <xsl:choose>
      <xsl:when test="$endpoint"/>
      <xsl:otherwise>
        <xsl:value-of select="$lemma"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>}{</xsl:text>
    <xsl:choose>
      <xsl:when test="$endpoint">
      <xsl:text>\lemma{</xsl:text>
      <xsl:value-of select="$lemma"/>
      <xsl:text>}</xsl:text>
      <xsl:text>\xxref{</xsl:text>
      <xsl:value-of select="$from"/>
      <xsl:text>}{</xsl:text>
      <xsl:value-of select="$to"/>
      <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$lemma=''">
	<xsl:text>\lemma{---}</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:text>\Afootnote{</xsl:text>
    <xsl:if test="@xml:id">
      <xsl:text>\label{</xsl:text>
      <xsl:value-of select="@xml:id"/>
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:message>Lemma has witnesses: <xsl:value-of select="$lemmawitness"/></xsl:message>
    <xsl:if test="string-length($lemmawitness) > 0">
      <xsl:text> \cite{</xsl:text>
      <xsl:call-template  name="URIsToBibRefs">
	<xsl:with-param name="targets" select="$lemmawitness" />
      </xsl:call-template>
      <xsl:text>} </xsl:text>
    </xsl:if>
    <xsl:copy-of select="$readings"/>
    <xsl:if test="@type">
      <xsl:text>  {\rmlatinfont [App type: </xsl:text>
      <xsl:value-of select="@type"/>
      <xsl:text>]}</xsl:text>
    </xsl:if>
    <xsl:text>}}</xsl:text>
  </xsl:template>
  <xsl:template name="makeApp">
    <xsl:param name="endpoint" as="xs:boolean" select="false()"/>
    <xsl:param name="lem"/>
    <xsl:call-template name="appReading">
      <xsl:with-param name="endpoint" as="xs:boolean" select="$endpoint"/>
      <xsl:with-param name="lemma">
        <xsl:choose>
          <xsl:when test="tei:lem">
            <xsl:value-of select="tei:lem"/>
          </xsl:when>
          <xsl:when test="not($lem='')">
            <xsl:value-of select="$lem"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text></xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="lemmawitness">
        <xsl:value-of select="tei:lem/@wit"/>
      </xsl:with-param>
      <xsl:with-param name="readings">
        <xsl:for-each select="tei:rdg">
          <!--	    <xsl:when test="$lem='' or (not(../tei:lem) and position()=1)"/>-->
          <xsl:call-template name="startLanguage"/>
          <xsl:apply-templates/>
          <xsl:if test="@cause='omission'">[]</xsl:if>
	  <xsl:call-template name="endLanguage"/>
	  <xsl:if test="string-length(@wit) > 0">
	    <xsl:text> \cite{</xsl:text>
	    <xsl:call-template name="URIsToBibRefs">
	      <xsl:with-param name="targets" select="@wit"/>
	    </xsl:call-template>
	    <xsl:text>} </xsl:text>
	  </xsl:if>
          <xsl:if test="following-sibling::tei:rdg">; </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="tei:note">
          <xsl:call-template name="startLanguage"/>
          <xsl:text>---\textsc{Note} </xsl:text>
          <xsl:apply-templates/>
	  <xsl:call-template name="endLanguage"/>
        </xsl:for-each>
      </xsl:with-param>
      <xsl:with-param name="from">
        <xsl:value-of select="substring(@from, 2)"/>
      </xsl:with-param>
      <xsl:with-param name="to">
        <xsl:value-of select="substring(@to, 2)"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates select="tei:note"/>
  </xsl:template>
  <xsl:template match="tei:lg">
    <xsl:choose>
      <xsl:when test="$ledmac='true' and not(ancestor::tei:note)">
	<xsl:if test="ancestor::tei:p">
	  <xsl:text>
	    \pend
	  </xsl:text>
	</xsl:if>
        <xsl:text>
	    
	    \stanza[\smallbreak]
	</xsl:text>
	<xsl:if test="@xml:id">
	  <xsl:text>\label{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
	  <xsl:if test="$ledmac='true' and (ancestor::tei:p or ancestor::tei:lg)">
            <xsl:text>\edlabel{</xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>}</xsl:text>
	  </xsl:if>
	  <xsl:if test="following::node()[1][
			self::text() and
			matches(self::text(), '^[^\s ]')]">
	    <xsl:text></xsl:text>
	  </xsl:if>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="@n">
            <xsl:text>\flagstanza{\tiny\textenglish{</xsl:text>
            <xsl:value-of select="tei:escapeChars(concat('...', substring(@n, (string-length(@n) - 6))),.)"/>
            <xsl:text>}}</xsl:text>
          </xsl:when>
          <xsl:when test="@xml:id">
            <xsl:text>\flagstanza{\tiny\textenglish{</xsl:text>
            <xsl:value-of select="tei:escapeChars(concat('...', substring(@xml:id, (string-length(@xml:id) - 5))),.)"/>
            <xsl:text>}}</xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:for-each select="tei:l">
          <xsl:if test="parent::tei:lg/@xml:lang='Av'">{\itshape </xsl:if>
          <xsl:apply-templates/>
          <xsl:if test="parent::tei:lg/@xml:lang='Av'">}</xsl:if>
          <xsl:if test="following-sibling::tei:l">
            <xsl:text>&amp;</xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:apply-templates select="tei:note"/>
        <xsl:text>\&amp;[\smallbreak]


	</xsl:text>
	<xsl:if test="ancestor::tei:p">
	  <xsl:text>
	    \pstart
	  </xsl:text>
	</xsl:if>
      </xsl:when>
      <xsl:when test="$ledmac='true' and
		      $footnotes-as-critical-notes='true' and
		      ancestor::tei:note">
	<xsl:if test="@xml:id">
	  <xsl:text>\edlabel{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
        </xsl:if>
	<xsl:for-each select="tei:l">
          <xsl:apply-templates/>
          <xsl:text> </xsl:text>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="ancestor::tei:note">
        <xsl:text>
	    \begin{verse}
	</xsl:text>
	<xsl:if test="@xml:id">
	  <xsl:text>\label{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
        </xsl:if>
        <xsl:for-each select="tei:l">
          <xsl:apply-templates/>
          <xsl:text>\\
	    </xsl:text>
        </xsl:for-each>
        <xsl:text>
	    \end{verse}
	  </xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>
	  \begin{verse}
	</xsl:text>
	<xsl:if test="@xml:id">
	  <xsl:text>\label{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
	<xsl:text>
	  \end{verse}
	</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="hook">
    <desc>[latex] Hook where LaTeX commands can be inserted after 
the beginning of the document</desc>
  </doc>
  <xsl:template name="beginDocumentHook">
    <xsl:if test="$printtoc='true'">
      <xsl:text>
	\frontmatter
	\tableofcontents
	% \listoffigures
	% \listoftables
	\cleardoublepage
       </xsl:text>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="hook">
    <desc>[latex] Hook where LaTeX commands can be inserted just before the end of the document</desc>
  </doc>
  <xsl:template name="endDocumentHook">
    <xsl:text>% running endDocumentHook
     </xsl:text>
    <xsl:if test="$showteiheader='true'">
      <!-- if there's a tei:back element, the backmatter command should already be there -->
      <xsl:if test="not(.//tei:back)">
        <xsl:text>\backmatter </xsl:text>
      </xsl:if>
      <xsl:text>
	 \chapter{The TEI Header}
	 \begin{minted}[fontfamily=rmfamily,fontsize=\footnotesize,breaklines=true]{xml}
       </xsl:text>
      <xsl:copy-of select="saxon:serialize(tei:teiHeader, 'xmlstring')"/>
      <xsl:text>
	 \end{minted}
       </xsl:text>
    </xsl:if>
    <xsl:text>
      \clearpage
      \begin{english}
      \printshorthands
      \printbibliography
      \end{english}
    </xsl:text>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>If verseNumbering is requested,
 counts all the verse lines since the last container (<gi xmlns="">div1</gi> by
 default) and labels every fifth verse using a LaTeX box 3 ems wide.

  </desc>
  </doc>
  <xsl:template match="tei:l">
    <xsl:choose>
      <xsl:when test="$verseNumbering='true'">
        <xsl:variable name="id" select="generate-id()"/>
        <xsl:variable name="pos">
          <xsl:for-each select="ancestor::*[name()=$resetVerseLineNumbering]//l">
            <xsl:if test="generate-id()=$id">
              <xsl:value-of select="position()"/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$pos mod $everyHowManyLines = 0">
            <xsl:text>\leftline{\makebox[3em][r]{</xsl:text>
            <xsl:value-of select="$pos"/>
            <xsl:text>}\quad{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>
\leftline{\makebox[3em][r]{}\quad{}</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="ancestor::tei:quote and following-sibling::tei:l"><xsl:apply-templates/>\\
	 </xsl:when>
      <xsl:when test="parent::tei:sp">
        <xsl:apply-templates/>
        <xsl:text>\hfill\\</xsl:text>
      </xsl:when>
      <xsl:when test="parent::tei:div">
        <xsl:text>
\paragraph*</xsl:text>
        <xsl:choose>
          <xsl:when test="@n">
            <xsl:text>{</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:when test="@xml:id">
            <xsl:text>{</xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>{}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates/>
        <xsl:if test="not(node()[not(self::text()[not(normalize-space())])])">
          <xsl:text>—</xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
	<xsl:if test="boolean($showLineBreaks)">
	  <xsl:text>\textsuperscript{\normalfontlatin </xsl:text>
	  <xsl:choose>
          <xsl:when test="@n">
            <xsl:value-of select="@n"/>
          </xsl:when>
          <xsl:when test="@xml:id">
            <xsl:value-of select="@xml:id"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>lb </xsl:text>
          </xsl:otherwise>
          </xsl:choose>
	  <xsl:if test="@ed">
	    <xsl:value-of select="@ed"/>
	  </xsl:if>
	  <xsl:text>}</xsl:text>
	</xsl:if>
        <xsl:apply-templates/>
	<xsl:if test="following-sibling::tei:l">
	  <xsl:message>Breaking verse</xsl:message>
	  <xsl:text> \\
	  </xsl:text>
	</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element &lt;p&gt;. Try to avoid \par constructs.</desc>
  </doc>
  <xsl:template match="tei:p">
    <xsl:message>Processing a par</xsl:message>
    <xsl:call-template name="startLanguage"/>
    <xsl:choose>
      <xsl:when test="parent::tei:note and not(preceding-sibling::tei:p)">
        <xsl:message>Processing a par: do nothing</xsl:message>
      </xsl:when>
      <xsl:when test="$ledmac='true' and
		      not(
		      ancestor::tei:note or
		      ancestor::tei:front or
		      ancestor::tei:back or
		      ancestor::tei:p
		      )">
        <xsl:message>Processing a main text par in ledmac mode</xsl:message>
        <xsl:choose>
          <xsl:when test="$leftside">
            <xsl:text>\begin{Leftside}</xsl:text>
          </xsl:when>
          <xsl:when test="$rightside">
            <xsl:text>\begin{Rightside}</xsl:text>
          </xsl:when>
        </xsl:choose>
	<xsl:text>

	  \pstart </xsl:text>
      </xsl:when>
      <xsl:when test="$ledmac='true' and
		      $footnotes-as-critical-notes='true' and
		      ancestor::tei:note">
	<xsl:text> --- </xsl:text>	
      </xsl:when>
      <xsl:when test="parent::tei:div or parent::tei:quote">
        <xsl:message>Par in simple mode</xsl:message>
        <xsl:text>
	  
	</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\par
</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="$numberParagraphs='true'">
      <xsl:call-template name="numberParagraph"/>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:call-template name="endLanguage"/>
    <xsl:if test="$ledmac='true' and not(ancestor::tei:note or ancestor::tei:front or ancestor::tei:back or ancestor::tei:p)">
      <xsl:text>
	\pend
      </xsl:text>
      <xsl:if test="$leftside">
        <xsl:text>\end{Leftside}
	  \Pages
	  </xsl:text>
      </xsl:if>
      <xsl:if test="$rightside">
        <xsl:text>\end{Rightside}</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <xsl:template name="insertApp">
    <xsl:param name="elementID"/>
    <xsl:message>
      <xsl:text>Calling insertApp with </xsl:text>
      <xsl:value-of select="$elementID"/>
    </xsl:message>
    <xsl:for-each select="//tei:TEI/tei:text/tei:back//tei:listApp/tei:app[@from=concat('#', $elementID)]">
      <!-- <xsl:message>Found a match.</xsl:message> -->
      <xsl:call-template name="makeApp">
        <xsl:with-param name="endpoint" select="true()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element anchor</desc>
  </doc>
  <xsl:template match="tei:anchor">
    <xsl:choose>
      <xsl:when test="$ledmac='true'">
	<xsl:if test="(parent::tei:p or parent::tei:lg) and not(parent::tei:note)">
          <xsl:text>\edlabel{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
	</xsl:if>
        <xsl:text>\label{</xsl:text>
        <xsl:value-of select="@xml:id"/>
        <xsl:text>}</xsl:text>
        <xsl:call-template name="insertApp">
          <xsl:with-param name="elementID">
            <xsl:value-of select="@xml:id"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\hypertarget{</xsl:text>
        <xsl:value-of select="@xml:id"/>
        <xsl:text>}{}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:gap" priority="10">
    <xsl:text>\gap{}</xsl:text>
  </xsl:template>
  <xsl:template match="tei:unclear" priority="10">
    <xsl:text>\unclear{</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="tei:pb">
    <!-- string " Page " is now managed through the i18n file -->
    <xsl:if test="$showPageBreaks">
      <xsl:choose>
        <xsl:when test="$pagebreakStyle='active'">
          <xsl:text>\clearpage </xsl:text>
        </xsl:when>
        <xsl:when test="$pagebreakStyle='visible'">
          <xsl:text>✁[</xsl:text>
          <xsl:value-of select="@unit"/>
          <xsl:text> </xsl:text>
          <xsl:sequence select="tei:i18n('page')"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="@n"/>
          <xsl:text>]✁</xsl:text>
        </xsl:when>
        <xsl:when test="$pagebreakStyle='bracketsonly'">
          <!-- To avoid trouble with the scisssors character "✁" -->
          <xsl:text>[</xsl:text>
	  <xsl:if test="@ed">
	    <xsl:text>ed: </xsl:text>
	    <xsl:value-of select="@ed"/>
	  </xsl:if>
          <xsl:value-of select="@unit"/>
          <xsl:text> </xsl:text>
          <xsl:sequence select="tei:i18n('page')"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="@n"/>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
	  <xsl:choose>
	    <xsl:when test="$ledmac='true' and
			    (ancestor::tei:p or ancestor::tei:lg) and
			    not(ancestor::tei:note)">
              <xsl:text>\leavevmode\ledsidenote{</xsl:text>
	    </xsl:when>
	    <xsl:when test="ancestor::tei:note">
              <xsl:text>\marginnote{</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>\marginpar{\footnotesize</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:text>\textenglish{</xsl:text>
          <xsl:choose>
	    <xsl:when test="@n and @edRef">
	      <xsl:text>\cite[</xsl:text>
	      <xsl:value-of select="@n"/>
	      <xsl:text>]{</xsl:text>
	      <xsl:value-of select="replace(@edRef, '^#', '')"/>
	      <xsl:text>}</xsl:text>
	    </xsl:when>
	    <xsl:when test="@n and @ed">
	      <xsl:value-of select="@n"/>
	      <xsl:text>/</xsl:text>
	      <xsl:value-of select="replace(@ed, '^#', '')"/>
	    </xsl:when>
            <xsl:when test="@n">
              <xsl:value-of select="@n"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>pb in</xsl:text>
	      <xsl:choose>
              <xsl:when test="@ed">
                <xsl:value-of select="@ed"/>
              </xsl:when>
	      <xsl:when test="@edRef">
		<xsl:text>\cite{</xsl:text>
		<xsl:value-of select="replace(@edRef, '^#', '')"/>
		<xsl:text>}</xsl:text>
	      </xsl:when>
	      </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>}}</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@facs">
        <xsl:value-of select="concat('% image:', tei:resolveURI(.,@facs),'&#10;')"/>
      </xsl:if>
    </xsl:if>
    <xsl:if test="@xml:id">
      <xsl:text>\label{</xsl:text>
      <xsl:value-of select="@xml:id"/>
      <xsl:text>}</xsl:text>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[common] whether to put quotes around something. check the
      quotation element, @rend, @rendition etc</desc>
  </doc>
  <xsl:template name="makeQuote">
    <xsl:call-template name="startLanguage"/>
    <xsl:choose>
      <xsl:when test="/*/tei:teiHeader//tei:editorialDecl/tei:quotation[@marks='all']">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="@rend='inline'">
        <xsl:value-of select="$preQuote"/>
        <xsl:apply-templates/>
        <xsl:value-of select="$postQuote"/>
      </xsl:when>
      <xsl:when test="$outputTarget='latex'">
        <xsl:choose>
          <xsl:when test="@type='pratīka'">
            <xsl:text>\pratIka{</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$preQuote"/>
            <xsl:apply-templates/>
            <xsl:value-of select="$postQuote"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="@rend or @rendition or          key('TAGREND',local-name(.))">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>hello</xsl:message>
        <xsl:value-of select="$preQuote"/>
        <xsl:apply-templates/>
        <xsl:value-of select="$postQuote"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="endLanguage"/>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process a note element which has a @place for footnote</desc>
  </doc>
  <xsl:template name="footNote">
    <xsl:message>Setting footnote</xsl:message>
    
    <xsl:choose>
      <xsl:when test="$ledmac='true' and
		      $footnotes-as-critical-notes='true' and
		      not(ancestor::tei:note or ancestor::tei:app) and
		      (ancestor::tei:p or ancestor::tei:lg)">
	<xsl:variable name="lemma">
	  <xsl:call-template name="guessLemma"/>
	</xsl:variable>
	<xsl:text>\edtext{</xsl:text>
	<xsl:if test="$lemma='*'">
	  <xsl:text>\textsuperscript{*}</xsl:text>
	</xsl:if>
	<xsl:text>}{</xsl:text>
	<xsl:if test="@xml:id">
	  <xsl:text>\edlabel{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
	</xsl:if>
	<xsl:text>\lemma{</xsl:text>
	<xsl:value-of select="$lemma"/>
	<xsl:text>}\Bfootnote{</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>}}</xsl:text>
      </xsl:when>
      <xsl:when test="@target">
        <xsl:text>\footnotetext{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="parent::tei:rdg">
        <xsl:call-template name="startLanguage"/>
	<xsl:text> (Note:</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>) </xsl:text>
	<xsl:call-template name="endLanguage"/>
      </xsl:when>
      <xsl:when test="ancestor::tei:app">
        <!-- already processed i guess -->
      </xsl:when>
      <xsl:when test="not(ancestor::tei:note)">
        <xsl:text>\footnote{</xsl:text>
        <xsl:if test="@xml:id">
          <xsl:text>\label{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}  </xsl:text>
        </xsl:if>
        <xsl:call-template name="startLanguage"/>
        <xsl:apply-templates/>
        <xsl:call-template name="endLanguage"/>
        <xsl:text>}</xsl:text>
	<xsl:if test="following::node()[1][
		      self::text() and
		      matches(self::text(), '^[^\s ]')]">
	  <xsl:text></xsl:text>
	</xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>Note in weird context.</xsl:message>
        <xsl:text>[[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]]</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element lb</desc>
  </doc>
  <xsl:template match="tei:lb">
    <xsl:choose>
      <xsl:when test="parent::tei:body"/>
      <xsl:when test="parent::tei:back"/>
      <xsl:when test="parent::tei:front"/>
      <xsl:when test="@type='hyphenInWord' and @rend='hidden'"/>
      <xsl:when test="@rend='hidden'">
        <xsl:text> </xsl:text>
      </xsl:when>
      <xsl:when test="@rend='-' or @type='hyphenInWord'">
        <xsl:text>-</xsl:text>
        <xsl:text>{\hskip1pt}\newline </xsl:text>
      </xsl:when>
      <xsl:when test="not(tei:isInline(..)) and (tei:isLast(.) or tei:isFirst(.))"/>
      <xsl:when test="not($showLineBreaks)"/>
      <xsl:otherwise>
        <xsl:text></xsl:text>
	<xsl:text>{\tiny $_{</xsl:text>
        <xsl:choose>
          <xsl:when test="@n">
            <xsl:value-of select="@n"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>lb</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>}$}</xsl:text>
	<xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="parent::tei:l and ancestor::tei:lg and not(preceding-sibling::tei:lb) and string-length(following-sibling::text()[0]) &gt; 8">
      <xsl:text>\\ </xsl:text>      
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex] <param name="target">target</param>
         <param name="ptr">ptr</param>
         <param name="dest">dest</param>
         <param name="body">body</param>
      </desc>
  </doc>
  <xsl:template name="makeInternalLink">
    <xsl:param name="target"/>
    <xsl:param name="class"/>
    <xsl:param name="ptr" as="xs:boolean" select="false()"/>
    <xsl:param name="dest"/>
    <xsl:param name="body"/>
    <xsl:choose>
      <xsl:when test="id($dest)">
        <xsl:choose>
          <xsl:when test="not($body='')">
            <xsl:text>\hyperlink{</xsl:text>
            <xsl:value-of select="$dest"/>
            <xsl:text>}{</xsl:text>
            <xsl:value-of select="$body"/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:when test="$ptr">
            <xsl:for-each select="id($dest)">
              <xsl:choose>
                <xsl:when test="$class='pageref'">
                  <xsl:text>\pageref{</xsl:text>
                  <xsl:value-of select="@xml:id"/>
                  <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:when test="self::tei:note[@xml:id]">
                  <xsl:text>\ref{</xsl:text>
                  <xsl:value-of select="@xml:id"/>
                  <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:when test="self::tei:figure[tei:head and @xml:id]">
                  <xsl:text>\ref{</xsl:text>
                  <xsl:value-of select="@xml:id"/>
                  <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:when test="self::tei:table[tei:head and @xml:id]">
                  <xsl:text>\ref{</xsl:text>
                  <xsl:value-of select="@xml:id"/>
                  <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(local-name(.),'div')">
                  <xsl:text>\textit{\hyperref[</xsl:text>
                  <xsl:value-of select="$dest"/>
                  <xsl:text>]{</xsl:text>
                  <xsl:apply-templates mode="xref" select=".">
                    <xsl:with-param name="minimal" select="$minimalCrossRef"/>
                  </xsl:apply-templates>
                  <xsl:text>}}</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>\hyperlink{</xsl:text>
                  <xsl:value-of select="$dest"/>
                  <xsl:text>}{</xsl:text>
                  <xsl:value-of select="$body"/>
                  <xsl:apply-templates mode="xref" select=".">
                    <xsl:with-param name="minimal" select="$minimalCrossRef"/>
                  </xsl:apply-templates>
                  <xsl:text>}</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="$body=''">
            <xsl:text>\cref{</xsl:text>
            <xsl:value-of select="$dest"/>
            <xsl:text>}</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\hyperlink{</xsl:text>
            <xsl:value-of select="$dest"/>
            <xsl:text>}{</xsl:text>
            <xsl:value-of select="$body"/>
            <xsl:apply-templates/>
            <xsl:text>}</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="not($body='')">
            <xsl:value-of select="$body"/>
          </xsl:when>
          <xsl:when test="$ptr">
            <xsl:value-of select="$dest"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:del">
    <xsl:text>\deletion{</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  <xsl:template match="tei:add">
    <xsl:text>\add{</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}</xsl:text>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>
      <p>Default language of document: we look in text and body elements for the xml:lang attribute, and use its value if we find it. Otherwise, default to "sanskrit". In the xml file, the xml:lang tag should have a value according to <ref>http://www.iana.org/assignments/language-subtag-registry/language-subtag-registry</ref>. Anything starting with "sa-" we match to "sanskrit" (also the default), anything with "bo-" to Tibetan, and anything with "en-" to "english". </p>
    </desc>
  </doc>
  <xsl:param name="defaultlanguage">
    <xsl:choose>
      <xsl:when test="starts-with(.//tei:text/@xml:lang, 'bo')">
        <xsl:text>tibetan</xsl:text>
      </xsl:when>
      <xsl:when test="starts-with(.//tei:text/@xml:lang, 'en')">
        <xsl:text>english</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>sanskrit</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="defaultEncoding">
    <xsl:choose>
      <xsl:when test="contains(.//tei:text/@xml:lang, 'Deva')">
        <xsl:text>devanagari</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>latin</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" class="layout">
    <desc>
      <p>Options of default language of document that get passed to setdefaultlanguage</p>
    </desc>
  </doc>
  <xsl:param name="defaultlanguageoptions">
    <xsl:choose>
      <xsl:when test="starts-with(.//tei:text/@xml:lang, 'bo')">
        <xsl:text>[numerals=arabic]</xsl:text>
      </xsl:when>
      <xsl:when test="starts-with(.//tei:text/@xml:lang, 'en')"/>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:param>
  <xsl:template name="startLanguage">
    <xsl:if test="@xml:lang">
      <xsl:choose>
        <xsl:when test="@xml:lang='bo'">
          <xsl:text>\begin{tibetan}</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@xml:lang,'sa')">
          <xsl:text>\begin{sanskrit}</xsl:text>
	</xsl:when>
        <xsl:otherwise>
          <xsl:text>\begin{english}</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <xsl:template name="endLanguage">
    <xsl:if test="@xml:lang">
      <xsl:choose>
        <xsl:when test="@xml:lang='bo'">
          <xsl:text>\end{tibetan}</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@xml:lang,'sa')">
          <xsl:text>\end{sanskrit}</xsl:text>
	</xsl:when>
        <xsl:otherwise>
          <xsl:text>\end{english}</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process a note element which has a @place attribute
      pointing to margin</desc>
  </doc>
  <xsl:template name="marginalNote">
    <xsl:choose>
      <xsl:when test="$ledmac='true'">
	<xsl:choose>
	  <xsl:when test="not(ancestor::tei:note) and (ancestor::tei:p or ancestor::tei:lg)">
            <xsl:text>\ledsidenote{</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>\marginnote{</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
        <xsl:if test="@xml:id">
          <xsl:text>\label{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
        </xsl:if>
        <xsl:call-template name="startLanguage"/>
        <xsl:apply-templates/>
        <xsl:call-template name="endLanguage"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\marginnote{</xsl:text>
        <xsl:if test="@xml:id">
          <xsl:text>\label{</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>}</xsl:text>
        </xsl:if>
	<xsl:call-template name="startLanguage"/>
        <xsl:apply-templates/>
	<xsl:call-template name="endLanguage"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process elements tei:table</desc>
  </doc>
  <xsl:template match="tei:table">
    <!-- count the rows of the table -->
    <xsl:variable name="table-rows">
      <xsl:value-of select="count(tei:row)"/>
    </xsl:variable>
    <xsl:variable name="table-columns">
      <xsl:value-of select="count(tei:row[1]/tei:cell)"/>
    </xsl:variable>
    <!-- <xsl:if test="@xml:id"> -->
    <!-- 	<xsl:text>\label{</xsl:text> -->
    <!-- 	<xsl:value-of   select="@xml:id"/> -->
    <!-- 	<xsl:text>}</xsl:text> -->
    <!-- </xsl:if> -->
    <xsl:text> \par </xsl:text>
    <xsl:choose>
      <xsl:when test="contains(@rend,'sideways')">
        <xsl:text>
	    \begin{landscape}
	  </xsl:text>
      </xsl:when>
      <xsl:otherwise>
	</xsl:otherwise>
    </xsl:choose>
    <!-- check if we're in a table env? -->
    <xsl:choose>
      <xsl:when test="ancestor::tei:table">
        <xsl:text>\begin{tabular}</xsl:text>
        <xsl:call-template name="makeTable">
          <xsl:with-param name="longtable">false</xsl:with-param>
        </xsl:call-template>
        <xsl:text>\end{tabular}</xsl:text>
      </xsl:when>
      <xsl:when test="$table-rows &gt; 40 or contains(@rend,'long')">
        <xsl:variable name="longtable">true</xsl:variable>
        <xsl:text>
	  % uncomment in twocolumn mode: \onecolumn
	{\footnotesize
	\begin{longtable}</xsl:text>
        <xsl:call-template name="makeTable">
          <xsl:with-param name="longtable">true</xsl:with-param>
        </xsl:call-template>
        <xsl:text>\tabularnewline 
	\bottomrule
	\end{longtable}
	}
	% uncomment in twocolumn mode: \twocolumn 
	</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\ctable[</xsl:text>
        <!-- check caption -->
        <xsl:choose>
          <xsl:when test="tei:head and not(@rend='display')">
            <xsl:text>caption={</xsl:text>
            <xsl:for-each select="tei:head">
              <xsl:if test="not(@type='toc')">
                <xsl:apply-templates/>
              </xsl:if>
            </xsl:for-each>
            <xsl:text>},</xsl:text>
          </xsl:when>
        </xsl:choose>
        <!-- set toc caption -->
        <xsl:choose>
          <xsl:when test="tei:head and not(@rend='display') and tei:head[@type='toc']">
            <xsl:text>cap={</xsl:text>
            <xsl:for-each select="tei:head">
              <xsl:if test="@type='toc'">
                <xsl:apply-templates/>
              </xsl:if>
            </xsl:for-each>
            <xsl:text>},</xsl:text>
          </xsl:when>
        </xsl:choose>
        <!-- set the label -->
        <xsl:choose>
          <xsl:when test="@xml:id">
            <xsl:text>label=</xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>,</xsl:text>
          </xsl:when>
        </xsl:choose>
        <!-- check position -->
        <xsl:if test="contains(@rend,'puthere')">
          <xsl:text>pos=H,</xsl:text>
        </xsl:if>
        <xsl:if test="contains(@rend,'putrighthere')">
          <xsl:text>pos=h!,</xsl:text>
        </xsl:if>
        <xsl:if test="contains(@rend,'bottom')">
          <xsl:text>pos=b!,</xsl:text>
        </xsl:if>
        <!-- set a maxwidth -->
        <xsl:if test="contains(@rend,'sideways')">
          <!-- \textheight  was ignored by ctable? -->
          <xsl:text>maxwidth=600pt
	  </xsl:text>
        </xsl:if>
        <xsl:if test="not(contains(@rend,'sideways'))">
          <xsl:text>maxwidth=\textwidth
	  </xsl:text>
        </xsl:if>
        <xsl:text>,doinside=\small]</xsl:text>
        <xsl:call-template name="makeCTableData"/>
        <xsl:text>
	</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="contains(@rend,'sideways')">
      <xsl:text>
	  \end{landscape}
	</xsl:text>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex] table stuff. </desc>
  </doc>
  <xsl:template name="makeTable">
    <xsl:param name="longtable"/>
    <xsl:param name="calculateTable"/>
    <xsl:variable name="r">
      <xsl:value-of select="@rend"/>
    </xsl:variable>
    <xsl:text>{</xsl:text>
    <xsl:if test="contains($r,'rules')">|</xsl:if>
    <xsl:choose>
      <xsl:when test="@preamble">
        <xsl:value-of select="@preamble"/>
      </xsl:when>
      <xsl:when test="function-available('exsl:node-set') and         (calculateTable or contains($r,'calculatewidth'))">
        <xsl:call-template name="makePreamble-complex">
          <xsl:with-param name="r" select="$r"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="makePreamble-simple">
          <xsl:with-param name="r" select="$r"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>}
</xsl:text>
    <xsl:call-template name="tableHline"/>
    <xsl:choose>
      <xsl:when test="tei:head and not(@rend='display')">
        <xsl:if test="not(ancestor::tei:table)">
          <xsl:text>\caption</xsl:text>
          <xsl:if test="count(tei:head[@type='toc']) &gt; 0">
            <xsl:text>[</xsl:text>
            <xsl:for-each select="tei:head[@type='toc']">
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:text>]</xsl:text>
          </xsl:if>
          <xsl:text>{</xsl:text>
          <xsl:for-each select="tei:head">
            <xsl:if test="not(@type='toc')">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:for-each>
          <xsl:if test="@xml:id">
            <xsl:text>\label{</xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>}</xsl:text>
          </xsl:if>
          <xsl:text>}\tabularnewline \toprule
	  </xsl:text>
          <xsl:if test="tei:row[@role='label']">
            <xsl:for-each select="tei:row[1]">
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:text>\tabularnewline
	  \midrule
	  </xsl:text>
          </xsl:if>
          <xsl:text>\endfirsthead
	  </xsl:text>
          <!-- head for following pages -->
          <xsl:text>\caption[]{</xsl:text>
          <xsl:for-each select="tei:head">
            <xsl:if test="not(@type='toc')">
              <xsl:apply-templates/>
            </xsl:if>
          </xsl:for-each>
          <!-- the following does not properly escape special characters -->
          <!-- <xsl:apply-templates mode="ok" select="tei:head"/> -->
          <xsl:text> (cont.)}\tabularnewline \toprule
	  </xsl:text>
          <xsl:if test="tei:row[@role='label']">
            <xsl:for-each select="tei:row[1]">
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:text>\tabularnewline
	    \midrule</xsl:text>
          </xsl:if>
          <xsl:text>\endhead </xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::tei:table">
          <xsl:text>\caption{</xsl:text>
          <xsl:for-each select="tei:head">
            <xsl:apply-templates/>
          </xsl:for-each>
          <!-- <xsl:apply-templates mode="ok" select="tei:head"/> -->
          <xsl:text>}\\ </xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise> </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="contains($r,'rules')"> \hline </xsl:if>
    <xsl:apply-templates>
      <xsl:with-param name="longtable" select="$longtable"/>
    </xsl:apply-templates>
    <xsl:if test="contains($r,'rules')">
      <xsl:text>\tabularnewline \hline </xsl:text>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex] ctable stuff. generates the column section, and the two data sections.</desc>
  </doc>
  <xsl:template name="makeCTableData">
    <xsl:variable name="r">
      <xsl:value-of select="@rend"/>
    </xsl:variable>
    <xsl:text>{</xsl:text>
    <!-- table alignment -->
    <xsl:choose>
      <!-- if we have a rend attribute that contains a LaTeX directive, use its value -->
      <xsl:when test="contains($r, 'LaTeX:')">
        <xsl:choose>
          <xsl:when test="contains(substring-after($r, 'LaTeX:'), ' ')">
            <xsl:value-of select="substring-before(substring-after($r, 'LaTeX:'), ' ')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring-after($r, 'LaTeX:')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <!-- figure out how many cells there are, taking into account multicolumn cells -->
        <xsl:for-each select="tei:row[1]/tei:cell">
          <!-- does this cell have a cols attribute? -->
          <xsl:choose>
            <xsl:when test="@cols">
              <xsl:variable name="cellnum">
                <xsl:value-of select="@cols"/>
              </xsl:variable>
              <xsl:call-template name="fake-while">
                <xsl:with-param name="until-num" select="$cellnum"/>
                <xsl:with-param name="print">X<xsl:if test="contains($r,'rules')">|</xsl:if></xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>X</xsl:text>
              <xsl:if test="contains($r,'rules')">|</xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>}{}{\toprule
    </xsl:text>
    <xsl:apply-templates>
      <xsl:with-param name="longtable">false</xsl:with-param>
    </xsl:apply-templates>
    <xsl:text>\tabularnewline \bottomrule}</xsl:text>
  </xsl:template>
  <xsl:template name="tableHline">
    <xsl:choose>
      <xsl:when test="ancestor::tei:table or @rend='display'">\midrule <!-- \hline --> </xsl:when>
      <xsl:otherwise>
        <!-- \hline\endfoot\hline\endlastfoot -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>See http://www.dpawson.co.uk/xsl/sect2/repetition.html. This
  substitutes for a while function.</desc>
  </doc>
  <xsl:template name="fake-while">
    <xsl:param name="until-num"/>
    <xsl:param name="print"/>
    <xsl:if test="number($until-num) &gt; 0">
      <xsl:value-of select="$print"/>
      <xsl:call-template name="fake-while">
        <xsl:with-param name="until-num" select="number($until-num) - 1"/>
        <xsl:with-param name="print" select="$print"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process elements tei:row</desc>
  </doc>
  <xsl:template match="tei:row">
    <xsl:param name="longtable"/>
    <xsl:variable name="first-row">
      <xsl:choose>
        <xsl:when test="not(preceding-sibling::tei:row)">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="@role='label'">
      <!-- \rowcolor{label} -->
    </xsl:if>
    <xsl:choose>
      <!-- for longtables we don't want to print the first line, cause that's already in the head-->
      <xsl:when test="$first-row='true' and $longtable='true' and @role='label'">
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="following-sibling::tei:row">
      <xsl:choose>
        <xsl:when test="$longtable='false'">
          <xsl:text>\tabularnewline</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="not(@role='label') and $first-row='true'">
            <xsl:text>\tabularnewline % first row but no label</xsl:text>
          </xsl:if>
          <xsl:if test="$first-row='false'">
            <xsl:text>\tabularnewline </xsl:text>
            <!-- if this row is not a label, but the immediately following one is, mark it -->
            <xsl:if test="following-sibling::tei:row[1][@role='label'] and not(@role='label')">
              <xsl:text>\midrule </xsl:text>
              <xsl:if test="$longtable='true'">
                <!-- if we're in a longtable, tell latex that this would be a good point to break -->
                <xsl:text>\pagebreak[3] </xsl:text>
              </xsl:if>
            </xsl:if>
            <xsl:if test="following-sibling::tei:row[1][@role='sublabel'] and not(@role='label')">
              <xsl:text>\midrule[0.05em]</xsl:text>
            </xsl:if>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
      <!-- see if this was a label -->
      <xsl:if test="@role='label'  and $longtable='false'">\midrule </xsl:if>
      <xsl:if test="@role='label'  and $longtable='true' and $first-row='false'">\midrule[0.08em] </xsl:if>
      <xsl:if test="@role='sublabel'  and $longtable='true' and $first-row='false'">\midrule[0.05em] </xsl:if>
      <xsl:text>
</xsl:text>
    </xsl:if>
    <xsl:if test="@style='breakable' and $longtable='true'">
      <xsl:text>\pagebreak[4] </xsl:text>
    </xsl:if>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex] </desc>
  </doc>
  <xsl:template name="makePreamble-complex">
    <xsl:param name="r"/>
    <xsl:variable name="valign">
      <xsl:choose>
        <xsl:when test="contains($r,'bottomAlign')">B</xsl:when>
        <xsl:when test="contains($r,'midAlign')">M</xsl:when>
        <xsl:otherwise>p</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="tds">
      <xsl:for-each select=".//tei:cell">
        <xsl:variable name="stuff">
          <xsl:apply-templates/>
        </xsl:variable>
        <cell>
          <xsl:attribute name="col">
            <xsl:number/>
          </xsl:attribute>
          <xsl:value-of select="string-length($stuff)"/>
        </cell>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="total">
      <xsl:value-of select="sum(exsl:node-set($tds)/cell)"/>
    </xsl:variable>
    <xsl:for-each select="exsl:node-set($tds)/cell">
      <xsl:sort data-type="number" select="@col"/>
      <xsl:variable name="c" select="@col"/>
      <xsl:if test="not(preceding-sibling::cell[$c=@col])">
        <xsl:variable name="len">
          <xsl:value-of select="sum(following-sibling::cell[$c=@col]) + current()"/>
        </xsl:variable>
        <xsl:value-of select="$valign"/>
        <xsl:text>{</xsl:text>
        <xsl:value-of select="($len div $total) * $tableMaxWidth"/>
        <xsl:if test="contains($r,'sideways')">
          <xsl:text>\textheight}</xsl:text>
        </xsl:if>
        <xsl:if test="not(contains($r,'sideways'))">
          <xsl:text>\textwidth}</xsl:text>
        </xsl:if>
        <xsl:if test="contains($r,'rules')">|</xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex]</desc>
  </doc>
  <xsl:template name="makePreamble-simple">
    <xsl:param name="r"/>
    <xsl:choose>
      <xsl:when test="contains($r, 'LaTeX:')">
        <xsl:choose>
          <xsl:when test="contains(substring-after($r, 'LaTeX:'), ' ')">
            <xsl:value-of select="substring-before(substring-after($r, 'LaTeX:'), ' ')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring-after($r, 'LaTeX:')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="tei:row[1]/tei:cell">
          <xsl:text>l</xsl:text>
          <xsl:if test="contains($r,'rules')">|</xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc/>
  </doc>
  <xsl:template match="tei:body">
    <xsl:if test="not(ancestor::tei:floatingText) and not(preceding::tei:body) and (preceding::tei:front or $printtoc='true')">
      <xsl:text>\mainmatter </xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Escaping chars reserved in tex. Actually, we also substitute
    Sanskrit chars here where a break is allowed. Should be fixed
    properly, however, with hyphenation patterns.
    </desc>
  </doc>
  <xsl:function name="tei:escapeChars" as="xs:string" override="yes">
    <xsl:param name="letters"/>
    <xsl:param name="context"/>
    <xsl:value-of
	select="replace(replace(replace(replace(replace(translate($letters,'&#10;',' '), '\\','\\textbackslash '), '_','\\textunderscore '),'\^','\\textasciicircum '), '~','\\textasciitilde '),
	  '([\}\{%&amp;\$#])','\\$1')"/>
  </xsl:function>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element quote</desc>
  </doc>
  <xsl:template match="tei:quote">
    <xsl:call-template name="startLanguage"/>
    <xsl:choose>
      <xsl:when test="parent::tei:cit">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="not(parent::tei:p) and not($ledmac='true')">
        <xsl:text>

	  \begin{quote}</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\end{quote}

	  </xsl:text>
      </xsl:when>
      <xsl:when test="not(ancestor::tei:p)">
	<xsl:text>
	  \bigskip
	  \begingroup
	</xsl:text>
	<xsl:if test="@type='base-text' or @type='mula' or @type='mūla'">
	  <xsl:text>
	    \large
	  </xsl:text>
	</xsl:if>
        <xsl:apply-templates/>
	<xsl:text>
	  \endgroup
	</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="makeQuote"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="endLanguage"/>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element head</desc>
  </doc>
  <xsl:template match="tei:head">
    <xsl:message>Head element found.</xsl:message>
    <xsl:choose>
      <xsl:when test="parent::tei:castList"/>
      <xsl:when test="parent::tei:figure"/>
      <xsl:when test="parent::tei:list"/>
      <xsl:when test="parent::tei:lg"> \subsection*{<xsl:apply-templates/>} </xsl:when>
      <xsl:when test="parent::tei:table"/>
      <xsl:when test="preceding-sibling::tei:head"/>
      <xsl:otherwise>
        <xsl:variable name="depth">
	  <xsl:value-of select="count(ancestor::div[ancestor::text])"/>
        </xsl:variable>
        <xsl:message>Depth of this head (<xsl:value-of select="."/>): <xsl:value-of select="$depth"/>.</xsl:message>
        <xsl:text>
\</xsl:text>
        <xsl:choose>
          <xsl:when test="$documentclass='book'">
            <xsl:choose>
              <xsl:when test="$depth=0">chapter</xsl:when>
              <xsl:when test="$depth=1">section</xsl:when>
              <xsl:when test="$depth=2">subsection</xsl:when>
              <xsl:when test="$depth=3">subsubsection</xsl:when>
              <xsl:when test="$depth=4">paragraph</xsl:when>
              <xsl:when test="$depth=5">subparagraph</xsl:when>
              <xsl:otherwise>section</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$documentclass='memoir'">
            <xsl:message>Processing head for memoir class.</xsl:message>
            <xsl:choose>
              <xsl:when test="parent::tei:div[@type='part']">part</xsl:when>
              <xsl:when test="$depth=0">chapter</xsl:when>
              <xsl:when test="$depth=1">section</xsl:when>
              <xsl:when test="$depth=2">subsection</xsl:when>
              <xsl:when test="$depth=3">subsubsection</xsl:when>
              <xsl:when test="$depth &gt; 3">paragraph</xsl:when>
              <xsl:otherwise>section</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$depth=0">section</xsl:when>
              <xsl:when test="$depth=1">subsection</xsl:when>
              <xsl:when test="$depth=2">subsubsection</xsl:when>
              <xsl:when test="$depth=3">paragraph</xsl:when>
              <xsl:when test="$depth=4">subparagraph</xsl:when>
              <xsl:otherwise>section</xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
	  <!-- Decide if this is a starred version. -->
	  <!-- For frontmatter in memoir class, ignore numberFrontHeadings, since memoir deals with that. -->
          <xsl:when test="parent::tei:body or
			  ancestor::tei:floatingText or
			  parent::tei:div/@rend='nonumber' or
			  (ancestor::tei:back and $numberBackHeadings='') or
			  (not($numberHeadings='true') and ancestor::tei:body) or
			  (ancestor::tei:front and ($numberFrontHeadings='' and not($documentclass='memoir'))) or
			  $depth &gt; 3">
	    <xsl:text>*</xsl:text>
	  </xsl:when>
          <xsl:otherwise>[{<xsl:call-template name="makeHeadTOC"/>}]</xsl:otherwise>
        </xsl:choose>
        <xsl:text>{</xsl:text>
	<xsl:call-template name="startLanguage"/>
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::tei:head">
          <xsl:text>: </xsl:text>
          <xsl:value-of select="following-sibling::tei:head/tei:escapeChars(.,.)"/>
        </xsl:if>
	<xsl:call-template name="endLanguage"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="../@xml:id">
          <xsl:text>\label{</xsl:text>
          <xsl:value-of select="../@xml:id"/>
          <xsl:text>}</xsl:text>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process a head for the TOC.</desc>
  </doc>
  <xsl:template name="makeHeadTOC">
    <xsl:variable name="text">
      <xsl:value-of select="./text()"/>
    </xsl:variable>
    <xsl:value-of select="tei:escapeChars(normalize-space($text),.)"/>
    <xsl:if test="following-sibling::tei:head">
      <xsl:text>: </xsl:text>
      <xsl:value-of select="normalize-space(following-sibling::tei:head/tei:escapeChars(.,.))"/>
    </xsl:if>
  </xsl:template>


  
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process the tei:div elements</desc>
</doc>

<xsl:template match="tei:div|tei:div1|tei:div2|tei:div3|tei:div4|tei:div5">
  <xsl:if test="not($skipTocDiv='true' and @type='toc')">
    <xsl:variable name="depth">
      <xsl:value-of select="count(ancestor::tei:div|tei:div1|tei:div2|tei:div3|tei:div4|tei:div5)"/>
    </xsl:variable>
    <xsl:if test="not(child::head) and @xml:id">
      <xsl:text>\label{</xsl:text>
      <xsl:value-of select="@xml:id"/>
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:call-template name="startLanguage"/>
    <xsl:choose>
      <xsl:when test="$ledmac='true' and ancestor::tei:body">
	<xsl:text>
	  
	% new div opening: depth here is </xsl:text>
	<xsl:value-of select="$depth"/>
	<xsl:text>
	</xsl:text>
	
	<xsl:if test="$depth = $ledmacNumberDepth">
	  <xsl:text>
	    
	    \begingroup
	    \beginnumbering% beginning numbering from div depth=0
	    
	  </xsl:text>
	</xsl:if>
	
	
	<xsl:if test="tei:head">
	  <xsl:apply-templates select="tei:head"/>
	</xsl:if>
	
	<xsl:apply-templates select="child::*[not(self::tei:head)]"/>
	
	<xsl:if test="$depth = $ledmacNumberDepth">
	  <xsl:text>
	    
	    \endnumbering% ending numbering from div
	    \endgroup
	    
	  </xsl:text>
	</xsl:if>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="endLanguage"/>
  </xsl:if>
    </xsl:template>
  
    <xsl:template match="tei:trailer|tei:label[@type='trailer']">
      <xsl:choose>
	<xsl:when test="$ledmac='true'">
	  <xsl:message>Trailer in ledmac mode</xsl:message>
	  <xsl:text>
	    
	    \pstart
	    \begin{center}
	  </xsl:text>
	  <xsl:apply-templates/>
	  <xsl:text>
	    \end{center}
	    \pend
	  
	  </xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:message>Trailer without ledmac</xsl:message>
	  <xsl:text>
	    
	    \begin{center}
	  </xsl:text>
	  <xsl:apply-templates/>
	  <xsl:text>
	    \end{center}
	    
	  </xsl:text>
	</xsl:otherwise>
      </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>
      <p>[common] </p>
      <p>Generate simple title with no markup</p>
    </desc>
  </doc>
  <xsl:function name="tei:generateSimpleTitle">
    <xsl:param name="context"/>
    <xsl:for-each select="$context">
      <xsl:choose>
        <xsl:when test="$useHeaderFrontMatter='true' and ancestor-or-self::tei:TEI/tei:text/tei:front//tei:docTitle">
          <xsl:apply-templates select="ancestor-or-self::tei:TEI/tei:text/tei:front//tei:docTitle" mode="simple"/>
        </xsl:when>
        <xsl:when test="ancestor-or-self::tei:teiCorpus">
          <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[not(@type='subordinate')]" mode="simple"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="ancestor-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
            <xsl:for-each select="tei:title">
              <xsl:apply-templates select="." mode="simple"/>
              <xsl:if test="following-sibling::tei:title">
                <xsl:text>; </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>
          <xsl:if test="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author">
            <xsl:text> // </xsl:text>
            <xsl:sequence select="replace(string-join(tei:generateAuthor(.),''),'; ','')"/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:function>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[latex] Title banner </desc>
  </doc>
  <xsl:template name="printTitleAndLogo">
    <xsl:text>
     \makeCustomTitle
     </xsl:text>
  </xsl:template>
  <xsl:template match="tei:note">
    <xsl:choose>
      <xsl:when test="@place='none'"/>
      <xsl:when test="not(@place) and (ancestor::tei:bibl or ancestor::tei:biblFull or ancestor::tei:biblStruct)">
        <xsl:call-template name="makeText">
          <xsl:with-param name="letters"> (</xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
        <xsl:call-template name="makeText">
          <xsl:with-param name="letters">)</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="not(@place) and (ancestor::tei:head)">
	<xsl:text>\footnote{</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="@place='comment'">
        <xsl:call-template name="commentNote"/>
      </xsl:when>
      <xsl:when test="@place='inline' and not(tei:isInline(.))">
        <xsl:call-template name="displayNote"/>
      </xsl:when>
      <xsl:when test="@place='inline'">
        <xsl:call-template name="plainNote"/>
      </xsl:when>
      <xsl:when test="tei:isEndNote(.) or $autoEndNotes='true'">
        <xsl:call-template name="endNote"/>
      </xsl:when>
      <xsl:when test="tei:isFootNote(.)">
        <xsl:call-template name="footNote"/>
      </xsl:when>
      <xsl:when test="@place='divend' or
		      @place='h' or
		      @place='inter' or
		      @place='left' or
		      @place='marg1' or
		      @place='marg2' or
		      @place='marg3' or
		      @place='marge' or
		      @place='margin-bottom' or
		      @place='margin-left' or
		      @place='margin-right' or
		      @place='margin-top' or
		      @place='margin/inline' or
		      @place='marginLeft' or
		      @place='marginOuter' or
		      @place='marginRight' or
		      @place='margin_left' or
		      @place='margin_right' or
		      @place='right' or
		      @place='margin'">
        <xsl:call-template name="marginalNote"/>
      </xsl:when>
      <xsl:when test="(@place='display' or not(tei:isInline(.)) or tei:q)">
        <xsl:call-template name="footNote"/>
      </xsl:when>
      <xsl:when test="@place">
        <xsl:message>unknown @place for note, <xsl:value-of select="@place"/></xsl:message>
        <xsl:call-template name="displayNote"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="footNote"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:name|tei:persName|tei:placeName|tei:orgName">
    <xsl:choose>
      <xsl:when test="not(ancestor::tei:person|ancestor::tei:biblStruct)">
        <xsl:call-template name="makeInline">
          <xsl:with-param name="style" select="local-name()"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="following-sibling::tei:name|following-sibling::tei:persName">
        <xsl:call-template name="makeText">
          <xsl:with-param name="letters">, </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="makeSpan"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>inline objects</desc>
  </doc>
  <xsl:template name="makeInline">
    <xsl:param name="before"/>
    <xsl:param name="style"/>
    <xsl:param name="after"/>
    <xsl:value-of select="$before"/>
    <xsl:sequence select="tei:makeHyperTarget(@xml:id)"/>
    <xsl:choose>
      <xsl:when test="$style=('add','unclear','bibl','docAuthor','titlem','italic','mentioned','term','foreign')">
        <xsl:text>\textit{</xsl:text>
        <xsl:value-of select="tei:escapeChars(normalize-space(.),.)"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style='supplied'">
        <xsl:value-of select="tei:escapeChars(normalize-space(.),.)"/>
      </xsl:when>
      <xsl:when test="$style='bold'">
        <xsl:text>\textbf{</xsl:text>
        <xsl:value-of select="tei:escapeChars(normalize-space(.),.)"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style='strikethrough'">
        <xsl:text>\sout{</xsl:text>
        <xsl:value-of select="tei:escapeChars(normalize-space(.),.)"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style='sup'">
        <xsl:text>\textsuperscript{</xsl:text>
        <xsl:value-of select="tei:escapeChars(normalize-space(.),.)"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style='sub'">
        <xsl:text>\textsubscript{</xsl:text>
        <xsl:value-of select="tei:escapeChars(normalize-space(.),.)"/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style=''">
        <xsl:sequence select="concat('{\',local-name(),' ')"/>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style = 'persName' or $style = 'name'">
        <xsl:text>\</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style = 'ref'">
        <xsl:choose>
          <!-- @target is processed elsewhere, just check for cRef -->
          <xsl:when test="@cRef">
	    <xsl:variable name="cRef">
	      <xsl:value-of select="@cRef"/>
	    </xsl:variable>
	    <xsl:choose>
	      <xsl:when test="//*[@xml:id=$cRef] and $cRef-strict='false'">
		<xsl:text>\cref{</xsl:text>
		<xsl:value-of select="$cRef"/>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:text>\href{</xsl:text>
		<xsl:value-of select="$homeURL"/>
		<xsl:value-of select="$cRef-query-string"/>
		<xsl:value-of select="$cRef"/>
		<xsl:text>}{</xsl:text>
		<xsl:choose>
		  <xsl:when test="descendant-or-self::text()">
		    <xsl:value-of select="descendant-or-self::text()"/>
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:value-of select="upper-case($cRef)"/>
		  </xsl:otherwise>
		</xsl:choose>
	      </xsl:otherwise>
	    </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>\hyperlink{</xsl:text>
            <xsl:value-of select="node()"/>
            <xsl:text>}{</xsl:text>
            <xsl:value-of select="node()"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:when test="$style='head'">
	<xsl:text>
	  \begin{center}
	\textbf{[[</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>]]}
	\end{center}
	</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="concat('{\',$style[1], ' ')"/>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$after"/>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element listBibl. This should be handled by biblatex.</desc>
  </doc>
  <xsl:template match="tei:listBibl">
    <xsl:message>Processing listBibl. Won't do anything much here, configure biblatex.</xsl:message>
    <xsl:text>
       \chapter{Bibliographical Hacks}
       \begin{minted}[fontfamily=rmfamily,fontsize=\footnotesize]{xml}
     </xsl:text>
    <xsl:copy-of select="saxon:serialize(//tei:listBibl, 'xmlstring')"/>
    <xsl:text>
       \end{minted}
     </xsl:text>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process ptr and ref elements, hypertext pointers</desc>
  </doc>
  <xsl:template match="tei:ptr|tei:ref">
    <xsl:if test="parent::tei:analytic or parent::tei:monogr">
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@type='transclude' and self::tei:ptr">
        <xsl:apply-templates select="doc(@target)"/>
      </xsl:when>
      <!-- omit empty ref elements that do not have @target -->
      <xsl:when test="self::tei:ref and not(@target) and not(descendant-or-self::text())">
        <xsl:message>Can't process ref <xsl:value-of select="node()"/></xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="ptr" select="if (self::tei:ptr) then           true() else false()"/>
        <xsl:variable name="xmllang" select="@xml:lang"/>
        <xsl:variable name="here" select="."/>
        <xsl:choose>
          <xsl:when test="not(@target) and self::tei:ref">
            <xsl:call-template name="makeInline">
              <xsl:with-param name="style">ref</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="@cRef and self::tei:ptr">
            <xsl:call-template name="makeInline">
              <xsl:with-param name="style">ptr</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
	  <!-- hack for wrong markup; should become bibl elements -->
	  <xsl:when test="@target and
			  (contains(@type, 'bib')
			  or
			  (name(//*[@xml:id=substring-after($here/@target, '#')]) and			  
			  contains('witness bibl msDesc', name(//*[@xml:id=substring-after($here/@target, '#')]))))">
	    <xsl:text>\cite</xsl:text>
	    <xsl:if test="@corresp">
	      <xsl:text>[</xsl:text>
	      <xsl:value-of select="@corresp"/>
	      <xsl:text>]</xsl:text>
	    </xsl:if>
	    <xsl:text>{</xsl:text>
	    <xsl:call-template name="URIsToBibRefs">
	      <xsl:with-param name="targets" select="@target"/>
	    </xsl:call-template>
	    <xsl:text>}</xsl:text>
	  </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="tokenize(normalize-space(@target),' ')">
              <xsl:variable name="a" select="."/>
              <xsl:for-each select="$here">
                <xsl:choose>
                  <!-- If there is a target attribute starting with #, it is always a local reference -->
                  <xsl:when test="starts-with($a,'#')">
                    <xsl:call-template name="makeInternalLink">
                      <xsl:with-param name="target" select="substring($a,2)"/>
                      <xsl:with-param name="ptr" select="$ptr"/>
                      <xsl:with-param name="dest">
                        <xsl:call-template name="generateEndLink">
                          <xsl:with-param name="where">
                            <xsl:value-of select="substring($a,2)"/>
                          </xsl:with-param>
                        </xsl:call-template>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <!-- if we are doing TEI P4, all targets are local -->
                  <xsl:when test="$teiP4Compat='true'">
                    <xsl:call-template name="makeInternalLink">
                      <xsl:with-param name="target" select="$a"/>
                      <xsl:with-param name="ptr" select="$ptr"/>
                      <xsl:with-param name="dest">
                        <xsl:call-template name="generateEndLink">
                          <xsl:with-param name="where">
                            <xsl:value-of select="$a"/>
                          </xsl:with-param>
                        </xsl:call-template>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <!-- other uses of target means it is external -->
                  <xsl:otherwise>
                    <xsl:call-template name="makeExternalLink">
                      <xsl:with-param name="ptr" select="$ptr"/>
                      <xsl:with-param name="title">
			<xsl:choose>
			  <xsl:when test="@n">
			    <xsl:value-of select="@n"/>
			  </xsl:when>
			  <xsl:when test="@xml:id">
			    <xsl:value-of select="@xml:id"/>
			  </xsl:when>
			  <xsl:when test="string(.)=''">
			    <xsl:value-of select="string(.)"/>
			  </xsl:when>
			</xsl:choose>
		      </xsl:with-param>
                      <xsl:with-param name="dest">
                        <xsl:sequence select="tei:resolveURI($here,$a)"/>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
              <xsl:call-template name="multiTargetSeparator">
                <xsl:with-param name="xmllang" select="$xmllang"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="parent::tei:analytic or parent::tei:monogr">
      <xsl:text> </xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="tei:titlePage">
    <xsl:text>
      \chapter[Title Page]{Title Page}
    </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>
      \cleardoublepage
    </xsl:text>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Rendering rules, turning @rend into LaTeX commands</desc>
  </doc>
  <xsl:template name="rendering">
    <xsl:variable name="decls">
      <xsl:for-each select="tokenize(normalize-space(@rend),' ')">
        <xsl:if test=".='large'">\large</xsl:if>
        <xsl:if test=".='larger'">\larger</xsl:if>
        <xsl:if test=".='small'">\small</xsl:if>
        <xsl:if test=".='smaller'">\smaller</xsl:if>
        <xsl:if test="starts-with(.,'color')">
          <xsl:text>\color</xsl:text>
          <xsl:choose>
            <xsl:when test="starts-with(.,'color(')">
              <xsl:text>{</xsl:text>
              <xsl:value-of select="substring-before(substring-after(.,'color('),')')"/>
              <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="starts-with(.,'color')">
              <xsl:text>{</xsl:text>
              <xsl:value-of select="substring-after(.,'color')"/>
              <xsl:text>}</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="cmd">
      <xsl:if test="tei:render-strike(.)">\sout </xsl:if>
      <xsl:if test="tei:render-italic(.)">\textit </xsl:if>
      <xsl:if test="tei:render-bold(.)">\textbf </xsl:if>
      <xsl:if test="tei:render-typewriter(.)">\texttt </xsl:if>
      <xsl:if test="tei:render-smallcaps(.)">\textsc </xsl:if>
      <xsl:for-each select="tokenize(normalize-space(@rend),' ')">
        <xsl:choose>
          <xsl:when test=".='calligraphic'">\textcal </xsl:when>
          <xsl:when test=".='capsall'">\uppercase </xsl:when>
          <xsl:when test=".='center'">\centerline </xsl:when>
          <xsl:when test=".='gothic'">\textgothic </xsl:when>
          <xsl:when test=".='noindex'">\textrm </xsl:when>
          <xsl:when test=".='overbar'">\textoverbar </xsl:when>
          <xsl:when test=".='plain'">\textrm </xsl:when>
          <xsl:when test=".='quoted'">\textquoted </xsl:when>
          <xsl:when test=".='sub'">\textsubscript </xsl:when>
          <xsl:when test=".='subscript'">\textsubscript </xsl:when>
          <xsl:when test=".='underline'">\uline </xsl:when>
          <xsl:when test=".='sup'">\textsuperscript </xsl:when>
          <xsl:when test=".='superscript'">\textsuperscript </xsl:when>
          <xsl:when test=".='underwavyline'">\uwave </xsl:when>
          <xsl:when test=".='underdoubleline'">\uuline </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:for-each select="tokenize(normalize-space($cmd),' ')">
      <xsl:value-of select="concat(.,'{')"/>
    </xsl:for-each>
    <xsl:choose>
      <xsl:when test="$decls=''">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$cmd=''">
          <xsl:text>{</xsl:text>
        </xsl:if>
        <xsl:value-of select="$decls"/>
        <xsl:if test="matches($decls,'[a-z]$')">
          <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if test="$cmd=''">
          <xsl:text>}</xsl:text>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:for-each select="tokenize(normalize-space($cmd),' ')">
      <xsl:text>}</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Parse @wit attribute into one or more cite commands.
    This function tries to get at the `#xyz' part of each URI in @wit, and uses that as a citekey (since we're translating to TeX, the keys are looked for in all bibs anyway, so there's no need to preserve the path to the bib).
    </desc>
  </doc>
  <xsl:template name="makeCiteFromWit">
    <xsl:param name="witnesses"/>
    <xsl:for-each select="tokenize(normalize-space($witnesses), ' ')">
      <xsl:message>Parsing witness: <xsl:value-of select="."/>.</xsl:message>
      <xsl:variable name="witPath">
	<xsl:choose>
	  <xsl:when test="matches(., '^#')">
	    <xsl:message>internal reference, making absolute.</xsl:message>
	    <xsl:choose>
	      <xsl:when test="matches(replace(.,'^#', ''), '#')">
		<xsl:value-of select="substring-before(replace(.,'^#', ''), '#')"/>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:value-of select="replace(.,'^#', '')"/>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
	  <xsl:when test="matches(., '#')">
	    <xsl:message>absolute reference.</xsl:message>
	    <xsl:value-of select="substring-before(., '#')"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="."/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:message>witPath: <xsl:value-of select="$witPath"/></xsl:message>
      <xsl:variable name="witID">
	<xsl:choose>
	  <xsl:when test="matches(., '^#')">
	    <xsl:value-of select="substring-after(.,$witPath)"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:if  test="matches(., '#')">
	      <xsl:value-of select="substring-after(., '#')"/>
	    </xsl:if>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:message>witID: <xsl:value-of select="$witID"/></xsl:message>
      <xsl:text> \cite</xsl:text>
      <xsl:text>{</xsl:text>
      <xsl:value-of select="$witID"/>
      <xsl:text>}</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Tries to get the part that \cite commands can use from the URI target.
    E.g., ./some/path/to/bibfile.bib#abc123 ---> abc123.
    </desc>
  </doc>
  <xsl:template name="URIsToBibRefs">
    <xsl:param name="targets" />
    <xsl:param name="separator">,</xsl:param>
    <xsl:variable name="refs">
      <refs>
	<xsl:for-each select="tokenize(normalize-space($targets), '\s')">
	  <ref><xsl:value-of select="substring-after(.,'#')"/></ref>
	</xsl:for-each>
      </refs>
    </xsl:variable>
    <xsl:message>Returning: <xsl:value-of select="string-join($refs//text(), $separator)"/></xsl:message>
    <xsl:value-of select="string-join($refs//text(), $separator)"/>
  </xsl:template>

  <xsl:template match="tei:span">
    <xsl:call-template name="makeSpan"/>
  </xsl:template>
  
  <xsl:template name="makeSpan">
    <xsl:call-template name="startLanguage"/>
    <xsl:apply-templates/>
    <xsl:call-template name="endLanguage"/>
  </xsl:template>

  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Start the frontmatter.</desc>
   </doc>
  <xsl:template match="tei:front">
    <xsl:call-template name="startLanguage"/>
    <xsl:apply-templates/>
    <xsl:call-template name="endLanguage"/>
  </xsl:template>

  <xsl:template match="tei:epigraph">
    <xsl:call-template name="startLanguage"/>
    <xsl:apply-templates/>
    <xsl:call-template name="endLanguage"/>
  </xsl:template>

  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>Process element label</desc>
  </doc>
  <xsl:template match="tei:label">
    <xsl:choose>
      <xsl:when test="@type='head'">
	<xsl:text>

	  \begin{center}%% label @type='head'
	\textbf{</xsl:text>
	<xsl:apply-templates/>
	<xsl:text>}
	\end{center}
	</xsl:text>
      </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="makeInline">
	<xsl:with-param name="style" select="@type"/>
      </xsl:call-template>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[common] Generate pretitle</desc>
  </doc>
  <xsl:function name="tei:generatePreTitleHeader">
    <xsl:param name="context"/>
    <xsl:for-each select="$context">
      <xsl:for-each select="ancestor-or-self::tei:TEI|ancestor-or-self::tei:teiCorpus">
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[contains(@type, 'pre')]"/>
          </xsl:for-each>
    </xsl:for-each>
  </xsl:function>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[common] Generate subtitle </desc>
  </doc>
  <xsl:function name="tei:generateSubTitleHeader">
    <xsl:param name="context"/>
    <xsl:for-each select="$context">
      <xsl:for-each select="ancestor-or-self::tei:TEI|ancestor-or-self::tei:teiCorpus">
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[contains(@type, 'sub')]"/>
          </xsl:for-each>
    </xsl:for-each>
  </xsl:function>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc>[common] Find plausible main editor(s) name(s)</desc>
  </doc>
  <xsl:function name="tei:generateEditor"  as="node()*">
    <xsl:param name="context"/>
      <xsl:variable name="result">
    <xsl:for-each select="$context">
      <xsl:choose>
        <xsl:when
	    test="ancestor-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor">
          <xsl:apply-templates mode="editor" select="ancestor-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/>
	</xsl:when>
        <xsl:when
	    test="ancestor-or-self::tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author">
          <xsl:apply-templates mode="editor" select="ancestor-or-self::tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/>
	</xsl:when>
        <xsl:when
	    test="ancestor-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/tei:change/tei:respStmt[tei:resp='editor']">
          <xsl:apply-templates select="ancestor-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/tei:change/tei:respStmt[tei:resp='editor'][1]/tei:name"/>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:variable>
  <xsl:sequence select="$result"/>
  </xsl:function>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Process element editor in "editor" mode"</desc>
   </doc>
  <xsl:template match="tei:editor" mode="editor">
    <xsl:apply-templates select="*[not(self::tei:email or self::tei:affiliation)]|text()"/>
    <xsl:choose>
      <xsl:when test="count(following-sibling::tei:editor)=1">
	<xsl:if test="count(preceding-sibling::tei:editor)&gt;1">
	  <xsl:text>,</xsl:text>
	</xsl:if>
	<xsl:text> </xsl:text>
	<xsl:sequence select="tei:i18n('and')"/>
	<xsl:text> </xsl:text>
      </xsl:when>
      <xsl:when test="following-sibling::tei:editor">, </xsl:when>
    </xsl:choose>
  </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Process element q</desc>
   </doc>
   <xsl:template match="tei:q|tei:said">
     <xsl:if test="@type='lemma'">
       <xsl:text>{\color{</xsl:text>
       <xsl:value-of select="$lemmaColor"/>
       <xsl:text>}</xsl:text>
     </xsl:if>
     <xsl:choose>
       <xsl:when test="not(tei:isInline(.))">
	 <xsl:text>&#10;\begin{</xsl:text><xsl:value-of select="$quoteEnv"/><xsl:text>}</xsl:text>
	 <xsl:apply-templates/>
	 <xsl:text>\end{</xsl:text><xsl:value-of select="$quoteEnv"/><xsl:text>}&#10;</xsl:text>
       </xsl:when>
       <xsl:otherwise>
	 <xsl:call-template name="makeQuote"/>
       </xsl:otherwise>
     </xsl:choose>
     <xsl:if test="@type='lemma'">
       <xsl:text>}</xsl:text>
       <xsl:if test="following::node()[1][
		     self::text() and
		     matches(self::text(), '^[^\s ]')]">
	 <xsl:text></xsl:text>
       </xsl:if>
     </xsl:if>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Process element emph</desc>
   </doc>
   <xsl:template match="tei:emph">
     <xsl:choose>
       <xsl:when test="contains(concat(@rend, ',', @style), 'bold')">
	 <xsl:text>\textbf{</xsl:text>
       </xsl:when>
       <xsl:otherwise>
	 <xsl:text>\emph{</xsl:text>
       </xsl:otherwise>
     </xsl:choose>
     <xsl:apply-templates/>
     <xsl:text>}</xsl:text>
   </xsl:template>
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Process element choice</desc>
   </doc>
   <xsl:template match="tei:choice">
     <xsl:choose>
       <xsl:when test="$ledmac='true' and (ancestor::tei:p or ancestor::tei:lg)">
	 <xsl:text>\edtext{}{</xsl:text>
	 <xsl:text>\lemma{</xsl:text>
	 <xsl:call-template name="guessLemma"/>
	 <xsl:text>}\Afootnote{{\rmlatinfont Correction: }</xsl:text>
	 <xsl:apply-templates/>
	 <xsl:text>}}</xsl:text>
       </xsl:when>
       <xsl:otherwise>
	 <xsl:text>{\rmlatinfont Correction: }</xsl:text>
	 <xsl:apply-templates/>
       </xsl:otherwise>
     </xsl:choose>
   </xsl:template>

   <xsl:template match="tei:sic">
     <xsl:apply-templates />
     <xsl:text> {\rmlatinfont (sic!)}</xsl:text>
   </xsl:template>

   <xsl:template match="tei:corr">
     <xsl:variable name="resp">
       <xsl:choose>
       <xsl:when test="@resp">
	 <xsl:value-of select="@resp" />
       </xsl:when>
       <xsl:when test="parent::tei:choice[@resp]">
	 <!-- feeble attempt to follow an internal link -->
	 <xsl:choose>
	   <xsl:when test="//*[@xml:id=substring-after(parent::tei:choice/@resp, '#')]">
	     <xsl:value-of select="//*[@xml:id=substring-after(parent::tei:choice/@resp, '#')][0]/text()"/>
	   </xsl:when>
	   <xsl:otherwise>
	     <xsl:value-of select="substring-after(parent::tei:choice/@resp, '#')"/>
	   </xsl:otherwise>
	 </xsl:choose>
       </xsl:when>
       <xsl:otherwise>
	 <xsl:text>encoder</xsl:text>
       </xsl:otherwise>
     </xsl:choose>
     </xsl:variable>
     <xsl:if test="preceding-sibling::tei:*">
       <xsl:text>; </xsl:text>
     </xsl:if>
     <xsl:apply-templates />
     <xsl:text> {\rmlatinfont (corr by </xsl:text>
     <xsl:call-template name="makeExternalLink">
       <xsl:with-param name="dest" select="$resp"/>
     </xsl:call-template>
     <xsl:text>)}</xsl:text>
   </xsl:template>

   <xsl:template name="guessLemma">
     <xsl:choose>
       <xsl:when test="tokenize(normalize-space(ancestor-or-self::tei:note/preceding-sibling::text()[1]), '\W+')[last()]">
	 <xsl:value-of select="tokenize(normalize-space(ancestor-or-self::tei:note/preceding-sibling::text()[1]), '\W+')[last()]"/>
       </xsl:when>
       <xsl:when test="tokenize(normalize-space(ancestor-or-self::note/following-sibling::text()[1]), '\W+')[1]">
	 <xsl:value-of select="tokenize(normalize-space(ancestor-or-self::note/following-sibling::text()[1]), '\W+')[1]"/>
       </xsl:when>
       <xsl:otherwise>
	 <xsl:text>*</xsl:text>
       </xsl:otherwise>
     </xsl:choose>
   </xsl:template>

</xsl:stylesheet>

