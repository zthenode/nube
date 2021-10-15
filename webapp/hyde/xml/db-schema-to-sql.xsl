<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: db-schema-to-sql.xsl                             -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 9/13/2004                                        -->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:db="http://localhost/xml/schemas/db"
 exclude-result-prefixes="db"
 version="1.0">

<xsl:output
 method="text"
 indent="yes"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "db:schema"                               -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="db:schema">
    <xsl:variable name="db" select="@db"/>
    <xsl:variable name="types" select="db:types/db:type"/>

    <xsl:for-each select="db:tables/db:table">
        <xsl:variable name="primary_key" select="db:columns/db:column['yes'=@primary_key]"/>

        <xsl:text>CREATE TABLE </xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>&#10;(</xsl:text>
        <xsl:for-each select="db:columns/db:column">
            <xsl:variable name="name" select="@name"/>
            <xsl:variable name="type" select="@type"/>
            <xsl:variable name="sql_type" select="$types[$type=@id]/@sql"/>

            <xsl:if test="1 &lt; position()">
                <xsl:text>,&#10; </xsl:text>
            </xsl:if>
            <xsl:value-of select="$name"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$sql_type"/>
        </xsl:for-each>

        <xsl:if test="0 &lt; count($primary_key)">
            <xsl:text>,&#10; PRIMARY KEY(</xsl:text>
            <xsl:for-each select="$primary_key">
                <xsl:if test="1 &lt; position()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:value-of select="@name"/>
            </xsl:for-each>
            <xsl:text>)</xsl:text>
        </xsl:if>
        <xsl:text>)&#10;</xsl:text>
    </xsl:for-each>
</xsl:template>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "*"                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="*">
    <b>Unexpected document type "</b>
    <xsl:value-of select="name()"/>
    <b>"</b>
</xsl:template>

</xsl:stylesheet>
