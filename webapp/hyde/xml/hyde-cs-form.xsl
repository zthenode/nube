<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-cs-form.xsl                                 -->
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
<xsl:variable name="function_qualifiers_tree">
	<function-qualifier>new</function-qualifier>
	<function-qualifier>sealed</function-qualifier>
	<function-qualifier value="">no</function-qualifier>
</xsl:variable>

<xsl:variable name="function_qualifiers"
 select="exsl:node-set($function_qualifiers_tree)"/>

<xsl:variable name="function_types_tree">
	<function-type>abstract</function-type>
	<function-type>virtual</function-type>
	<function-type>override</function-type>
	<function-type>static</function-type>
	<function-type value="">no</function-type>
</xsl:variable>

<xsl:variable name="function_types"
 select="exsl:node-set($function_types_tree)"/>

<xsl:variable name="class_access_types_tree">
	<class-access-type>public</class-access-type>
	<class-access-type>private</class-access-type>
	<class-access-type>protected</class-access-type>
	<class-access-type value="">no</class-access-type>
</xsl:variable>

<xsl:variable name="class_access_types"
 select="exsl:node-set($class_access_types_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_cs_parameters                              -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_cs_parameters">
    <xsl:param name="using" select="'System'"/>
    <xsl:param name="class" select="'c'"/>
    <xsl:param name="extends" select="''"/>
    <xsl:param name="implements" select="''"/>
    <xsl:param name="function" select="''"/>
    <xsl:param name="function_return" select="''"/>
    <xsl:param name="function_parameters" select="''"/>

    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'C# Class Parameters'"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Using'"/>
        <xsl:with-param name="name" select="'using'"/>
        <xsl:with-param name="value" select="$using"/>
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
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="'public'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Finalize'"/>
        <xsl:with-param name="name" select="'finalize'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'finalize_type'"/>
        <xsl:with-param name="option" select="$function_types/*"/>
        <xsl:with-param name="default" select="'override'"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Main'"/>
        <xsl:with-param name="name" select="'main_access'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Function'"/>
        <xsl:with-param name="name" select="'function_access'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'function_qualifier'"/>
        <xsl:with-param name="option" select="$function_qualifiers/*"/>
        <xsl:with-param name="default" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'function_type'"/>
        <xsl:with-param name="option" select="$function_types/*"/>
        <xsl:with-param name="default" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="checkbox_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'function_extern'"/>
        <xsl:with-param name="option" select="'extern'"/>
        <xsl:with-param name="option_text" select="'extern'"/>
        <xsl:with-param name="default" select="''"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Name'"/>
        <xsl:with-param name="name" select="'function'"/>
        <xsl:with-param name="value" select="$function"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Return'"/>
        <xsl:with-param name="name" select="'function_return'"/>
        <xsl:with-param name="value" select="$function_return"/>
    </xsl:call-template>
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Parameters'"/>
        <xsl:with-param name="name" select="'function_parameters'"/>
        <xsl:with-param name="value" select="$function_parameters"/>
    </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
