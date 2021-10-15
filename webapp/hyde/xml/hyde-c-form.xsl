<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-c-form.xsl                                  -->
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
 exclude-result-prefixes="exsl xalan"
 version="1.0">

<xsl:output
 method="html"
 indent="yes"/>

<xsl:include href="hyde-h-form.xsl"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_c_fields                                   -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_c_fields">
    <xsl:param name="text" select="'C File Parameters'"/>

    <xsl:call-template name="form_h_fields">
        <xsl:with-param name="text" select="$text"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Static Variables'"/>
        <xsl:with-param name="name" select="'static_variables'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Static Functions'"/>
        <xsl:with-param name="name" select="'static_functions'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Static Result'"/>
        <xsl:with-param name="name" select="'static_result'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Static Parameters'"/>
        <xsl:with-param name="name" select="'static_parameters'"/>
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
