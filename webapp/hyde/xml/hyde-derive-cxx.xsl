<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-derive-cxx.xsl                              -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 1/7/2006                                         -->
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
<xsl:include href="hyde-create-cxx-parameters.xsl"/>

<xsl:param name="hyde_form_title">
    <xsl:value-of select="'Create Derived '"/>
    <xsl:value-of select="$form_cxx_param_is"/>
    <xsl:value-of select="' C++ Class'"/>
</xsl:param>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>

<xsl:param name="hyde_form_action">
    <xsl:variable name="is_class" 
     select="hyde:config/hyde:classes/hyde:language['cxx' = @name]/hyde:class[$form_cxx_param_is = @name]"/>
    <xsl:variable name="is_class_location" 
     select="$is_class/hyde:template/@location"/>

    <xsl:choose>
        <xsl:when test="'' != $is_class_location">
            <xsl:value-of select="$is_class_location"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="'../t/hxx.t'"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:param>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_derive_cxx_parameters                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_derive_cxx_parameters">
    <xsl:param name="section_text">
        <xsl:value-of select="'Derived '"/>
        <xsl:value-of select="$form_cxx_param_is"/>
        <xsl:value-of select="' C++ Class Parameters'"/>
    </xsl:param>

    <xsl:call-template name="form_cxx_parameters">
        <xsl:with-param name="section_text" select="$section_text"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_derive_cxx_parameters"/>
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
