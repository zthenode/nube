<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-windows-driver-c.xsl                 -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 7/27/2005                                        -->
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

<xsl:param name="hyde_form_title" select="'Create Windows Driver'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'windows-driver.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<xsl:variable name="windows_driver_part_tree">
	<part>c</part>
	<part>h</part>
	<part>ioctls</part>
	<part>sources</part>
</xsl:variable>

<xsl:variable name="windows_driver_part"
 select="exsl:node-set($windows_driver_part_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_windows_driver_parameters                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_windows_driver_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Windows Driver Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'part'"/>
        <xsl:with-param name="option" select="$windows_driver_part/*"/>
        <xsl:with-param name="default" select="'c'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Name'"/>
        <xsl:with-param name="name" select="'name'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'ioctl magic'"/>
        <xsl:with-param name="name" select="'magic'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'ioctl codes (name:code;...)'"/>
        <xsl:with-param name="name" select="'ioctls'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_windows_driver_parameters"/>
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
