<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="part">
        <xsl:variable name="partid">
            <xsl:value-of select="@id"/>
        </xsl:variable>
        <xsl:variable name="staff">
            <!--
            <xsl:for-each select="distinct-values(//staff)">
            -->
            <xsl:value-of select="distinct-values(//staff)"/>
            <!--
            </xsl:for-each>
            -->
        </xsl:variable>
        <xsl:for-each select="distinct-values(//voice)">
            <xsl:text>
Part</xsl:text>
            <xsl:value-of select="$partid"/>
            <xsl:text>Staff</xsl:text>
            
            <xsl:value-of select="$staff[1]"/>
            
            <xsl:text>Voice</xsl:text>
            <xsl:value-of select="distinct-values(.)"/>
            <!--
            <xsl:apply-templates select="staff"/>
            -->
            <!--
            <xsl:value-of select="ancestor-or-self::part[@id]"/>
            -->
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="staff">
        <xsl:value-of select="."/>
    </xsl:template>
    <!--
    % Staves: <xsl:value-of select="//staves"/>
    % Staves: <xsl:value-of select="
        count(distinct-values(//staff))"/>
    % Voices: <xsl:value-of select="max(//voice)"/>
    % Voices: <xsl:value-of select="
        count(distinct-values(//voice))"/>
        -->
    <!--
    <xsl:text>
</xsl:text>
-->
    <!--
        <xsl:for-each select="distinct-values(//voice)">
            <xsl:text>Part</xsl:text>
            <xsl:value-of select="ancestor::part[@id]"/>
            
            <xsl:text>
</xsl:text>
        </xsl:for-each>
        -->
    <xsl:template match="score-partwise">
        <xsl:apply-templates select="part"/>
        <xsl:text>
% the score definitions
</xsl:text>
        <xsl:text>\score {
  </xsl:text>
        <xsl:text>
}</xsl:text>
    </xsl:template>
</xsl:stylesheet>