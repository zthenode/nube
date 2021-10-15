<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-tar-subdirs.xsl                      -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 11/15/2005                                       -->
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

<xsl:param name="hyde_form_title" select="'Create TAR Subdirs'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'tar-subdirs-cmd.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'TAR Subdirs Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Path'"/>
        <xsl:with-param name="name" select="'path'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Source'"/>
        <xsl:with-param name="name" select="'source'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Target'"/>
        <xsl:with-param name="name" select="'target'"/>
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
