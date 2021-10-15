<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-dt.xsl                               -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 12/12/2004                                       -->
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

<xsl:param name="hyde_form_title" select="'Create DT File'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'dt.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template dt_form_fields                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="dt_form_fields">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'DT Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Template Name'"/>
        <xsl:with-param name="name" select="'templates'"/>
        <xsl:with-param name="value" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameters'"/>
        <xsl:with-param name="name" select="'template_parameters'"/>
        <xsl:with-param name="value" select="''"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_file_parameters"/>
    <xsl:call-template name="dt_form_fields"/>
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
