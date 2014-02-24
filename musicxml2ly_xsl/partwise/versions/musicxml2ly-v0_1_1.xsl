<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
<xsl:output method="text" />
<!-- Version 0.1.1 (10.09.2012) -->
<!--<xsl:variable name="lowercase" select="'abcdefg'" />
<xsl:variable name="uppercase" select="'ABCDEFG'" /> 
<xsl:variable name="xmldurationtype" select="whole" />
<xsl:variable name="lydurationtype" select="1" />-->
    <!--
<xsl:template match="/">
    <xsl:value-of select="translate(C, $uppercase, $lowercase)" />
</xsl:template>
-->
<!--<xsl:template match="score-partwise">
    \version "2.17.1"
    <!-\-<xsl:text>\score {</xsl:text>-\->
        <xsl:apply-templates/>
    <!-\-<xsl:text>}</xsl:text>-\->
</xsl:template>
<xsl:template match="part-name">
    <xsl:text></xsl:text>
</xsl:template>    
<xsl:template match="part">
    part = {
        <xsl:apply-templates/>
    }
</xsl:template>
<xsl:template match="divisions">
    
</xsl:template>
<xsl:template match="key">
    \key c\major
    <!-\-<xsl:value-of select="fifth" />-\->
</xsl:template>    
<xsl:template match="time">
    \time
    <xsl:value-of select="beats"/>
    <xsl:text>/</xsl:text>
    <xsl:value-of select="beat-type"/>
</xsl:template>
<xsl:template match="clef">\clef "treble"</xsl:template>
<xsl:template match="pitch">
    <xsl:value-of select="translate(step, $uppercase, $lowercase)"/>-->
    <!--
</xsl:template>
<xsl:template match="type">
    <xsl:value-of select="translate(type, $xmldurationtype, $lydurationtype)"/>
    
    <xsl:value-of select="type"/>
    
<xsl:if test="whole">
    <xsl:text>1</xsl:text>
</xsl:if>

<xsl:if test="type[. = whole]">
    <xsl:text>1</xsl:text>
    </xsl:if> 
    -->
<!--</xsl:template>
<xsl:template match="duration"></xsl:template>-->
<!--<xsl:template match="type">1</xsl:template>-->
<!--<xsl:template match="type">
    <xsl:if test="type = 'whole'">1</xsl:if>
</xsl:template>-->
    
<xsl:template match="/">
    \version "2.17.1"
    <xsl:apply-templates select="score-partwise"/>
    <xsl:apply-templates select="score-partwise/part/measure/note/pitch"/>
    <xsl:apply-templates select="score-partwise/part/measure/note"/>
    }
</xsl:template>
<xsl:template match="score-partwise">
    <xsl:if test="part[@id='P1']">partOne = { </xsl:if>
    <!--<xsl:apply-templates select="part[@id='P1']"/>-->
</xsl:template>
<!--<xsl:template match="part">
    <!-\-<xsl:if test="part[@id='P1']">partPOne = { </xsl:if>-\->
    <!-\-partOne = {-\->
</xsl:template>-->
<xsl:template match="score-partwise/part/measure/note">
    <!--<xsl:if test="step = 'C'">c</xsl:if>-->
    <xsl:if test="type = 'whole'">1</xsl:if>
</xsl:template>
    <xsl:template match="score-partwise/part/measure/note/pitch">
        <xsl:if test="step = 'C'">c</xsl:if>
    </xsl:template>
</xsl:stylesheet>