<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- Version 0.1.3 (06.10.2013) -->
    <!--
    <xsl:for-each select="part-list/score-part">
        <xsl:variable name="partname">
            <xsl:value-of select="part-name"/>
        </xsl:variable>
    </xsl:for-each>
    -->
    <xsl:template match="/"><xsl:text>\version "2.17.26"
\score {
  &lt;&lt;</xsl:text>
<!--  -->
        <xsl:apply-templates select="score-partwise"/>
        <!--
        <xsl:apply-templates select="score-partwise/part/measure/note/pitch"/>
        <xsl:apply-templates select="score-partwise/part/measure/note"/>
        -->
    </xsl:template>
   <!--  --> 
    <xsl:template match="score-partwise">
        <!--
        
        -->
        <xsl:for-each select="part">
    \new Staff = "Part<xsl:value-of select="@id"/><xsl:text>Staff1" \with {
      instrumentName = #"</xsl:text><xsl:value-of select="/score-partwise/part-list/score-part/part-name"/>
            <xsl:text>"} &lt;&lt;</xsl:text>
      \new Voice = "Part<xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
      </xsl:text>
            <xsl:for-each select="measure">
                <xsl:for-each select="attributes">
                    <xsl:for-each select="key">
                        <!--  -->
                        <xsl:choose>
                            <xsl:when test="fifths = '0' and mode = 'major' or mode=''">\key c\major </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'minor'">\key a\minor </xsl:when>
                            <xsl:when test="fifths = '0'">  \key c\major </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'major' or mode=''">\key g\major </xsl:when>
                            <xsl:when test="fifths = '1'">  \key g\major </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'minor'">\key e\minor </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'major' or mode=''">\key d\major </xsl:when>
                            <xsl:when test="fifths = '2'">  \key c\major </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'major' or mode=''">\key a\major </xsl:when>
                            <xsl:when test="fifths = '3'">  \key c\major </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'major' or mode=''">\key e\major </xsl:when>
                            <xsl:when test="fifths = '4'">  \key e\major </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'major' or mode=''">\key b\major </xsl:when>
                            <xsl:when test="fifths = '5'">  \key b\major </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'major' or mode=''">\key fis\major </xsl:when>
                            <xsl:when test="fifths = '6'">  \key fis\major </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'major' or mode=''">\key cis\major </xsl:when>
                            <xsl:when test="fifths = '7'">  \key cis\major </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'major' or mode=''">\key f\major </xsl:when>
                            <xsl:when test="fifths = '-1'">  \key f\major </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'major' or mode=''">\key bes\major </xsl:when>
                            <xsl:when test="fifths = '-2'">  \key bes\major </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'major' or mode=''">\key es\major </xsl:when>
                            <xsl:when test="fifths = '-3'">  \key es\major </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'major' or mode=''">\key as\major </xsl:when>
                            <xsl:when test="fifths = '-4'">  \key as\major </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'major' or mode=''">\key des\major </xsl:when>
                            <xsl:when test="fifths = '-5'">  \key des\major </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'major' or mode=''">\key ges\major </xsl:when>
                            <xsl:when test="fifths = '-6'">  \key ges\major </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'major' or mode=''">\key ces\major </xsl:when>
                            <xsl:when test="fifths = '-7'">  \key ces\major </xsl:when>
                        </xsl:choose>
                        <!--  -->
                        <!--
                        <xsl:if test="fifths = '0' and mode = 'major' or mode=''">\key c\major </xsl:if>
                        -->
                        <!--
                        <xsl:if test="mode = '' or mode = 'major'">c\major </xsl:if>
                        -->
                        <!--
                        <xsl:if test="mode = 'major' or mode = ''">\major</xsl:if>
                        -->
                        <!--
                        <xsl:value-of select="mode"/>
                        -->
                    </xsl:for-each>
                    <xsl:for-each select="time">
                        <xsl:text>\time </xsl:text>
                        <xsl:value-of select="beats"/>
                        <xsl:text>/</xsl:text>
                        <xsl:value-of select="beat-type"/>
                        <xsl:text>
        </xsl:text>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="note">
                    <xsl:for-each select="pitch">
                        <xsl:value-of select="lower-case(step)"/>
                        <xsl:choose>
                            <xsl:when test="octave = '0'">,,,</xsl:when>
                            <xsl:when test="octave = '1'">,,</xsl:when>
                            <xsl:when test="octave = '2'">,</xsl:when>
                            <xsl:when test="octave = '3'"></xsl:when>
                            <xsl:when test="octave = '4'">'</xsl:when>
                            <xsl:when test="octave = '5'">''</xsl:when>
                            <xsl:when test="octave = '6'">'''</xsl:when>
                            <xsl:when test="octave = '7'">''''</xsl:when>
                            <xsl:when test="octave = '8'">'''''</xsl:when>
                            <xsl:when test="octave = '9'">''''''</xsl:when>
                        </xsl:choose>
                        <!--
                        <xsl:if test="octave = '4'">'</xsl:if>
                        -->
                <!--
                </xsl:value-of>
                -->
                    </xsl:for-each>
                    <xsl:choose>
                        <xsl:when test="type='128th'">128</xsl:when>
                        <xsl:when test="type='64th'">64</xsl:when>
                        <xsl:when test="type='32nd'">32</xsl:when>
                        <xsl:when test="type='16th'">16</xsl:when>
                        <xsl:when test="type='eighth'">8</xsl:when>
                        <xsl:when test="type='quarter'">4</xsl:when>
                        <xsl:when test="type='half'">2</xsl:when>
                        <xsl:when test="type='whole'">1</xsl:when>
                        <xsl:when test="type='breve'">\breve</xsl:when>
                        <!--
                        <xsl:when test="type=''">\longa</xsl:when>
                        -->
                    </xsl:choose>
                </xsl:for-each>
                <xsl:text>&#124;&#37;</xsl:text>
                <xsl:value-of select="@number"/>
                <xsl:text>
      </xsl:text>
            </xsl:for-each>
                <!--
            <xsl:for-each select="measure/note">
                <xsl:if test="type = 'whole'">1</xsl:if>
            </xsl:for-each>
            -->
        
        <!--
         <xsl:for-each select="/measure/note/pitch">
             <xsl:if test="step = 'C'">c</xsl:if>
             
             <xsl:value-of select="step"/>
             
         </xsl:for-each>   
         -->
     <xsl:text>}
  </xsl:text>        
<xsl:text>  &gt;&gt;
</xsl:text>  
    </xsl:for-each>
<xsl:text>  &gt;&gt;
}
</xsl:text>
    </xsl:template>
  
</xsl:stylesheet>