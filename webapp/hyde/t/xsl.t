%#################################################################
%#
%#   File: xsl.t
%#
%# Author: $author$
%#   Date: 8/29/2004
%#
%#    $Id$
%#
%#################################################################
%apply(%
%omethod,%if(%output_method%,%output_method%,html)%,%
%oindent,%if(%output_indent%,%output_indent%,yes)%,%
%oversion,%if(%output_version%,%output_version%,yes)%,%
%xver,%if(%xml_version%,%xml_version%,1.0)%,%
%ver,%if(%version%,%version%,1.0)%,%
%ns,%if(%namespace%,%namespace%,xsl)%,%
%nsuri,%if(%namespace_uri%,%namespace_uri%,http://www.w3.org/1999/XSL/Transform)%,%
%xns,%if(%ext_namespace%,%ext_namespace%,xalan)%,%
%xnsuri,%if(%ext_namespace_uri%,%ext_namespace_uri%,http://xml.apache.org/xalan)%,%
%ss,%if(%document%,%document%,stylesheet)%,%
%padlen,%strlen(=================================================)%,%
%action,%else-then(%hyde_form_action%,xsl.t)%,%
%%(<?xml version="%xver%"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: %strpad(%filename(%if(%file%,%file%,%if(%output%,%output%,xml.xml)%)%)%, ,%padlen%)%-->
<!--                                                          -->
<!-- Author: %strpad(%if(%author%,%(%author%)%,%($author$)%)%, ,%padlen%)%-->
<!--   Date: %strpad(%date(month,day,year,%(%month%/%day%/%year%)%)%, ,%padlen%)%-->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<%ns%:%ss%%if(%ns%,%(
 xmlns:%ns%="%nsuri%")%)%%if(%xns%,%(
 xmlns:%xns%="%xnsuri%"
 exclude-result-prefixes="%xns%")%)%%if(1%ver%,%(
 version="%ver%")%)%>

<%ns%:output
 method="%omethod%"
 indent="%oindent%"
 version="%oversion%"/>
%if(%include%,%(
<xsl:include href="%include%"/>
)%,%if(%hyde_title%,%(
<xsl:include href="hyde-form.xsl"/>
)%)%)%%if(%hyde_title%,%(
<xsl:param name="hyde_form_title" select="'%hyde_title%'"/>
<xsl:param name="hyde_form_submit" select="'Submit'"/>
<xsl:param name="hyde_form_method" select="'post'"/>
<xsl:param name="hyde_form_action" select="'%action%'"/>
<xsl:param name="hyde_form_default_output_type" select="'text'"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template form_fields                                     -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="form_fields">
%if(%hyde_creation%,%(    <xsl:call-template name="form_creation_parameters"/>
)%)%%if(%hyde_xslt%,%(    <xsl:call-template name="form_xsl_parameters"/>
)%)%%if(%hyde_hyde_xslt%,%(    <xsl:call-template name="form_hyde_xsl_parameters"/>
)%)%%if(%hyde_new_section%,%(    <xsl:call-template name="section_row">
        <xsl:with-param name="text" select="'%hyde_new_section%'"/>
    </xsl:call-template>
)%)%%if(%hyde_file%,%(    <xsl:call-template name="form_file_parameters"/>
)%)%%if(%hyde_form%,%(    <xsl:call-template name="form_form_parameters"/>
)%)%</xsl:template>
)%)%%if(%template_name%,%(
<!--==========================================================-->
<!--                                                          -->
<!-- Template%strpad( %if(%equal(match,%template_type%)%,match )%"%template_name%", ,%padlen%)%-->
<!--                                                          -->
<!--==========================================================-->
<%ns%:template %template_type%="%template_name%">
%if(%hyde_title%,%(
    <xsl:apply-templates select="." mode="hyde_form"/>
)%)%</%ns%:template>)%)%

</%ns%:%ss%>)%)%
