<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-wsdl.xsl                             -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 12/31/2005                                       -->
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

<xsl:param name="hyde_form_title" select="'Create WSDL File'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'wsdl.xsl'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template wsdl_form_fields                                -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="wsdl_form_fields">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'WSDL Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Service Location'"/>
        <xsl:with-param name="name" select="'service_location'"/>
        <xsl:with-param name="value" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Service Name'"/>
        <xsl:with-param name="name" select="'service_name'"/>
        <xsl:with-param name="value" select="'service'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Operation Name'"/>
        <xsl:with-param name="name" select="'operation_name'"/>
        <xsl:with-param name="value" select="'operation'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Result Type'"/>
        <xsl:with-param name="name" select="'result_type'"/>
        <xsl:with-param name="value" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Result Name'"/>
        <xsl:with-param name="name" select="'result_name'"/>
        <xsl:with-param name="value" select="'result'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameter Type'"/>
        <xsl:with-param name="name" select="'parameter_type'"/>
        <xsl:with-param name="value" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameter Name'"/>
        <xsl:with-param name="name" select="'parameter_name'"/>
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
    <xsl:call-template name="wsdl_form_fields"/>
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
