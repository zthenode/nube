<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde-create-cxx-parameters.xsl                   -->
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

<xsl:param name="form_cxx_param_interface" select="'no'"/>
<xsl:param name="form_cxx_param_class" select="'c'"/>
<xsl:param name="form_cxx_param_is" select="''"/>
<xsl:param name="form_cxx_param_implements" select="''"/>
<xsl:param name="form_cxx_param_constructor" select="'no'"/>
<xsl:param name="form_cxx_param_destructor" select="'no'"/>

<xsl:variable name="class_function_types_tree">
	<class-function-type>abstract</class-function-type>
	<class-function-type>virtual</class-function-type>
	<class-function-type>inline</class-function-type>
	<class-function-type>static</class-function-type>
	<class-function-type>yes</class-function-type>
	<class-function-type>no</class-function-type>
</xsl:variable>

<xsl:variable name="class_function_types"
 select="exsl:node-set($class_function_types_tree)"/>

<xsl:variable name="class_constructor_types_tree">
	<class-constructor-type>explicit</class-constructor-type>
	<class-constructor-type>yes</class-constructor-type>
	<class-constructor-type>no</class-constructor-type>
</xsl:variable>

<xsl:variable name="class_constructor_types"
 select="exsl:node-set($class_constructor_types_tree)"/>

<xsl:variable name="class_destructor_types_tree">
	<class-destructor-type>virtual</class-destructor-type>
	<class-destructor-type>yes</class-destructor-type>
	<class-destructor-type>no</class-destructor-type>
</xsl:variable>

<xsl:variable name="class_destructor_types"
 select="exsl:node-set($class_destructor_types_tree)"/>

<xsl:variable name="class_struct_types_tree">
	<class-struct-type>struct</class-struct-type>
	<class-struct-type>union</class-struct-type>
	<class-struct-type>no</class-struct-type>
</xsl:variable>

<xsl:variable name="class_struct_types"
 select="exsl:node-set($class_struct_types_tree)"/>

<xsl:variable name="class_interface_types_tree">
	<class-interface-type>interface</class-interface-type>
	<class-interface-type>export</class-interface-type>
	<class-interface-type>no</class-interface-type>
</xsl:variable>

<xsl:variable name="class_interface_types"
 select="exsl:node-set($class_interface_types_tree)"/>

<xsl:variable name="class_access_types_tree">
	<class-access-type>public</class-access-type>
	<class-access-type>private</class-access-type>
	<class-access-type>protected</class-access-type>
	<class-access-type>no</class-access-type>
</xsl:variable>

<xsl:variable name="class_access_types"
 select="exsl:node-set($class_access_types_tree)"/>

<xsl:variable name="cxx_file_types_tree">
	<cxx-file-type 
     default="yes">hxx</cxx-file-type>
	<cxx-file-type>cxx</cxx-file-type>
	<cxx-file-type>h</cxx-file-type>
	<cxx-file-type>c</cxx-file-type>
</xsl:variable>

<xsl:variable name="cxx_file_types"
 select="exsl:node-set($cxx_file_types_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_cxx_parameters                             -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_cxx_parameters">
	<xsl:param name="is_section" select="''"/>
	<xsl:param name="is_param_" select="''"/>
	<xsl:param name="is_param_filetype" select="''"/>
	<xsl:param name="is_param_include" select="''"/>
	<xsl:param name="is_param_ifdef" select="''"/>
	<xsl:param name="is_param_template" select="''"/>
	<xsl:param name="is_param_struct" select="''"/>
	<xsl:param name="is_param_interface" select="''"/>
	<xsl:param name="is_param_class" select="''"/>
	<xsl:param name="is_param_extends" select="''"/>
	<xsl:param name="is_param_implements" select="''"/>
	<xsl:param name="is_param_constructor" select="''"/>
	<xsl:param name="is_param_functions" select="''"/>
	<xsl:param name="is_param_members" select="''"/>
	<xsl:param name="is_param_enum_errors" select="''"/>
	<xsl:param name="is_param_enum" select="''"/>
	<xsl:param name="is_param_main" select="''"/>

    <xsl:param name="section_text" select="'C++ Class Parameters'"/>
    <xsl:param name="filetype_text" select="''"/>

    <xsl:param name="interface" select="$form_cxx_param_interface"/>
    <xsl:param name="class" select="$form_cxx_param_class"/>
    <xsl:param name="is" select="$form_cxx_param_is"/>
    <xsl:param name="implements" select="$form_cxx_param_implements"/>
    <xsl:param name="constructor" select="$form_cxx_param_constructor"/>
    <xsl:param name="destructor" select="$form_cxx_param_destructor"/>

    <xsl:param name="prefixsuffix_name" select="''"/>
    <xsl:param name="setget_name" select="''"/>
    <xsl:param name="function_name" select="''"/>
    <xsl:param name="function_return" select="''"/>
    <xsl:param name="function_parameters" select="''"/>
    <xsl:param name="function_ifdef" select="''"/>
    <xsl:param name="members" select="''"/>

	<xsl:if test="'no' != $is_section">
    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="$section_text"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_filetype)">
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="$filetype_text"/>
        <xsl:with-param name="name" select="'filetype'"/>
        <xsl:with-param name="option" select="$cxx_file_types/*"/>
        <xsl:with-param name="default" select="$cxx_file_types/*['yes' = @default]"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_include)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Include'"/>
        <xsl:with-param name="name" select="'include'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_ifdef)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'If Defined'"/>
        <xsl:with-param name="name" select="'ifdef'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_template)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Template'"/>
        <xsl:with-param name="name" select="'template'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_struct)">
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Struct/Union'"/>
        <xsl:with-param name="name" select="'struct'"/>
        <xsl:with-param name="option" select="$class_struct_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_interface)">
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Interface'"/>
        <xsl:with-param name="name" select="'interface'"/>
        <xsl:with-param name="option" select="$class_interface_types/*"/>
        <xsl:with-param name="default" select="$interface"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_class)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Class'"/>
        <xsl:with-param name="name" select="'class'"/>
        <xsl:with-param name="value" select="$class"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'access'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="'public'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_extends)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Extendes'"/>
        <xsl:with-param name="name" select="'is'"/>
        <xsl:with-param name="value" select="$is"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'is_access'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="'public'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_implements)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Implements'"/>
        <xsl:with-param name="name" select="'implements'"/>
        <xsl:with-param name="value" select="$implements"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="''"/>
        <xsl:with-param name="name" select="'implements_access'"/>
        <xsl:with-param name="option" select="$class_access_types/*"/>
        <xsl:with-param name="default" select="'public'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_constructor)">
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Constructor'"/>
        <xsl:with-param name="name" select="'constructor'"/>
        <xsl:with-param name="option" select="$class_constructor_types/*"/>
        <xsl:with-param name="default" select="$constructor"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Destructor'"/>
        <xsl:with-param name="name" select="'destructor'"/>
        <xsl:with-param name="option" select="$class_destructor_types/*"/>
        <xsl:with-param name="default" select="$destructor"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_functions)">
    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Functions'"/>
        <xsl:with-param name="name" select="'functions'"/>
        <xsl:with-param name="option" select="$class_function_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Operators'"/>
        <xsl:with-param name="name" select="'operators'"/>
        <xsl:with-param name="option" select="$class_function_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Create/Destroy'"/>
        <xsl:with-param name="name" select="'createdestroy'"/>
        <xsl:with-param name="option" select="$class_function_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Set/Get'"/>
        <xsl:with-param name="name" select="'setget'"/>
        <xsl:with-param name="option" select="$class_function_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="enum_row">
        <xsl:with-param name="text" select="'Do/Undo'"/>
        <xsl:with-param name="name" select="'doundo'"/>
        <xsl:with-param name="option" select="$class_function_types/*"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'prototype'"/>
        <xsl:with-param name="name" select="'function_prototype'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'const'"/>
        <xsl:with-param name="name" select="'function_const'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Prefix/Suffix'"/>
        <xsl:with-param name="name" select="'prefixsuffix_name'"/>
        <xsl:with-param name="value" select="$prefixsuffix_name"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Name/Name'"/>
        <xsl:with-param name="name" select="'setget_name'"/>
        <xsl:with-param name="value" select="$setget_name"/>
    </xsl:call-template>

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Name'"/>
        <xsl:with-param name="name" select="'function_name'"/>
        <xsl:with-param name="value" select="$function_name"/>
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

    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'If Defined'"/>
        <xsl:with-param name="name" select="'function_ifdef'"/>
        <xsl:with-param name="value" select="$function_ifdef"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_members)">
    <xsl:call-template name="input_row">
        <xsl:with-param name="text" select="'Members'"/>
        <xsl:with-param name="name" select="'members'"/>
        <xsl:with-param name="value" select="$members"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_enum_errors)">
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Enum Errors'"/>
        <xsl:with-param name="name" select="'errors'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_enum)">
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Enum'"/>
        <xsl:with-param name="name" select="'enum'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
	</xsl:if>

	<xsl:if test="('no' != $is_param_) or ('yes' = $is_param_main)">
    <xsl:call-template name="yesno_row">
        <xsl:with-param name="text" select="'Main'"/>
        <xsl:with-param name="name" select="'main'"/>
        <xsl:with-param name="default" select="'no'"/>
    </xsl:call-template>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
