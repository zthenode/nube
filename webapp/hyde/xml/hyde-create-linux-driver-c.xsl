<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-linux-driver-c.xsl                   -->
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

<xsl:param name="hyde_form_title" select="'Create Linux Driver'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'linux-driver.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<xsl:variable name="linux_driver_type_tree">
	<type>character</type>
	<type>block</type>
</xsl:variable>

<xsl:variable name="linux_driver_type"
 select="exsl:node-set($linux_driver_type_tree)"/>

<xsl:variable name="linux_driver_part_tree">
	<part>c</part>
	<part>h</part>
	<part>makefile</part>
	<part>device</part>
	<part>daemon</part>
</xsl:variable>

<xsl:variable name="linux_driver_part"
 select="exsl:node-set($linux_driver_part_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_linux_driver_parameters                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_linux_driver_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Linux Driver Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'part'"/>
        <xsl:with-param name="option" select="$linux_driver_part/*"/>
        <xsl:with-param name="default" select="'c'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Type'"/>
        <xsl:with-param name="name" select="'type'"/>
        <xsl:with-param name="option" select="$linux_driver_type/*"/>
        <xsl:with-param name="default" select="'character'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Loadable Module'"/>
        <xsl:with-param name="name" select="'module'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'open'"/>
        <xsl:with-param name="name" select="'open'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'ioctl'"/>
        <xsl:with-param name="name" select="'ioctl'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'ioctl magic'"/>
        <xsl:with-param name="name" select="'magic'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'reset ioctl'"/>
        <xsl:with-param name="name" select="'reset'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'PCI Vendor ID (Hex)'"/>
        <xsl:with-param name="name" select="'pci_vendor'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'PCI Device ID (Hex)'"/>
        <xsl:with-param name="name" select="'pci_device'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_linux_driver_parameters"/>
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
