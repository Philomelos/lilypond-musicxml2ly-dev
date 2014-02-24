<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- musicxml2ly.xsl v0.1.4 (07.10.2013) -->
    <xsl:template match="/"><xsl:text>\version "2.17.26"
\score {
  &lt;&lt;</xsl:text>
        <xsl:apply-templates select="score-partwise"/>
    </xsl:template>
    <xsl:template match="score-partwise">
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
                            <xsl:when test="fifths = '0' and mode = 'ionian'">\key c\ionian </xsl:when>
                            <xsl:when test="fifths = '0'">  \key c\major </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'dorian'">\key d\dorian </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'phrygian'">\key e\phrygian </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'lydian'">\key f\lydian </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'mixolydian'">\key g\mixolydian </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'minor'">\key a\minor </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'aeolian'">\key a\aeolian </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'locrian'">\key b\locrian </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'major' or mode=''">\key g\major </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'ionian'">\key g\ionian </xsl:when>
                            <xsl:when test="fifths = '1'">  \key g\major </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'dorian'">\key a\dorian </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'phrygian'">\key b\phrygian </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'lydian'">\key c\lydian </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'mixolydian'">\key d\mixolydian </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'minor'">\key e\minor </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'aeolian'">\key e\aeolian </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'locrian'">\key fis\locrian </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'major' or mode=''">\key d\major </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'ionian'">\key d\ionian </xsl:when>
                            <xsl:when test="fifths = '2'">  \key c\major </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'dorian'">\key e\dorian </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'phrygian'">\key fis\phrygian </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'lydian'">\key g\lydian </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'mixolydian'">\key a\mixolydian </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'minor'">\key b\minor </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'aeolian'">\key b\aeolian </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'locrian'">\key cis\locrian </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'major' or mode=''">\key a\major </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'ionian'">\key a\ionian </xsl:when>
                            <xsl:when test="fifths = '3'">  \key c\major </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'dorian'">\key b\dorian </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'phrygian'">\key cis\phrygian </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'lydian'">\key d\lydian </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'mixolydian'">\key e\mixolydian </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'minor'">\key fis\minor </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'aeolian'">\key fis\aeolian </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'locrian'">\key gis\locrian </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'major' or mode=''">\key e\major </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'ionian'">\key e\ionian </xsl:when>
                            <xsl:when test="fifths = '4'">  \key e\major </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'dorian'">\key fis\dorian </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'phrygian'">\key gis\phrygian </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'lydian'">\key a\lydian </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'mixolydian'">\key b\mixolydian </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'minor'">\key cis\minor </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'aeolian'">\key cis\aeolian </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'locrian'">\key dis\locrian </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'major' or mode=''">\key b\major </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'ionian'">\key b\ionian </xsl:when>
                            <xsl:when test="fifths = '5'">  \key b\major </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'dorian'">\key cis\dorian </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'phrygian'">\key dis\phrygian </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'lydian'">\key e\lydian </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'mixolydian'">\key fis\mixolydian </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'minor'">\key gis\minor </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'aeolian'">\key gis\aeolian </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'locrian'">\key ais\locrian </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'major' or mode=''">\key fis\major </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'ionian'">\key fis\ionian </xsl:when>
                            <xsl:when test="fifths = '6'">  \key fis\major </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'dorian'">\key gis\dorian </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'phrygian'">\key ais\phrygian </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'lydian'">\key b\lydian </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'mixolydian'">\key cis\mixolydian </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'minor'">\key dis\minor </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'aeolian'">\key dis\aeolian </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'locrian'">\key eis\locrian </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'major' or mode=''">\key cis\major </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'ionian'">\key cis\ionian </xsl:when>
                            <xsl:when test="fifths = '7'">  \key cis\major </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'dorian'">\key dis\dorian </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'phrygian'">\key eis\phrygian </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'lydian'">\key fis\lydian </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'mixolydian'">\key gis\mixolydian </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'minor'">\key ais\minor </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'aeolian'">\key ais\aeolian </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'locrian'">\key bis\locrian </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'major' or mode=''">\key f\major </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'ionian'">\key f\ionian </xsl:when>
                            <xsl:when test="fifths = '-1'">  \key f\major </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'dorian'">\key g\dorian </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'phrygian'">\key a\phrygian </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'lydian'">\key bes\lydian </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'mixolydian'">\key c\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'minor'">\key d\minor </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'aeolian'">\key d\aeolian </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'locrian'">\key e\locrian </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'major' or mode=''">\key bes\major </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'ionian'">\key bes\ionian </xsl:when>
                            <xsl:when test="fifths = '-2'">  \key bes\major </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'dorian'">\key c\dorian </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'phrygian'">\key d\phrygian </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'lydian'">\key es\lydian </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'mixolydian'">\key f\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'minor'">\key g\minor </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'aeolian'">\key g\aeolian </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'locrian'">\key a\locrian </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'major' or mode=''">\key es\major </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'ionian'">\key es\ionian </xsl:when>
                            <xsl:when test="fifths = '-3'">  \key es\major </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'dorian'">\key f\dorian </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'phrygian'">\key g\phrygian </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'lydian'">\key as\lydian </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'mixolydian'">\key bes\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'minor'">\key c\minor </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'aeolian'">\key c\aeolian </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'locrian'">\key d\locrian </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'major' or mode=''">\key as\major </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'ionian'">\key as\ionian </xsl:when>
                            <xsl:when test="fifths = '-4'">  \key as\major </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'dorian'">\key bes\dorian </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'phrygian'">\key c\phrygian </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'lydian'">\key des\lydian </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'mixolydian'">\key es\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'minor'">\key f\minor </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'aeolian'">\key f\aeolian </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'locrian'">\key g\locrian </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'major' or mode=''">\key des\major </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'ionian'">\key des\ionian </xsl:when>
                            <xsl:when test="fifths = '-5'">  \key des\major </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'dorian'">\key es\dorian </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'phrygian'">\key f\phrygian </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'lydian'">\key ges\lydian </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'mixolydian'">\key as\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'minor'">\key bes\minor </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'aeolian'">\key bes\aeolian </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'locrian'">\key c\locrian </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'major' or mode=''">\key ges\major </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'ionian'">\key ges\ionian </xsl:when>
                            <xsl:when test="fifths = '-6'">  \key ges\major </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'dorian'">\key as\dorian </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'phrygian'">\key bes\phrygian </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'lydian'">\key ces\lydian </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'mixolydian'">\key des\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'minor'">\key es\minor </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'aeolian'">\key es\aeolian </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'locrian'">\key f\locrian </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'major' or mode=''">\key ces\major </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'ionian'">\key ces\ionian </xsl:when>
                            <xsl:when test="fifths = '-7'">  \key ces\major </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'dorian'">\key des\dorian </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'phrygian'">\key es\phrygian </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'lydian'">\key fes\lydian </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'mixolydian'">\key ges\mixolydian </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'minor'">\key as\minor </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'aeolian'">\key as\aeolian </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'locrian'">\key bes\locrian </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:for-each select="time">
                        <xsl:text>\time </xsl:text>
                        <xsl:value-of select="beats"/>
                        <xsl:text>/</xsl:text>
                        <xsl:value-of select="beat-type"/>
                        <xsl:text>
        </xsl:text>
                    </xsl:for-each>
                    <xsl:for-each select="clef">
                        <xsl:text>\clef </xsl:text>
                        <xsl:choose>
                            <xsl:when test="sign = 'F' and line='3'">varbaritone</xsl:when>
                            <xsl:when test="sign = 'F' and line='4'">bass</xsl:when>
                            <xsl:when test="sign = 'F' and line='4' and clef-octave-change='-1'">"bass_8"</xsl:when>
                            <xsl:when test="sign = 'F' and line='4' and clef-octave-change='-2'">"bass_15"</xsl:when>
                            <xsl:when test="sign = 'F' and line='4' and clef-octave-change='2'">"bass^15"</xsl:when>
                            <xsl:when test="sign = 'F' and line='5'">subbass</xsl:when>
                            
                            <xsl:when test="sign = 'G' and line='1'">french</xsl:when>
                            <xsl:when test="sign = 'G' and line='2'">treble</xsl:when>
                            <xsl:when test="sign = 'G' and line='2' and clef-octave-change='-1'">"treble_8"</xsl:when>
     
                            <xsl:when test="sign = 'C' and line='1'">soprano</xsl:when>
                            <xsl:when test="sign = 'C' and line='2'">mezzosoprano</xsl:when>
                            <xsl:when test="sign = 'C' and line='3'">alto</xsl:when>
                            <xsl:when test="sign = 'C' and line='4'">tenor</xsl:when>
                            <xsl:when test="sign = 'C' and line='5'">baritone</xsl:when>
                            
                            <xsl:when test="sign = 'percussion' and line='4'">percussion</xsl:when>
                            
                            <xsl:when test="sign = 'TAB' and line='5'">tab</xsl:when>
                        </xsl:choose>
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