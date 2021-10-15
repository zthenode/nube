<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-makefile.xsl                         -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 10/6/2005                                        -->
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

<xsl:param name="hyde_form_what" select="'Makefile'"/>
<xsl:param name="hyde_form_title" select="$hyde_form_what"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'makefile.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_makefile_parameters                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_makefile_parameters">
    <xsl:param name="what" select="'Makefile'"/>
    <xsl:param name="text" select="'Parameters'"/>
    <xsl:param name="target" select="''"/>
    <xsl:param name="sources" select="''"/>
    <xsl:param name="defines" select="''"/>
    <xsl:param name="includes" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text">
            <xsl:value-of select="$what"/>
            <xsl:if test="'' != $what">
                <xsl:value-of select="' '"/>
            </xsl:if>
            <xsl:value-of select="$text"/>
        </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Target'"/>
        <xsl:with-param name="name" select="'target'"/>
        <xsl:with-param name="value" select="$target"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Sources'"/>
        <xsl:with-param name="name" select="'sources'"/>
        <xsl:with-param name="value" select="$sources"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Includes'"/>
        <xsl:with-param name="name" select="'includes'"/>
        <xsl:with-param name="value" select="$includes"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Defines'"/>
        <xsl:with-param name="name" select="'defines'"/>
        <xsl:with-param name="value" select="$defines"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_makefile_parameters">
        <xsl:with-param name="what" select="$hyde_form_what"/>
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
