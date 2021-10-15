<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-derived-cxx.xsl                      -->
<!--                                                          -->
<!-- Author: $author$                                         -->
<!--   Date: 1/7/2006, 10/13/2021                             -->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xalan="http://xml.apache.org/xalan"
 xmlns:hyde="http://Hydra-Development-Environment"
 xmlns:exsl="http://exslt.org/common"
 exclude-result-prefixes="xalan hyde"
 version="1.0">

<xsl:output
 method="html"
 indent="yes"
 version="yes"/>

<xsl:include href="hyde-form.xsl"/>

<xsl:param name="hyde_form_title" select="'Create Derived C++ Class'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'hyde-derive-cxx.xsl'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<xsl:variable name="is_classes_tree">
	<is_class>instance</is_class>
	<is_class>implement</is_class>
	<is_class>interface</is_class>
	<is_class>export</is_class>
	<is_class default="yes">no</is_class>
</xsl:variable>

<xsl:variable name="is_classes"
 select="exsl:node-set($is_classes_tree)"/>

<xsl:variable name="base_classes_tree">
    <xsl:for-each 
     select="hyde:config/hyde:classes/hyde:language['cxx' = @name]/hyde:class">
	    <base_class><xsl:value-of select="@name"/></base_class>
    </xsl:for-each>
	<base_class></base_class>
</xsl:variable>

<xsl:variable name="base_classes"
 select="exsl:node-set($base_classes_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_derived_cxx_parameters                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_derived_cxx_parameters">
    <xsl:param name="section" select="'Derived C++ Class Parameters'"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="$section"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'form_cxx_param_is_class'"/>
        <xsl:with-param name="option" select="$is_classes/is_class"/>
        <xsl:with-param name="default" select="$is_classes/is_class['yes' = @default]"/>
    </xsl:call-template>

    <xsl:call-template name="listbox_row">
        <xsl:with-param name="text" select="'Base Class'"/>
        <xsl:with-param name="name" select="'form_cxx_param_is'"/>
        <xsl:with-param name="option" select="$base_classes/base_class"/>
        <xsl:with-param name="default" select="$base_classes/base_class['yes' = @default]"/>
        <xsl:with-param name="size" select="'4'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters">
        <xsl:with-param name="document_file" select="'./hyde/xml/hyde.xml'"/>
        <xsl:with-param name="template_file" select="'./hyde/xml/hyde-derive-cxx.xsl'"/>
    </xsl:call-template>
    <xsl:call-template name="form_derived_cxx_parameters"/>
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
