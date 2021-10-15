<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-enum-cxx.xsl                         -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 3/17/2005                                        -->
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

<xsl:param name="hyde_form_title" select="'Create C/C++ Enum'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'../t/enum-cxx.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_enum_parameters                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_enum_parameters">

    <xsl:param name="enum_prefix" select="''"/>
    <xsl:param name="enum_name" select="''"/>
    <xsl:param name="enum_fields1" select="''"/>
    <xsl:param name="enum_fields2" select="''"/>
    <xsl:param name="enum_fields3" select="''"/>
    <xsl:param name="enum_fields4" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Enum Parameters'"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Prefix'"/>
        <xsl:with-param name="name" select="'enum_prefix'"/>
        <xsl:with-param name="value" select="$enum_prefix"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Name'"/>
        <xsl:with-param name="name" select="'enum_name'"/>
        <xsl:with-param name="value" select="$enum_name"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Author'"/>
        <xsl:with-param name="name" select="'enum_author'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Date'"/>
        <xsl:with-param name="name" select="'enum_date'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'_BM'"/>
        <xsl:with-param name="name" select="'enum_bm'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'_BS'"/>
        <xsl:with-param name="name" select="'enum_bs'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'_BV'"/>
        <xsl:with-param name="name" select="'enum_bv'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Fields'"/>
        <xsl:with-param name="name" select="'enum_fields1'"/>
        <xsl:with-param name="value" select="$enum_fields1"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'enum_fields2'"/>
        <xsl:with-param name="value" select="$enum_fields2"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'enum_fields3'"/>
        <xsl:with-param name="value" select="$enum_fields3"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'enum_fields4'"/>
        <xsl:with-param name="value" select="$enum_fields4"/>
    </xsl:call-template>

</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_enum_parameters"/>
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
