<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-h-form.xsl                                  -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 7/30/2005                                        -->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xalan="http://xml.apache.org/xalan"
 xmlns:exsl="http://exslt.org/common"
 exclude-result-prefixes="xalan"
 version="1.0">

<xsl:output
 method="html"
 indent="yes"/>

<xsl:include href="hyde-form.xsl"/>

<xsl:variable name="struct_types_tree">
    <struct-type>union</struct-type>
    <struct-type>struct</struct-type>
</xsl:variable>

<xsl:variable name="struct_types"
 select="exsl:node-set($struct_types_tree)"/>

<xsl:variable name="packed_sizes_tree">
	<packed-size>1</packed-size>
	<packed-size>2</packed-size>
	<packed-size>4</packed-size>
	<packed-size>8</packed-size>
	<packed-size>unpacked</packed-size>
</xsl:variable>

<xsl:variable name="packed_sizes"
 select="exsl:node-set($packed_sizes_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_h_fields                                   -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_h_fields">
    <xsl:param name="text" select="'H File Parameters'"/>

    <xsl:if test="$text">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="$text"/>
    </xsl:call-template>
    </xsl:if>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Module'"/>
        <xsl:with-param name="name" select="'module'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Include'"/>
        <xsl:with-param name="name" select="'include'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'If Defined'"/>
        <xsl:with-param name="name" select="'ifdef'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Enums'"/>
        <xsl:with-param name="name" select="'enums'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Structs'"/>
        <xsl:with-param name="name" select="'structs'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'union'"/>
        <xsl:with-param name="option" select="$struct_types/*"/>
        <xsl:with-param name="default" select="'struct'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'packed'"/>
        <xsl:with-param name="option" select="$packed_sizes/*"/>
        <xsl:with-param name="default" select="'unpacked'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Variables'"/>
        <xsl:with-param name="name" select="'variables'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Functions'"/>
        <xsl:with-param name="name" select="'functions'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Return'"/>
        <xsl:with-param name="name" select="'return'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameters'"/>
        <xsl:with-param name="name" select="'parameters'"/>
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
