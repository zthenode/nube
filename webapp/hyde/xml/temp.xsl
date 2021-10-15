<xsl:param name="footer_on_click">
    <xsl:choose>
        <xsl:when test="'' != $form_footer_on_click">
            <xsl:value-of select="$form_footer_on_click" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$default_footer_on_click" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:param>
