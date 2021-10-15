<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: hyde.xsl                                         -->
<!--                                                          -->
<!-- Author: $author$                                         -->
<!--   Date: 8/22/2004, 10/15/2021                            -->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xae="http://XSLT-Application-Extensions"
 xmlns:hyde="http://Hydra-Development-Environment"
 xmlns:xalan="http://xml.apache.org/xalan"
 xmlns:exsl="http://exslt.org/common"
 exclude-result-prefixes="exsl xae hyde xalan"
 version="1.0">

<xsl:output
 method="html"
 indent="yes"/>

<xsl:param name="http_scheme" select="'http'"/>
<xsl:param name="http_host" select="'localhost'"/>
<xsl:param name="http_port" select="'80'"/>
<xsl:param name="http_path" select="'/ccl/xml/hyde/hyde.xsl'"/>
<xsl:param name="http_query" select="''"/>
<xsl:param name="http_fragment" select="''"/>

<xsl:param name="border" select="'0'"/>
<xsl:param name="frame_border">
    <xsl:choose>
        <xsl:when test="('' != $border) and ('0' != $border)">
            <xsl:value-of select="'yes'"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="'0'"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:param>

<xsl:param name="frame" select="''"/>
<xsl:param name="tab" select="hyde:config/hyde:tabs/hyde:tab[@default = 'yes']/@id"/>
<xsl:param name="menu" select="''"/>
<xsl:param name="section" select="''"/>
<xsl:param name="item" select="''"/>
<xsl:param name="folder" select="hyde:config/hyde:folders/hyde:folder[@default = 'yes']/@id"/>

<xsl:variable name="variable_tree">
    <hyde:variable name="frame" value="{$frame}"/>
</xsl:variable>
<xsl:variable name="variable" select="exsl:node-set($variable_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "element_location"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="element_location">
    <xsl:param name="select" select="."/>
    <xsl:param name="location_scheme">
        <xsl:choose>
            <xsl:when test="$select/@location_scheme">
                <xsl:value-of select="$select/@location_scheme"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$http_scheme"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    <xsl:param name="location_host">
        <xsl:choose>
            <xsl:when test="$select/@location_host">
                <xsl:value-of select="$select/@location_host"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$http_host"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    <xsl:param name="location_port">
        <xsl:choose>
            <xsl:when test="$select/@location_port">
                <xsl:value-of select="$select/@location_port"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$http_port"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    <xsl:param name="location_path">
        <xsl:choose>
            <xsl:when test="$select/@location_path">
                <xsl:value-of select="$select/@location_path"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$http_path"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    <xsl:param name="location_query">
        <xsl:choose>
            <xsl:when test="$select/@location_query">
                <xsl:value-of select="$select/@location_query"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="''"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xsl:choose>
        <xsl:when test="'' != $select/@location">
            <xsl:value-of select="$select/@location"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="'' != $location_scheme">
                <xsl:value-of select="$location_scheme"/>
                <xsl:value-of select="':'"/>
            </xsl:if>
            <xsl:if test="'' != $location_host">
                <xsl:value-of select="'//'"/>
                <xsl:value-of select="$location_host"/>
            </xsl:if>
            <xsl:if test="'' != $location_port">
                <xsl:value-of select="':'"/>
                <xsl:value-of select="$location_port"/>
            </xsl:if>
            <xsl:value-of select="$location_path"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "element_location_target"                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="element_location_target">
    <xsl:param name="select" select="."/>
    <xsl:choose>
        <xsl:when test="$select/@location_target">
            <xsl:value-of select="$select/@location_target"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="''"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "element_location_query_and"                    -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="element_location_query_and">
    <xsl:param name="select" select="."/>
    <xsl:param name="location_query_and" select="''"/>

    <xsl:if test="'no' != $select/@is_location_query_and">
            <xsl:if test="'' != $location_query_and">
                <xsl:value-of select="'&amp;'"/>
                <xsl:value-of select="$location_query_and"/>
            </xsl:if>
    </xsl:if>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "head"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="head">
    <xsl:param name="tab_font" select="hyde:tabs/hyde:fonts/hyde:font"/>
    <xsl:param name="section_font" select="hyde:menus/hyde:menu-sections/hyde:fonts/hyde:font"/>
    <xsl:param name="item_font" select="hyde:menus/hyde:fonts/hyde:font"/>
    <xsl:param name="folder_font" select="hyde:folders/hyde:fonts/hyde:font"/>

    <head>
        <style type="text/css">
            a.tab {color: <xsl:value-of select="$tab_font['off' = @hover]/@color"/>; text-decoration: none;}
            a.tab:hover {color: <xsl:value-of select="$tab_font['on' = @hover]/@color"/>; text-decoration: underline;}

            a.section {color: <xsl:value-of select="$section_font['off' = @hover]/@color"/>; text-decoration: none;}
            a.section:hover {color: <xsl:value-of select="$section_font['on' = @hover]/@color"/>; text-decoration: underline;}

            a.item {color: <xsl:value-of select="$item_font['off' = @hover]/@color"/>; text-decoration: none;}
            a.item:hover {color: <xsl:value-of select="$item_font['on' = @hover]/@color"/>; text-decoration: underline;}

            a.folder {color: <xsl:value-of select="$folder_font['off' = @hover]/@color"/>; text-decoration: none;}
            a.folder:hover {color: <xsl:value-of select="$folder_font['on' = @hover]/@color"/>; text-decoration: underline;}
        </style>
        <script language="javaScript" src="../js/hyde.js">
        </script>
    </head>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "header"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="header">
    <xsl:param name="height" select="hyde:header/@height"/>
    <xsl:param name="font" select="hyde:header/hyde:fonts/hyde:font"/>
    <xsl:param name="text" select="hyde:header/hyde:text"/>

    <table
     border="{$border}"
     width="100%"
     height="{$height}"
     cellspacing="0" cellpadding="0">
        <tr><td>
            <font
             face="{$font/@face}"
             size="{$font/@size}"
             color="{$font/@color}">
                <b><xsl:value-of select="$text"/></b>
            </font>
        </td></tr>
        <tr><td valign="bottom">
            <xsl:call-template name="tabs"/>
        </td></tr>
    </table>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "tabs"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="tabs">
    <xsl:param name="tab_tab" select="hyde:tabs/hyde:tab"/>
    <xsl:param name="tab_bgcolor" select="hyde:tabs/@bgcolor"/>
    <xsl:param name="tab_font" select="hyde:tabs/hyde:fonts/hyde:font['off' = @hover]"/>
    <xsl:param name="tab_image" select="hyde:tabs/hyde:images/hyde:image"/>
    <xsl:param name="tab_width" select="hyde:tabs/@width"/>
    <xsl:param name="tab_height" select="hyde:tabs/@height"/>
    <xsl:param name="menu_width" select="hyde:menus/@width"/>

    <table
     border="{$border}"
     bgcolor="{$tab_bgcolor}"
     width="100%"
     height="{$tab_height}"
     cellspacing="0" cellpadding="0">
        <tr><td height="{$tab_height}">
            <table
             border="{$border}"
             height="100%"
             cellspacing="0" cellpadding="0">
                <tr>
                    <td nowrap="yes" width="{$menu_width}">
                    </td>
                    <xsl:for-each select="$tab_tab">
                        <xsl:variable name="state">
                            <xsl:choose>
                                <xsl:when test="@id = $tab">
                                    <xsl:value-of select="'top'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'bottom'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="image" select="$tab_image[@state = $state]/@location"/>
                        <xsl:variable name="text" select="hyde:text"/>
                        <xsl:variable name="menu_location">
                            <xsl:value-of select="'?frame=menu&amp;menu='"/>
                            <xsl:value-of select="@menu"/>
                            <xsl:value-of select="'&amp;border='"/>
                            <xsl:value-of select="$border"/>
                        </xsl:variable>

                        <td
                         id="tab{position()}"
                         align="center"
                         nowrap="yes"
                         width="{$tab_width}"
                         background="{$image}">
                            <a class="tab"
                             onclick="return onClickTab('{$menu_location}')"
                             href="?frame=header&amp;tab={@id}&amp;border={$border}">
                                <font
                                 face="{$tab_font/@face}"
                                 size="{$tab_font/@size}">
                                    <b><xsl:value-of select="$text"/></b>
                                </font>
                            </a>
                        </td>
                    </xsl:for-each>
                </tr>
            </table>
        </td></tr>
    </table>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "menu"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="menu">
	<xsl:param name="menu">
		<xsl:choose>
			<xsl:when test="'' = $menu">
				<xsl:value-of select="$tab"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$menu"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
    <xsl:param name="menu_bgcolor" select="hyde:menus/@bgcolor"/>
    <xsl:param name="menu_width" select="hyde:menus/@width"/>
    <xsl:param name="menu_height" select="hyde:menus/@height"/>
    <xsl:param name="menu_font" select="hyde:menus/hyde:fonts/hyde:font['off' = @hover]"/>

    <xsl:param name="menu_menu" select="hyde:menus/hyde:menu[@id = $menu]"/>
    <xsl:param name="menu_section" select="$menu_menu/hyde:menu-section"/>
    <xsl:param name="section_images" select="hyde:menus/hyde:menu-sections/hyde:images/hyde:image"/>
    <xsl:param name="section_font" select="hyde:menus/hyde:menu-sections/hyde:fonts/hyde:font['off' = @hover]"/>
    <xsl:param name="section_bgcolor" select="hyde:menus/hyde:menu-sections/@bgcolor"/>
    <xsl:param name="section_spacing" select="hyde:menus/hyde:menu-sections/@spacing"/>

    <xsl:param name="menu_images" select="hyde:menus/hyde:images/hyde:image"/>
    <xsl:variable name="bottom_left_menu_image" select="$menu_images['bottom_left' = @id]"/>
    <xsl:variable name="bottom_left_menu_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$bottom_left_menu_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="top_left_menu_image" select="$menu_images['top_left' = @id]"/>
    <xsl:variable name="top_left_menu_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$top_left_menu_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="left_menu_image" select="$menu_images['left' = @id]"/>
    <xsl:variable name="left_menu_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$left_menu_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="bottom_right_menu_image" select="$menu_images['bottom_right' = @id]"/>
    <xsl:variable name="bottom_right_menu_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$bottom_right_menu_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="top_right_menu_image" select="$menu_images['top_right' = @id]"/>
    <xsl:variable name="top_right_menu_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$top_right_menu_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="right_menu_image" select="$menu_images['right' = @id]"/>
    <xsl:variable name="right_menu_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$right_menu_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="bottom_left_section_image" select="$section_images['bottom_left' = @id]"/>
    <xsl:variable name="bottom_left_section_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$bottom_left_section_image"/>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="bottom_right_section_image" select="$section_images['bottom_right' = @id]"/>
    <xsl:variable name="bottom_right_section_image_location">
        <xsl:call-template name="element_location">
            <xsl:with-param name="select" select="$bottom_right_section_image"/>
        </xsl:call-template>
    </xsl:variable>

    <table
     border="{$border}"
     bgcolor="{$menu_bgcolor}"
     width="{$menu_width}" height="100%"
     cellspacing="0" cellpadding="0">
        <tr><td valign="top">
            <table
             border="{$border}"
             bgcolor="{$menu_bgcolor}"
             width="100%"
             cellspacing="0" cellpadding="0">
                <xsl:for-each select="$menu_section">
                    <xsl:variable name="state">
                        <xsl:choose>
                            <xsl:when test="@id = $section">
                                <xsl:value-of select="'top'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'bottom'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="section_image" select="$section_images[$state = @state]"/>
                    <xsl:variable name="left_section_image" select="$section_image['left' = @id]"/>
                    <xsl:variable name="left_section_image_location">
                        <xsl:call-template name="element_location">
                            <xsl:with-param name="select" select="$left_section_image"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="right_section_image" select="$section_image['right' = @id]"/>
                    <xsl:variable name="right_section_image_location">
                        <xsl:call-template name="element_location">
                            <xsl:with-param name="select" select="$right_section_image"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="section_location">
                        <xsl:call-template name="element_location">
                            <xsl:with-param name="select" select="."/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="next_section">
                        <xsl:choose>
                            <xsl:when test="@id != $section">
                                <xsl:value-of select="'&amp;section='"/>
                                <xsl:value-of select="@id"/>
                            </xsl:when>
                            <xsl:otherwise>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:if test="1 &lt; position()">
                        <tr><td 
                             colspan="2"
                             height="{$section_spacing}">
                        </td></tr>
                    </xsl:if>

                    <tr><td
                         align="left" valign="top" 
                         bgcolor="{$section_bgcolor}"
                         width="{$left_section_image/@width}"
                         height="{$left_section_image/@height}">
                        <img src="{$left_section_image_location}"/>
                    </td><td bgcolor="{$section_bgcolor}">
                        <a class="section" 
                         href="?frame=menu{$next_section}&amp;menu={$menu}&amp;border={$border}">
                            <font
                             face="{$section_font/@face}"
                             size="{$section_font/@size}"
                             xcolor="{$section_font/@color}">
                                <b><xsl:value-of select="hyde:text"/></b>
                            </font>
                        </a>
                    </td></tr>

                    <xsl:if test="@id = $section">
                        <xsl:variable name="menu_item" select="hyde:menu-item"/>
                        <xsl:variable name="count" select="count($menu_item)"/>

                        <xsl:for-each select="$menu_item">
                            <xsl:variable name="folder_location">
                                <xsl:call-template name="element_location">
                                    <xsl:with-param name="select" select="."/>
                                </xsl:call-template>
                                <xsl:call-template name="element_location_query_and">
                                    <xsl:with-param name="select" select="."/>
                                    <xsl:with-param name="location_query_and">
                                        <xsl:value-of select="'border='"/>
                                        <xsl:value-of select="$border"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:variable>

                            <tr><td
                                 align="left" valign="top"
                                 width="{$left_section_image/@width}"
                                 height="{$left_menu_image/@height}">
                                    <img src="{$left_menu_image_location}"/>
                            </td><td>
                                <a class="item"
                                 onclick="return onClickItem('{$folder_location}')"
                                 href="?frame=menu&amp;menu={$menu}&amp;section={$section}&amp;item={@id}&amp;border={$border}">
                                    <font
                                     face="{$menu_font/@face}"
                                     size="{$menu_font/@size}"
                                     xcolor="{$menu_font/@color}">
                                        <b><xsl:value-of select="hyde:text"/></b>
                                    </font>
                                </a>
                            </td></tr>
                        </xsl:for-each>

                        <tr><td
                             bgcolor="{$section_bgcolor}"
                             colspan="2"
                             height="{$left_menu_image/@width}">
                        </td></tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
        </td></tr>
    </table>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "folder"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="folder">
    <xsl:param name="folder_folder" 
	 select="hyde:folders/hyde:folder[@id = $folder]"/>
	<xsl:param name="background" 
	 select="$folder_folder/hyde:images/hyde:image[@id = 'background']"/>

    <xsl:param name="folder_fonts" select="hyde:folders/hyde:fonts"/>
    <xsl:param name="brand_font" select="$folder_fonts/hyde:font[@id = 'brand']"/>
    <xsl:param name="product_font" select="$folder_fonts/hyde:font[@id = 'product']"/>
    <xsl:param name="version_font" select="$folder_fonts/hyde:font[@id = 'version']"/>
    <xsl:param name="for_font" select="$folder_fonts/hyde:font[@id = 'for']"/>
    <xsl:param name="what_font" select="$folder_fonts/hyde:font[@id = 'what']"/>

    <xsl:param name="folder_text" select="$folder_folder/hyde:text"/>
    <xsl:param name="brand" select="$folder_text/hyde:brand"/>
    <xsl:param name="product" select="$folder_text/hyde:product"/>
    <xsl:param name="version" select="$folder_text/hyde:version"/>

	<table border="{$border}"
	 width="100%" height="100%"
	 cellspacing="0" cellpadding="0">
		<tr><td align="center" valign="center">
			<table border="{$border}"
			 cellspacing="0" cellpadding="0">
				<tr><td width="{$background/@width}" 
					 height="{$background/@height}"
					 background="{$background/@location}"  valign="top">
                <table border="{$border}" width="100%" cellspacing="0" cellpadding="0"><tr><td align="center">
                    <font 
                    face="{$brand_font/@face}" 
                    size="{$brand_font/@size}" 
                    color="{$brand_font/@color}">
                        <xsl:apply-templates mode="folder_text" select="$brand"/>
                    </font>
                    <font 
                    face="{$product_font/@face}" 
                    size="{$product_font/@size}" 
                    color="{$product_font/@color}">
                        <b><xsl:value-of select="$product"/></b><br/>
                    </font>
                    <font 
                    face="{$version_font/@face}" 
                    size="{$version_font/@size}" 
                    color="{$version_font/@color}">
                        <b><xsl:value-of select="$version"/></b><br/>
                    </font>
                </td></tr></table>
				</td></tr>
			</table>
		</td></tr>
	</table>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "footer"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="footer">
    <xsl:param name="footer" select="hyde:footer"/>
    <xsl:param name="footer_width" select="$footer/@width"/>
    <xsl:param name="footer_bgcolor" select="$footer/@bgcolor"/>
    <xsl:param name="footer_item" select="$footer/hyde:footer-item"/>
    <xsl:param name="footer_font" select="$footer/hyde:fonts/hyde:font['off' = @hover]"/>

	<table 
	 border="{$border}"
     bgcolor="{$footer_bgcolor}"
	 width="100%" height="100%"
	 cellspacing="0" cellpadding="0">
		<tr><td>
	        <table 
	         border="{$border}"
             bgcolor="{$footer_bgcolor}"
	         height="100%"
	         cellspacing="0" cellpadding="0">
		        <tr>
		        <xsl:for-each select="$footer_item">
                    <xsl:variable name="footer_location">
                        <xsl:call-template name="element_location">
                            <xsl:with-param name="select" select="."/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="footer_target">
                        <xsl:call-template name="element_location_target">
                            <xsl:with-param name="select" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

			        <td width="{$footer_width}" align="middle">
                        <xsl:choose>
                            <xsl:when test="'' != $footer_target">
				                <a class="item"
				                 target="{$footer_target}"
				                 href="{$footer_location}">
					                <font
					                face="{$footer_font/@face}"
					                size="{$footer_font/@size}">
						                <b><xsl:value-of select="hyde:text"/></b>
					                </font>
				                </a>
                            </xsl:when>
                            <xsl:otherwise>
				                <a class="item"
                                 onclick="return onClickFooter('{$footer_location}')"
				                 href="{$footer_location}">
					                <font
					                face="{$footer_font/@face}"
					                size="{$footer_font/@size}">
						                <b><xsl:value-of select="hyde:text"/></b>
					                </font>
				                </a>
                            </xsl:otherwise>
                        </xsl:choose>
			        </td>
		        </xsl:for-each>
		        </tr>
	        </table>
		</td></tr>
	</table>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template "frameset"                                      -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template name="frameset">
    <xsl:param name="header_height" select="hyde:header/@height"/>
    <xsl:param name="header_src" select="hyde:header/@location"/>
    <xsl:param name="footer_height" select="hyde:footer/@height"/>
    <xsl:param name="footer_src" select="hyde:footer/@location"/>
    <xsl:param name="menu_width" select="hyde:menus/@width"/>
    <xsl:param name="menu_src" select="hyde:menus/@location"/>
    <xsl:param name="folder_margin" select="hyde:folders/@margin"/>
    <xsl:param name="folder_src" select="hyde:folders/@location"/>

	<frameset
		border="{$frame_border}"
		rows="{$header_height},*,{$footer_height}">

		<frame
		 name="headerFrame"
		 marginwidth="0"
		 marginheight="0"
		 noresize="yes"
		 scrolling="no"
	     src="{$header_src}&amp;tab={$tab}&amp;border={$border}"/>

		<frameset
	     cols="{$menu_width},*">

			<frame
				name="menuFrame"
				marginwidth="0"
				marginheight="0"
				noresize="yes"
				scrolling="no"
                xsrc="/ccl/xml/hyde/hyde.xml"
				src="{$menu_src}&amp;tab={$tab}&amp;menu={$menu}&amp;border={$border}"/>

		    <frameset
	         rows="{$folder_margin},*,{$folder_margin}">
		    <!--frameset
	         rows="{$folder_margin},*"-->

			    <frame
				    name="topFolderFrame"
				    marginwidth="{$folder_margin}"
				    marginheight="{$folder_margin}"
				    noresize="yes"
				    scrolling="no"
				    src=""/>

			    <frame
				    name="folderFrame"
				    marginwidth="{$folder_margin}"
				    marginheight="0"
				    noresize="yes"
				    scrolling="yes"
				    src="{$folder_src}&amp;border={$border}"/>

			    <frame
				    name="bottomFolderFrame"
				    marginwidth="{$folder_margin}"
				    marginheight="{$folder_margin}"
				    noresize="yes"
				    scrolling="no"
				    src=""/>
	        </frameset>
	    </frameset>

		<frame
		 name="footerFrame"
		 marginwidth="0"
		 marginheight="0"
		 noresize="yes"
		 scrolling="no"
	     src="{$footer_src}&amp;border={$border}"/>

	</frameset>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "hyde:config"                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="hyde:config">
	<html>
    <xsl:choose>
        <xsl:when test="('header' = $frame) or ('tabs' = $frame)">
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="header"/>
            </body>
        </xsl:when>

        <xsl:when test="'menu' = $frame">
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="menu"/>
            </body>
        </xsl:when>

        <xsl:when test="'folder' = $frame">
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="folder"/>
            </body>
        </xsl:when>

        <xsl:when test="'footer' = $frame">
            <xsl:call-template name="head"/>
            <body>
                <xsl:call-template name="footer"/>
            </body>
        </xsl:when>

        <xsl:otherwise>
            <xsl:call-template name="frameset"/>
        </xsl:otherwise>
    </xsl:choose>
	</html>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "*"  mode "folder_text"                   -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="*"  mode="folder_text">
    <xsl:param name="select" select="."/>
    <xsl:param name="class" select="'folder'"/>

    <xsl:choose>
        <xsl:when test="('' != @href)">
            <xsl:choose>
                <xsl:when test="('' != @target)">
                    <a class="{$class}" href="{@href}" target="{@target}">
                        <b><xsl:value-of select="$select"/></b><br/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a class="{$class}" href="{@href}">
                        <b><xsl:value-of select="$select"/></b><br/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
            <b><xsl:value-of select="$select"/></b><br/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "*"                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="*">
    <b>Invalid document type "</b><xsl:value-of select="name()"/><b>"</b>
</xsl:template>

</xsl:stylesheet>
