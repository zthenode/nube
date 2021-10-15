<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-module-c.xsl                         -->
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

<xsl:include href="hyde-c-form.xsl"/>

<xsl:param name="hyde_form_title" select="'Create C Module'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'../t/module-c.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<xsl:variable name="module_part_tree">
	<part>h</part>
	<part>c</part>
</xsl:variable>

<xsl:variable name="module_part"
 select="exsl:node-set($module_part_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'C Module Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'part'"/>
        <xsl:with-param name="option" select="$module_part/*"/>
        <xsl:with-param name="default" select="'c'"/>
    </xsl:call-template>
    <xsl:call-template name="form_c_fields">
        <xsl:with-param name="text" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="form_file_parameters"/>
    <xsl:call-template name="form_form_parameters"/>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "*"                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="*">

    <xsl:apply-templates select="." mode="hyde_form"/>
</xsl:template>

</xsl:stylesheet>
