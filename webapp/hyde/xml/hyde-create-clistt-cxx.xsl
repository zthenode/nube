<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-clistt-cxx.xsl                       -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 11/22/2004                                       -->
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
<xsl:include href="hyde-create-cxx-parameters.xsl"/>

<xsl:param name="hyde_form_title" select="'Create cListT C++ Class'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'clistt-cxx.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<xsl:variable name="list_types_tree">
	<list-type>Dynamic</list-type>
	<list-type>Static</list-type>
	<list-type>no</list-type>
</xsl:variable>

<xsl:variable name="list_types"
 select="exsl:node-set($list_types_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'cListT Class Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="form_cxx_parameters">
        <xsl:with-param name="is_section" select="'no'"/>
        <xsl:with-param name="is_param_" select="'no'"/>
        <xsl:with-param name="is_param_include" select="'yes'"/>
	</xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'list_type'"/>
        <xsl:with-param name="option" select="$list_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
	<xsl:call-template name="input_row">
		<xsl:with-param name="text" select="'Of'"/>
		<xsl:with-param name="name" select="'of'"/>
	</xsl:call-template>
	<xsl:call-template name="input_row">
		<xsl:with-param name="text" select="'Has'"/>
		<xsl:with-param name="name" select="'has'"/>
	</xsl:call-template>
	<xsl:call-template name="yesno_row">
		<xsl:with-param name="text" select="'Item'"/>
		<xsl:with-param name="value" select="'yes'"/>
		<xsl:with-param name="name" select="'item'"/>
	</xsl:call-template>
	<xsl:call-template name="input_row">
		<xsl:with-param name="name" select="'item_name'"/>
		<xsl:with-param name="value" select="''"/>
	</xsl:call-template>
	<xsl:call-template name="yesno_row">
		<xsl:with-param name="text" select="'List'"/>
		<xsl:with-param name="value" select="'yes'"/>
		<xsl:with-param name="name" select="'list'"/>
	</xsl:call-template>
	<xsl:call-template name="input_row">
		<xsl:with-param name="name" select="'list_name'"/>
		<xsl:with-param name="value" select="''"/>
	</xsl:call-template>
    <xsl:call-template name="form_cxx_parameters">
        <xsl:with-param name="is_section" select="'no'"/>
        <xsl:with-param name="is_param_" select="'no'"/>
        <xsl:with-param name="is_param_class" select="'yes'"/>
        <xsl:with-param name="is_param_extends" select="'yes'"/>
        <xsl:with-param name="is_param_constructor" select="'yes'"/>
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
