<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-form.xsl                                    -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 8/28/2004                                        -->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:hyde="http://Hydra-Development-Environment"
 xmlns:xalan="http://xml.apache.org/xalan"
 xmlns:exsl="http://exslt.org/common"
 exclude-result-prefixes="hyde xalan"
 version="1.0">

<xsl:param name="border" select="'0'"/>

<xsl:param name="hyde_default_form_bgcolor" select="'gray'"/>
<xsl:param name="hyde_default_form_header_bgcolor" select="'white'"/>
<xsl:param name="hyde_default_form_section_bgcolor" select="'green'"/>

<xsl:param name="hyde_default_form_font_face" select="'arial'"/>
<xsl:param name="hyde_default_form_font_size" select="'2'"/>
<xsl:param name="hyde_default_form_font_color" select="'black'"/>

<xsl:param name="hyde_default_form_section_font_face" select="'arial'"/>
<xsl:param name="hyde_default_form_section_font_size" select="'3'"/>
<xsl:param name="hyde_default_form_section_font_color" select="'green'"/>

<xsl:param name="hyde_default_form_header_font_face" select="'arial'"/>
<xsl:param name="hyde_default_form_header_font_size" select="'3'"/>
<xsl:param name="hyde_default_form_header_font_color" select="'green'"/>

<xsl:param name="hyde_default_form_input_size" select="'32'"/>

<xsl:variable name="hyde_form_bgcolor">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/@bgcolor"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_bgcolor"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_header_bgcolor">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-header/@bgcolor"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_header_bgcolor"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_section_bgcolor">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-sections/@bgcolor"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_section_bgcolor"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="hyde_form_font_face">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:font/@face"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_font_face"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_font_size">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:font/@size"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_font_size"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_font_color">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:font/@color"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_font_color"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="hyde_form_section_font_face">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-sections/hyde:font/@face"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_section_font_face"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_section_font_size">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-sections/hyde:font/@size"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_section_font_size"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_section_font_color">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-sections/hyde:font/@color"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_section_font_color"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="hyde_form_header_font_face">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-header/hyde:font/@face"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_header_font_face"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_header_font_size">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-header/hyde:font/@size"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_header_font_size"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
<xsl:variable name="hyde_form_header_font_color">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:form-header/hyde:font/@color"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_header_font_color"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="hyde_form_input_size">
    <xsl:variable name="select" select="/hyde:config/hyde:folders/hyde:forms/hyde:input/@size"/>
    <xsl:choose>
        <xsl:when test="'' != $select">
            <xsl:value-of select="$select"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$hyde_default_form_input_size"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="hyde_document_types_tree">
	<hyde:document-type>html</hyde:document-type>
	<hyde:document-type>xml</hyde:document-type>
	<hyde:document-type>text</hyde:document-type>
</xsl:variable>

<xsl:variable name="hyde_document_types_tree2">
	<hyde:document-type>makefile</hyde:document-type>
	<hyde:document-type>makefilex</hyde:document-type>
</xsl:variable>

<xsl:variable name="hyde_document_types"
 select="exsl:node-set($hyde_document_types_tree)"/>

<xsl:variable name="hyde_document_types2"
 select="exsl:node-set($hyde_document_types_tree2)"/>

<xsl:param name="hyde_form_default_document_type" select="'xml'"/>

<xsl:variable name="hyde_template_types_tree">
	<hyde:document-type>html</hyde:document-type>
	<hyde:document-type>xml</hyde:document-type>
	<hyde:template-type>xsl</hyde:template-type>
	<hyde:template-type>xtl</hyde:template-type>
	<hyde:template-type>dt</hyde:template-type>
	<hyde:template-type>t</hyde:template-type>
</xsl:variable>

<xsl:variable name="hyde_template_types"
 select="exsl:node-set($hyde_template_types_tree)"/>

<xsl:param name="hyde_form_default_template_type" select="'xsl'"/>

<xsl:variable name="hyde_output_types_tree">
	<hyde:output-type>html</hyde:output-type>
	<hyde:output-type>xml</hyde:output-type>
	<hyde:output-type>text</hyde:output-type>
</xsl:variable>

<xsl:variable name="hyde_output_types"
 select="exsl:node-set($hyde_output_types_tree)"/>

<xsl:variable name="hyde_content_types_tree">
	<hyde:content-type>text/html</hyde:content-type>
	<hyde:content-type>text/xml</hyde:content-type>
	<hyde:content-type>text/plain</hyde:content-type>
	<hyde:content-type>download</hyde:content-type>
</xsl:variable>

<xsl:variable name="hyde_content_types"
 select="exsl:node-set($hyde_content_types_tree)"/>

<xsl:variable name="xsl_output_methods_tree">
	<output-method>html</output-method>
	<output-method>xml</output-method>
	<output-method>text</output-method>
	<output-method>no</output-method>
</xsl:variable>

<xsl:variable name="xsl_output_methods"
 select="exsl:node-set($xsl_output_methods_tree)"/>

<xsl:variable name="xsl_template_types_tree">
	<template-type>match</template-type>
	<template-type>name</template-type>
</xsl:variable>

<xsl:variable name="xsl_template_types"
 select="exsl:node-set($xsl_template_types_tree)"/>

<xsl:variable name="hyde_xsl_parameters_tree">
	<parameter name="hyde_creation">creation</parameter>
	<parameter name="hyde_form">form</parameter>
	<parameter name="hyde_file">file</parameter>
	<parameter name="hyde_xslt">xslt</parameter>
</xsl:variable>

<xsl:variable name="hyde_xsl_parameters"
 select="exsl:node-set($hyde_xsl_parameters_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "hyde:config"                             -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="hyde:config" mode="hyde_form">
    <xsl:call-template name="form"/>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "*"                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="*" mode="hyde_form">
    <b>Unexpected document type "</b>
    <xsl:value-of select="name()"/>
    <b>"</b>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_hyde_xsl_parameters                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_hyde_xsl_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Hyde XSLT Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Title'"/>
        <xsl:with-param name="name" select="'hyde_title'"/>
    </xsl:call-template>
    <xsl:call-template name="set_row">
        <xsl:with-param name="text" select="'Sections'"/>
        <xsl:with-param name="option" select="$hyde_xsl_parameters/*"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'New Section'"/>
        <xsl:with-param name="name" select="'hyde_new_section'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Form Action'"/>
        <xsl:with-param name="name" select="'hyde_form_action'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Hyde Namespace'"/>
        <xsl:with-param name="name" select="'hnamespace'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Hyde Namespace URI'"/>
        <xsl:with-param name="name" select="'hnamespace_uri'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_xml_parameters                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_xml_parameters">
    <xsl:param name="section" select="'XML Parameters'"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="$section"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'XML Version'"/>
        <xsl:with-param name="name" select="'version'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Namespace'"/>
        <xsl:with-param name="name" select="'namespace'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Namespace URI'"/>
        <xsl:with-param name="name" select="'namespace_uri'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Document'"/>
        <xsl:with-param name="name" select="'document'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Elements'"/>
        <xsl:with-param name="name" select="'element'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_xsl_parameters                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_xsl_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'XSLT Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'XML Version'"/>
        <xsl:with-param name="name" select="'xml_version'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Version'"/>
        <xsl:with-param name="name" select="'version'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Namespace'"/>
        <xsl:with-param name="name" select="'namespace'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Namespace URI'"/>
        <xsl:with-param name="name" select="'namespace_uri'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Ext Namespace'"/>
        <xsl:with-param name="name" select="'ext_namespace'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Ext Namespace URI'"/>
        <xsl:with-param name="name" select="'ext_namespace_uri'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Exclude Prefixes'"/>
        <xsl:with-param name="name" select="'exclude_prefixes'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Output Method'"/>
        <xsl:with-param name="name" select="'output_method'"/>
        <xsl:with-param name="option" select="$xsl_output_methods/*"/>
        <xsl:with-param name="default" select="'html'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Output Indent'"/>
        <xsl:with-param name="name" select="'output_indent'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Output Version'"/>
        <xsl:with-param name="name" select="'output_version'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Include'"/>
        <xsl:with-param name="name" select="'include'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameters'"/>
        <xsl:with-param name="name" select="'parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Variables'"/>
        <xsl:with-param name="name" select="'variables'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Template Mode'"/>
        <xsl:with-param name="name" select="'template_mode'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Template'"/>
        <xsl:with-param name="name" select="'template_name'"/>
        <xsl:with-param name="value" select="'*'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'template_type'"/>
        <xsl:with-param name="option" select="$xsl_template_types/*"/>
        <xsl:with-param name="default" select="'match'"/>
    </xsl:call-template>
</xsl:template>

<xsl:param name="form_creation_parameter_section_text" select="'Creation Parameters'"/>
<xsl:param name="form_creation_parameter_document_file" select="''"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_creation_parameters                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_creation_parameters">
    <xsl:param name="section_text" select="$form_creation_parameter_section_text"/>
    <xsl:param name="document_file" select="$form_creation_parameter_document_file"/>
    <xsl:param name="template_file" select="''"/>
    <xsl:param name="file" select="''"/>
    <xsl:param name="is_download" select="''"/>
    <xsl:param name="content_type" select="''"/>
    <xsl:param name="is_document_types2" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="$section_text"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Document Type'"/>
        <xsl:with-param name="name" select="'document_type'"/>
        <xsl:with-param name="option" select="$hyde_document_types/*"/>
        <xsl:with-param name="default" select="$hyde_form_default_document_type"/>
    </xsl:call-template>
    <xsl:if test="$is_document_types2">
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'document_type'"/>
        <xsl:with-param name="option" select="$hyde_document_types2/*"/>
    </xsl:call-template>
    </xsl:if>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Document File'"/>
        <xsl:with-param name="name" select="'document_file'"/>
        <xsl:with-param name="value" select="$document_file"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Template Type'"/>
        <xsl:with-param name="name" select="'template_type'"/>
        <xsl:with-param name="option" select="$hyde_template_types/*"/>
        <xsl:with-param name="default" select="$hyde_form_default_template_type"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Template File'"/>
        <xsl:with-param name="name" select="'template_file'"/>
        <xsl:with-param name="value" select="$template_file"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Output Type'"/>
        <xsl:with-param name="name" select="'output_type'"/>
        <xsl:with-param name="option" select="$hyde_output_types/*"/>
        <xsl:with-param name="default" select="$hyde_form_default_output_type"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Output File'"/>
        <xsl:with-param name="name" select="'file'"/>
        <xsl:with-param name="value" select="$file"/>
    </xsl:call-template>
    <xsl:choose>
        <xsl:when test="'yes'=$is_download">
            <xsl:call-template name="yesno_row">
                <xsl:with-param name="text" select="'Download'"/>
                <xsl:with-param name="name" select="'content_type'"/>
                <xsl:with-param name="yes_value" select="'download'"/>
                <xsl:with-param name="no_value" select="''"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="enum_row">
                <xsl:with-param name="text" select="'Content Type'"/>
                <xsl:with-param name="name" select="'content_type'"/>
                <xsl:with-param name="value" select="$content_type"/>
                <xsl:with-param name="option" select="$hyde_content_types/*"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_file_parameters                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_file_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'File Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Copyright'"/>
        <xsl:with-param name="name" select="'copyright'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Open Source'"/>
        <xsl:with-param name="name" select="'open_source'"/>
        <xsl:with-param name="default" select="'yes'"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_form_parameters                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_form_parameters">
    <xsl:param name="form_action" select="''"/>
    <xsl:param name="is_command" select="''"/>
    <xsl:param name="command" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Form Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Method'"/>
        <xsl:with-param name="name" select="'form_method'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Action'"/>
        <xsl:with-param name="name" select="'form_action'"/>
        <xsl:with-param name="value" select="$form_action"/>
    </xsl:call-template>
    <xsl:if test="$is_command">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Command'"/>
        <xsl:with-param name="name" select="'command'"/>
        <xsl:with-param name="value" select="$command"/>
    </xsl:call-template>
    </xsl:if>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form">

<xsl:variable name="image" select="hyde:folders/hyde:forms/hyde:images/hyde:image"/>
<xsl:variable name="top_left_image_width" select="$image['top_left' = @id]/@width"/>
<xsl:variable name="top_left_image_height" select="$image['top_left' = @id]/@height"/>
<xsl:variable name="top_left_image_location" select="$image['top_left' = @id]/@location"/>
<xsl:variable name="bottom_left_image_width" select="$image['bottom_left' = @id]/@width"/>
<xsl:variable name="bottom_left_image_height" select="$image['bottom_left' = @id]/@height"/>
<xsl:variable name="bottom_left_image_location" select="$image['bottom_left' = @id]/@location"/>
<xsl:variable name="top_right_image_width" select="$image['top_right' = @id]/@width"/>
<xsl:variable name="top_right_image_height" select="$image['top_right' = @id]/@height"/>
<xsl:variable name="top_right_image_location" select="$image['top_right' = @id]/@location"/>
<xsl:variable name="bottom_right_image_width" select="$image['bottom_right' = @id]/@width"/>
<xsl:variable name="bottom_right_image_height" select="$image['bottom_right' = @id]/@height"/>
<xsl:variable name="bottom_right_image_location" select="$image['bottom_right' = @id]/@location"/>

<html>
    <head>
        <script language="javaScript" src="hyde.js">
        </script>
    </head>
    <body>
        <form
         name="form"
         method="{$hyde_form_method}"
         action="{$hyde_form_action}"
         onsubmit="return setFormSubmit(getFormValue('form_action'),getFormValue('form_method'))">
            <table
             border="{$border}"
             bgcolor="{$hyde_form_header_bgcolor}"
             width="100%" cellspacing="0" cellpadding="0">
                <tr><td>
                    <font
                     face="{$hyde_form_header_font_face}"
                     size="{$hyde_form_header_font_size}"
                     color="{$hyde_form_header_font_color}">
                        <b><xsl:value-of select="$hyde_form_title"/></b>
                    </font>
                </td></tr>
                <tr><td>
                    <table
                     border="{$border}"
                     bgcolor="{$hyde_form_section_bgcolor}"
                     width="100%" cellspacing="0" cellpadding="0">
						<tr><td valign="top">
                            <table
                             border="{$border}"
							 width="100%" height="100%"
                             cellspacing="0" cellpadding="0">
                                <tr><td
                                     align="left"
                                     valign="top"
                                     width="{$top_left_image_width}"
                                     height="{$top_left_image_height}">
                                    <img src="{$top_left_image_location}"/>
                                </td></tr>
                                <!--tr><td
                                     align="left"
                                     valign="bottom"
                                     width="{$bottom_left_image_width}"
                                     height="{$bottom_left_image_height}">
                                    <img src="{$bottom_left_image_location}"/>
                                </td></tr-->
							</table>
						</td><td valign="middle">
                             <table
                              border="{$border}"
                              width="100%" height="100%"
                              cellspacing="0" cellpadding="10">
                                 <tr><td>
                                     <input type="submit" name="submit" value="{$hyde_form_submit}"/>
                                 </td></tr>
                             </table>
                        </td><td>
                            <table
                             border="{$border}"
							 width="100%"
                             cellspacing="0" cellpadding="0">
                                <xsl:call-template name="form_fields"/>
                            </table>
                        </td></tr>
                    </table>
                </td></tr>
            </table>
        </form>
    </body>
</html>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template section_row                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="section_row">

	<xsl:param name="bgcolor" select="$hyde_form_section_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_section_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_section_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_section_font_color"/>
	<xsl:param name="text" select="''"/>

	<tr valign="middle">
		   <td nowrap="yes" colspan="2" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<b><xsl:value-of select="$text"/></b>
			   </font>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template listbox_row                                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="listbox_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="name" select="'enum'"/>
	<xsl:param name="size" select="'2'"/>
	<xsl:param name="multiple" select="''"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			   <xsl:call-template name="listbox">
				   <xsl:with-param name="size" select="$size"/>
				   <xsl:with-param name="multiple" select="$multiple"/>
				   <xsl:with-param name="name" select="$name"/>
				   <xsl:with-param name="value" select="$value"/>
				   <xsl:with-param name="option" select="$option"/>
				   <xsl:with-param name="default" select="$default"/>
			   </xsl:call-template>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template dropbox_row                                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="dropbox_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="name" select="'enum'"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			   <xsl:call-template name="dropbox">
				   <xsl:with-param name="name" select="$name"/>
				   <xsl:with-param name="value" select="$value"/>
				   <xsl:with-param name="option" select="$option"/>
				   <xsl:with-param name="default" select="$default"/>
			   </xsl:call-template>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template input_row                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="input_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="name" select="'input'"/>
	<xsl:param name="value"/>
	<xsl:param name="size" select="$hyde_form_input_size"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			    <input
                 name="{$name}" 
                 size="{$size}"
                 type="text" 
                 value="{$value}"/>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template yesno_row                                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="yesno_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="name" select="'yesno'"/>
	<xsl:param name="value"/>
	<xsl:param name="yes" select="'yes'"/>
	<xsl:param name="no" select="'no'"/>
	<xsl:param name="yes_value" select="$yes"/>
	<xsl:param name="no_value" select="$no"/>
	<xsl:param name="default"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			   <xsl:call-template name="yesno">
				   <xsl:with-param name="name" select="$name"/>
				   <xsl:with-param name="value" select="$value"/>
				   <xsl:with-param name="yes" select="$yes"/>
				   <xsl:with-param name="no" select="$no"/>
				   <xsl:with-param name="yes_value" select="$yes_value"/>
				   <xsl:with-param name="no_value" select="$no_value"/>
				   <xsl:with-param name="default" select="$default"/>
			   </xsl:call-template>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template set_row                                         -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="set_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="option"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			   <xsl:call-template name="set">
				   <xsl:with-param name="option" select="$option"/>
			   </xsl:call-template>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template enum_row                                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="enum_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="name" select="'enum'"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			   <xsl:call-template name="enum">
				   <xsl:with-param name="name" select="$name"/>
				   <xsl:with-param name="value" select="$value"/>
				   <xsl:with-param name="option" select="$option"/>
				   <xsl:with-param name="default" select="$default"/>
			   </xsl:call-template>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template checkbox_row                                    -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="checkbox_row">

	<xsl:param name="bgcolor" select="$hyde_form_bgcolor"/>
	<xsl:param name="text_font_face" select="$hyde_form_font_face"/>
	<xsl:param name="text_font_size" select="$hyde_form_font_size"/>
	<xsl:param name="text_font_color" select="$hyde_form_font_color"/>
	<xsl:param name="text" select="''"/>
	<xsl:param name="option_text" select="''"/>
	<xsl:param name="name" select="'enum'"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

	<tr valign="middle">
		   <td nowrap="yes" bgcolor="{$bgcolor}" align="middle">
			   <font
                face="{$text_font_face}"
                size="{$text_font_size}"
                color="{$text_font_color}">
					<xsl:value-of select="$text"/>
			   </font>
		   </td>
		   <td bgcolor="{$bgcolor}" align="left">
			   <xsl:call-template name="checkbox">
				   <xsl:with-param name="name" select="$name"/>
				   <xsl:with-param name="value" select="$value"/>
				   <xsl:with-param name="option" select="$option"/>
				   <xsl:with-param name="text" select="$option_text"/>
				   <xsl:with-param name="default" select="$default"/>
			   </xsl:call-template>
		   </td>
	</tr>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template option_name                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="option_name">
    <xsl:param name="select" select="."/>

    <xsl:choose>
        <xsl:when test="'' != $select/@name">
            <xsl:value-of select="$select/@name"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$select"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template option_value                                    -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="option_value">
    <xsl:param name="select" select="."/>

    <xsl:choose>
        <xsl:when test="$select/@value">
            <xsl:value-of select="$select/@value"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$select"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template set                                             -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="set">

	<xsl:param name="option"/>
	<xsl:param name="yes" select="'yes'"/>

	<xsl:for-each select="$option">
        <xsl:variable name="option_name">
            <xsl:call-template name="option_name"/>
        </xsl:variable>
        <xsl:variable name="option_text" select="."/>

		<xsl:call-template name="checkbox">
			<xsl:with-param name="name" select="$option_name"/>
			<xsl:with-param name="option" select="$yes"/>
			<xsl:with-param name="text" select="$option_text"/>
		</xsl:call-template>
	</xsl:for-each>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template enum                                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="enum">

	<xsl:param name="name" select="'enum'"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

	<xsl:for-each select="$option">
        <xsl:variable name="option_value">
            <xsl:call-template name="option_value"/>
        </xsl:variable>
        <xsl:variable name="option_text" select="."/>

		<xsl:call-template name="radio">
			<xsl:with-param name="name" select="$name"/>
			<xsl:with-param name="value" select="$value"/>
			<xsl:with-param name="option" select="$option_value"/>
			<xsl:with-param name="text" select="$option_text"/>
		    <xsl:with-param name="default">
                <xsl:if test="(('' = $value) or ($option_value != $value)) and ($option_value = $default)">
                    <xsl:value-of select="'yes'"/>
                </xsl:if>
            </xsl:with-param>
		</xsl:call-template>
	</xsl:for-each>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template yesno                                           -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="yesno">

	<xsl:param name="name" select="'yesno'"/>
	<xsl:param name="value"/>
	<xsl:param name="yes" select="'yes'"/>
	<xsl:param name="no" select="'no'"/>
	<xsl:param name="yes_value" select="$yes"/>
	<xsl:param name="no_value" select="$no"/>
	<xsl:param name="default"/>

	<xsl:call-template name="radio">
		<xsl:with-param name="name" select="$name"/>
		<xsl:with-param name="value" select="$value"/>
		<xsl:with-param name="option" select="$yes_value"/>
		<xsl:with-param name="text" select="$yes"/>
		<xsl:with-param name="default">
            <xsl:if test="$yes_value = $default">
                <xsl:value-of select="'yes'"/>
            </xsl:if>
        </xsl:with-param>
	</xsl:call-template>
	<xsl:call-template name="radio">
		<xsl:with-param name="name" select="$name"/>
		<xsl:with-param name="value" select="$value"/>
		<xsl:with-param name="option" select="$no_value"/>
		<xsl:with-param name="text" select="$no"/>
		<xsl:with-param name="default">
            <xsl:if test="$no_value = $default">
                <xsl:value-of select="'yes'"/>
            </xsl:if>
        </xsl:with-param>
	</xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template listbox                                         -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="listbox">

	<xsl:param name="size" select="'2'"/>
	<xsl:param name="multiple" select="''"/>
	<xsl:param name="name" select="'listbox'"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

    <xsl:choose>
        <xsl:when test="'yes' = $multiple">
        <select name="{$name}" size="{$size}" multiple="">
            <xsl:call-template name="listbox_options">
                <xsl:with-param name="value" select="$value"/>
                <xsl:with-param name="option" select="$option"/>
                <xsl:with-param name="default" select="$default"/>
            </xsl:call-template>
        </select>
        </xsl:when>
        <xsl:otherwise>
        <select name="{$name}" size="{$size}">
            <xsl:call-template name="listbox_options">
                <xsl:with-param name="value" select="$value"/>
                <xsl:with-param name="option" select="$option"/>
                <xsl:with-param name="default" select="$default"/>
            </xsl:call-template>
        </select>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template listbox_options                                 -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="listbox_options">

	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

    <xsl:for-each select="$option">
	    <xsl:choose>
	        <xsl:when test="(text()=$value) or (@default='yes')">
		        <option value="{text()}" selected="">
                    <xsl:value-of select="text()"/>
                </option>
	        </xsl:when>
	        <xsl:otherwise>
		        <option value="{text()}">
                    <xsl:value-of select="text()"/>
                </option>
	        </xsl:otherwise>
	    </xsl:choose>
    </xsl:for-each>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template dropbox                                         -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="dropbox">

	<xsl:param name="name" select="'dropbox'"/>
	<xsl:param name="value"/>
	<xsl:param name="option"/>
	<xsl:param name="default"/>

    <select name="{$name}" size="1">
        <xsl:for-each select="$option">
	        <xsl:choose>
		        <xsl:when test="(text()=$value) or (@default='yes')">
			        <option value="{text()}" selected="">
                        <xsl:value-of select="text()"/>
                    </option>
		        </xsl:when>
		        <xsl:otherwise>
			        <option value="{text()}">
                        <xsl:value-of select="text()"/>
                    </option>
		        </xsl:otherwise>
	        </xsl:choose>
        </xsl:for-each>
    </select>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template radio                                           -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="radio">

	<xsl:param name="name" select="'radio'"/>
	<xsl:param name="value"/>
	<xsl:param name="text"/>
	<xsl:param name="option" select="'radio'"/>
	<xsl:param name="default"/>

	<xsl:choose>
		<xsl:when test="((''!=$value) and ($option=$value)) or ($default='yes')">
			<input type="radio" name="{$name}" value="{$option}" checked=""/>
		</xsl:when>
		<xsl:otherwise>
			<input type="radio" name="{$name}" value="{$option}"/>
		</xsl:otherwise>
	</xsl:choose>
    <xsl:value-of select="$text"/>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template checkbox                                        -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="checkbox">

	<xsl:param name="name" select="'checkbox'"/>
	<xsl:param name="value"/>
	<xsl:param name="text"/>
	<xsl:param name="option" select="'checkbox'"/>
	<xsl:param name="default"/>

	<xsl:choose>
		<xsl:when test="((''!=$value) and ($option=$value)) or ($default='yes')">
			<input type="checkbox" name="{$name}" value="{$option}" checked=""/>
		</xsl:when>
		<xsl:otherwise>
			<input type="checkbox" name="{$name}" value="{$option}"/>
		</xsl:otherwise>
	</xsl:choose>
    <xsl:value-of select="$text"/>
</xsl:template>

</xsl:stylesheet>
