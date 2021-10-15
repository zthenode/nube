<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-c-class.xsl                          -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 9/9/2004                                         -->
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

<xsl:param name="hyde_form_title" select="'Create Sharp C Class'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'/sharp/t/c-class-h.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>
<xsl:param name="hyde_form_file" select="''"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_class_parameters                           -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_class_parameters">
    <xsl:param name="class" select="''"/>
    <xsl:param name="extends" select="''"/>
    <xsl:param name="function" select="''"/>
    <xsl:param name="function_return" select="''"/>
    <xsl:param name="function_parameters" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'C Class Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Class'"/>
        <xsl:with-param name="name" select="'class'"/>
        <xsl:with-param name="value" select="$class"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Extendes'"/>
        <xsl:with-param name="name" select="'extends'"/>
        <xsl:with-param name="value" select="$extends"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Function'"/>
        <xsl:with-param name="name" select="'function'"/>
        <xsl:with-param name="value" select="$function"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Return'"/>
        <xsl:with-param name="name" select="'result'"/>
        <xsl:with-param name="value" select="$function_return"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameters'"/>
        <xsl:with-param name="name" select="'parameters'"/>
        <xsl:with-param name="value" select="$function_parameters"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters">
        <xsl:with-param name="file" select="$hyde_form_file"/>
    </xsl:call-template>
    <xsl:call-template name="form_class_parameters"/>
    <xsl:call-template name="form_file_parameters"/>
    <xsl:call-template name="form_form_parameters">
        <xsl:with-param name="form_action" select="$hyde_form_action"/>
    </xsl:call-template>
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
