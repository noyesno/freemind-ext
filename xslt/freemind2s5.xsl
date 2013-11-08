<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
<xsl:param name="theme">vendor/s5/ui/default</xsl:param>

<xsl:template match="/">
<!-- !DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <xsl:choose>
    <xsl:when test="/map/node">
      <title><xsl:value-of select="/map/node/@TEXT" /></title>
    </xsl:when>
    <xsl:otherwise>
      <title>FreeMind2S5</title>
    </xsl:otherwise>
  </xsl:choose>
<meta name="version" content="S5 1.1" />

<xsl:element name="link">
  <xsl:attribute name="rel">stylesheet</xsl:attribute>
  <xsl:attribute name="href"><xsl:value-of select="$theme"/>/slides.css</xsl:attribute>
  <xsl:attribute name="type">text/css</xsl:attribute>
  <xsl:attribute name="media">projection</xsl:attribute>
  <xsl:attribute name="id">slideProj</xsl:attribute>
</xsl:element>

<xsl:element name="link">
  <xsl:attribute name="rel">stylesheet</xsl:attribute>
  <xsl:attribute name="href"><xsl:value-of select="$theme"/>/outline.css</xsl:attribute>
  <xsl:attribute name="type">text/css</xsl:attribute>
  <xsl:attribute name="media">screen</xsl:attribute>
  <xsl:attribute name="id">outlineStyle</xsl:attribute>
</xsl:element>

<xsl:element name="link">
  <xsl:attribute name="rel">stylesheet</xsl:attribute>
  <xsl:attribute name="href"><xsl:value-of select="$theme"/>/print.css</xsl:attribute>
  <xsl:attribute name="type">text/css</xsl:attribute>
  <xsl:attribute name="media">print</xsl:attribute>
  <xsl:attribute name="id">slidePrint</xsl:attribute>
</xsl:element>

<xsl:element name="link">
  <xsl:attribute name="rel">stylesheet</xsl:attribute>
  <xsl:attribute name="href"><xsl:value-of select="$theme"/>/opera.css</xsl:attribute>
  <xsl:attribute name="type">text/css</xsl:attribute>
  <xsl:attribute name="media">projection</xsl:attribute>
  <xsl:attribute name="id">operaFix</xsl:attribute>
</xsl:element>

<xsl:element name="script">
  <xsl:attribute name="src"><xsl:value-of select="$theme"/>/../default/slides.js</xsl:attribute>
  <xsl:attribute name="type">text/javascript</xsl:attribute>
</xsl:element>

<script src="ui/default/slides.js" type="text/javascript"></script>

</head>
<body>
<div class="layout">
  <div id="controls"></div>
  <div id="currentSlide"></div>
  <div id="header">[any header content]</div>
  <div id="footer">[any footer content]</div>
</div>

<div class="presentation">
  <div class="slide">
    <h1><xsl:value-of select="/map/node/@TEXT"/></h1>
    <div class="slidecontent">
    [sub title]
    </div>
    <xsl:if test="hook">
    <div class="handout">
    <xsl:apply-templates select="hook" mode="notes"/>
    </div>
    </xsl:if>
  </div>
  <xsl:apply-templates select="/map/node/node"/>
</div>
</body>
</html>
</xsl:template>

<xsl:template match="/map/node/node">
  <div class="slide">
    <h1><xsl:value-of select="@TEXT" /></h1>
    <div class="slidecontent">
      <ul class="incremental">
        <xsl:apply-templates select="node" mode="content"/>
      </ul>
    </div>
    <xsl:if test="hook">
    <div class="handout">
    <xsl:apply-templates select="hook" mode="notes"/>
    </div>
    </xsl:if>
  </div>
</xsl:template>

<xsl:template match="node" mode="content">
<li>
  <xsl:value-of select="@TEXT" />
  <xsl:choose>
    <xsl:when test="node">
  <ul>
  <xsl:apply-templates select="node" mode="content"/>
  </ul>
    </xsl:when>
  </xsl:choose>
</li>
</xsl:template>

<xsl:template match="hook[@NAME='accessories/plugins/NodeNote.properties']" mode="notes">
  <xsl:choose>
    <xsl:when test="./text">
	  <xsl:value-of select="./text"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
