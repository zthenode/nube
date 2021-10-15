<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: xml.xml                                          -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 9/5/2004                                         -->
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

<xsl:include href="hyde-java-form.xsl"/>

<xsl:param name="hyde_form_title" select="'Create Java Servlet'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'../t/java-servlet.t'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Variables                                                -->
<!--                                                          -->
<!--==========================================================-->
<xsl:variable name="servlet_methods_tree">
    <servlet-method>doPost</servlet-method>
    <servlet-method>doGet</servlet-method>
</xsl:variable>

<xsl:variable name="servlet_methods"
 select="exsl:node-set($servlet_methods_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_servlet_parameters                         -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_servlet_parameters">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Java Servlet Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="set_row">
        <xsl:with-param name="text" select="'Methods'"/>
        <xsl:with-param name="option" select="$servlet_methods/*"/>
    </xsl:call-template>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
    <xsl:call-template name="form_creation_parameters"/>
    <xsl:call-template name="form_servlet_parameters"/>
    <xsl:call-template name="form_java_parameters">
        <xsl:with-param name="import_java" select="'io.*;text.*;util.*;net.*'"/>
        <xsl:with-param name="import_javax" select="'servlet.*;servlet.http.*'"/>
        <xsl:with-param name="class" select="'Servlet'"/>
        <xsl:with-param name="extends" select="'HttpServlet'"/>
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
