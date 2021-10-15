<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: cmain-cxx.xsl                                    -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 11/1/2004                                        -->
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

<xsl:param name="hyde_form_title" select="'Create cMain C++ Class'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'cmain-cxx.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_cmain_parameters                           -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_cmain_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'cMain Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Name'"/>
        <xsl:with-param name="name" select="'main_name'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Args (c:Name;...)'"/>
        <xsl:with-param name="name" select="'main_args'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_cmain_parameters"/>
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
