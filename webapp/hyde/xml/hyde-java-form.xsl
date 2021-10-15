<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-java-form.xsl                               -->
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

<xsl:include href="hyde-form.xsl"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Variables                                                -->
<!--                                                          -->
<!--==========================================================-->
<xsl:variable name="function_access_types_tree">
	<function-access-type>public</function-access-type>
	<function-access-type>private</function-access-type>
	<function-access-type>protected</function-access-type>
	<function-access-type>no</function-access-type>
</xsl:variable>

<xsl:variable name="function_access_types"
 select="exsl:node-set($function_access_types_tree)"/>

<xsl:variable name="class_access_types_tree">
	<class-access-type>public</class-access-type>
	<class-access-type>private</class-access-type>
	<class-access-type>protected</class-access-type>
</xsl:variable>

<xsl:variable name="class_access_types"
 select="exsl:node-set($class_access_types_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_java_parameters                            -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_java_parameters">
    <xsl:param name="import_java" select="''"/>
    <xsl:param name="import_javax" select="''"/>
    <xsl:param name="import" select="''"/>
    <xsl:param name="class" select="'c'"/>
    <xsl:param name="extends" select="''"/>
    <xsl:param name="implements" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'Java Class Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Import java.'"/>
        <xsl:with-param name="name" select="'import_java'"/>
        <xsl:with-param name="value" select="$import_java"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Import javax.'"/>
        <xsl:with-param name="name" select="'import_javax'"/>
        <xsl:with-param name="value" select="$import_javax"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Import'"/>
        <xsl:with-param name="name" select="'import'"/>
        <xsl:with-param name="value" select="$import"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Package'"/>
        <xsl:with-param name="name" select="'package'"/>
        <xsl:with-param name="value" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'access'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="'public'"/>
    </xsl:call-template>
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Interface'"/>
        <xsl:with-param name="name" select="'interface'"/>
        <xsl:with-param name="default" select="'no'"/>
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
        <xsl:with-param name="text" select="'Implements'"/>
        <xsl:with-param name="name" select="'implements'"/>
        <xsl:with-param name="value" select="$implements"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Constructor'"/>
        <xsl:with-param name="name" select="'constructor'"/>
        <xsl:with-param name="option" select="$function_access_types/*"/>
        <xsl:with-param name="default" select="'public'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Destructor'"/>
        <xsl:with-param name="name" select="'destructor'"/>
        <xsl:with-param name="option" select="$function_access_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Main'"/>
        <xsl:with-param name="name" select="'main'"/>
        <xsl:with-param name="option" select="$function_access_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
