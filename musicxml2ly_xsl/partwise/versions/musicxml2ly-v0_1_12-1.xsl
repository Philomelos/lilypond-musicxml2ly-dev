<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- version number of stylesheet -->
    <xsl:variable name="version">musicxml2ly.xsl v0.1.13 (16.10.2013)</xsl:variable>
    
    <!-- Dictionaries -->
    <!-- octave dictionary -->
    <xsl:variable name="octaves">
        <entry key="0">,,,</entry>
        <entry key="1">,,</entry>
        <entry key="2">,</entry>
        <entry key="3"></entry>
        <entry key="4">'</entry>
        <entry key="5">''</entry>
        <entry key="6">'''</entry>
        <entry key="7">''''</entry>
        <entry key="8">'''''</entry>
        <entry key="9">''''''</entry>
    </xsl:variable>
    
    <!-- durations dictionary (visual and sounding note durations -->
    <!-- This is a combined mapping of the values of <type> (visual note durations)
         and <duration> (sounding note duration).  The values of <type> are
         treated with higher priority.  As "types" is not self explanatory I called
         the dictionary durations.
    -->
    <xsl:variable name="durations">
        <entry key="128th">128</entry>
        <entry key="64th">64</entry>
        <entry key="32nd">32</entry>
        <entry key="16th">16</entry>
        <entry key="eighth">8</entry>
        <entry key="quarter">4</entry>
        <entry key="half">2</entry>
        <entry key="whole">1</entry>
        <entry key="breve">\breve</entry>
    </xsl:variable>
    
    <!-- <barline> dictionary (@location and <bar-style>) -->
    <xsl:variable name="barlines">
        <entry key="right_regular">\bar "|"</entry>
        <entry key="right_dotted">\bar ";"</entry>
        <entry key="right_dashed">\bar "!"</entry>
        <entry key="right_heavy">\bar "."</entry>
        <entry key="right_light-light">\bar "||"</entry>
        <entry key="right_light-heavy">\bar "|."</entry>
        <entry key="right_heavy-light">\bar ".|"</entry>
        <entry key="right_heavy-heavy">\bar ".."</entry>
        <entry key="middle_tick">\bar "'"</entry>
        <entry key="middle_short">\once\override Staff.BarLine.bar-extent = #'(-1 . 1)</entry>
    </xsl:variable>
    
    <!-- <clef> dictionary  -->
    <!-- 
        <sign> values: F, G, C, percussion, TAB.
        <line> values: 1, 2, 3, 4, 5, 6?
        <clef-octave-change> values: -2, -1, 1, 2 ???
    -->
    <xsl:variable name="clefs">
        <entry key="F_3">varbaritone</entry>
        <entry key="F_4">bass</entry>
        <entry key="F_4_-1">"bass_8"</entry>
        <entry key="F_4_-2">"bass_15"</entry>
        <entry key="F_4_2">"bass^15"</entry>
        <entry key="F_5">subbass</entry>
        
        <entry key="G_1">french</entry>
        <entry key="G_2">treble</entry>
        <entry key="G_2_-1">"treble_8"</entry>
        
        <entry key="C_1">soprano</entry>
        <entry key="C_2">mezzosoprano</entry>
        <entry key="C_3">alto</entry>
        <entry key="C_4">tenor</entry>
        <entry key="C_5">baritone</entry>
        
        <entry key="percussion_4">soprano</entry>
        <!-- if TAB and font-style="normal" or font-style is left out -->
        <entry key="TAB_5">moderntab</entry>
        <!-- 
            MusicXML v3.0 does not seem to provide an option for different Tab clefs.
            Even though LilyPond's default TAB clef is rather calligraphic than italic,
            I decided that font-style="italic" should be transformed to \clef tab.
            I am not sure whether any notation software provides the option to choose
            an italic font style for TAB clefs...
        -->
        <entry key="TAB_5_italic">tab</entry>
    </xsl:variable>
    
    <!-- <key> signature dictionary (<fifths> and <mode>) -->
    <xsl:variable name="keys">
        <entry key="0_major">\key c\major</entry>
        <entry key="0_ionian">\key c\major</entry>
        <entry key="0_dorian">\key d\dorian</entry>
        <entry key="0_phrygian">\key e\phrygian</entry>
        <entry key="0_lydian">\key f\lydian</entry>
        <entry key="0_mixolydian">\key g\mixolydian</entry>
        <entry key="0_minor">\key a\minor</entry>
        <entry key="0_aeolian">\key a\aeolian</entry>
        <entry key="0_locrian">\key b\locrian</entry>
        
        <entry key="1_major">\key g\major</entry>
        <entry key="1_ionian">\key g\major</entry>
        <entry key="1_dorian">\key a\dorian</entry>
        <entry key="1_phrygian">\key b\phrygian</entry>
        <entry key="1_lydian">\key c\lydian</entry>
        <entry key="1_mixolydian">\key d\mixolydian</entry>
        <entry key="1_minor">\key e\minor</entry>
        <entry key="1_aeolian">\key e\aeolian</entry>
        <entry key="1_locrian">\key fis\locrian</entry>
        
        <entry key="2_major">\key d\major</entry>
        <entry key="2_ionian">\key d\major</entry>
        <entry key="2_dorian">\key e\dorian</entry>
        <entry key="2_phrygian">\key fis\phrygian</entry>
        <entry key="2_lydian">\key g\lydian</entry>
        <entry key="2_mixolydian">\key a\mixolydian</entry>
        <entry key="2_minor">\key b\minor</entry>
        <entry key="2_aeolian">\key b\aeolian</entry>
        <entry key="2_locrian">\key cis\locrian</entry>
        
        <entry key="3_major">\key a\major</entry>
        <entry key="3_ionian">\key a\major</entry>
        <entry key="3_dorian">\key b\dorian</entry>
        <entry key="3_phrygian">\key cis\phrygian</entry>
        <entry key="3_lydian">\key d\lydian</entry>
        <entry key="3_mixolydian">\key e\mixolydian</entry>
        <entry key="3_minor">\key fis\minor</entry>
        <entry key="3_aeolian">\key fis\aeolian</entry>
        <entry key="3_locrian">\key gis\locrian</entry>
        
        <entry key="4_major">\key e\major</entry>
        <entry key="4_ionian">\key e\major</entry>
        <entry key="4_dorian">\key fis\dorian</entry>
        <entry key="4_phrygian">\key gis\phrygian</entry>
        <entry key="4_lydian">\key a\lydian</entry>
        <entry key="4_mixolydian">\key b\mixolydian</entry>
        <entry key="4_minor">\key cis\minor</entry>
        <entry key="4_aeolian">\key cis\aeolian</entry>
        <entry key="4_locrian">\key dis\locrian</entry>
        
        <entry key="5_major">\key b\major</entry>
        <entry key="5_ionian">\key b\major</entry>
        <entry key="5_dorian">\key cis\dorian</entry>
        <entry key="5_phrygian">\key dis\phrygian</entry>
        <entry key="5_lydian">\key e\lydian</entry>
        <entry key="5_mixolydian">\key fis\mixolydian</entry>
        <entry key="5_minor">\key gis\minor</entry>
        <entry key="5_aeolian">\key gis\aeolian</entry>
        <entry key="5_locrian">\key ais\locrian</entry>
        
        <entry key="6_major">\key fis\major</entry>
        <entry key="6_ionian">\key fis\major</entry>
        <entry key="6_dorian">\key gis\dorian</entry>
        <entry key="6_phrygian">\key ais\phrygian</entry>
        <entry key="6_lydian">\key b\lydian</entry>
        <entry key="6_mixolydian">\key cis\mixolydian</entry>
        <entry key="6_minor">\key dis\minor</entry>
        <entry key="6_aeolian">\key dis\aeolian</entry>
        <entry key="6_locrian">\key eis\locrian</entry>
        
        <entry key="7_major">\key cis\major</entry>
        <entry key="7_ionian">\key cis\major</entry>
        <entry key="7_dorian">\key dis\dorian</entry>
        <entry key="7_phrygian">\key eis\phrygian</entry>
        <entry key="7_lydian">\key cfis\lydian</entry>
        <entry key="7_mixolydian">\key gis\mixolydian</entry>
        <entry key="7_minor">\key ais\minor</entry>
        <entry key="7_aeolian">\key ais\aeolian</entry>
        <entry key="7_locrian">\key bis\locrian</entry>
        
        <entry key="-1_major">\key f\major</entry>
        <entry key="-1_ionian">\key f\major</entry>
        <entry key="-1_dorian">\key g\dorian</entry>
        <entry key="-1_phrygian">\key a\phrygian</entry>
        <entry key="-1_lydian">\key bes\lydian</entry>
        <entry key="-1_mixolydian">\key c\mixolydian</entry>
        <entry key="-1_minor">\key d\minor</entry>
        <entry key="-1_aeolian">\key d\aeolian</entry>
        <entry key="-1_locrian">\key e\locrian</entry>
        
        <entry key="-2_major">\key bes\major</entry>
        <entry key="-2_ionian">\key bes\major</entry>
        <entry key="-2_dorian">\key c\dorian</entry>
        <entry key="-2_phrygian">\key d\phrygian</entry>
        <entry key="-2_lydian">\key es\lydian</entry>
        <entry key="-2_mixolydian">\key f\mixolydian</entry>
        <entry key="-2_minor">\key g\minor</entry>
        <entry key="-2_aeolian">\key g\aeolian</entry>
        <entry key="-2_locrian">\key a\locrian</entry>
        
        <entry key="-3_major">\key es\major</entry>
        <entry key="-3_ionian">\key es\major</entry>
        <entry key="-3_dorian">\key f\dorian</entry>
        <entry key="-3_phrygian">\key g\phrygian</entry>
        <entry key="-3_lydian">\key as\lydian</entry>
        <entry key="-3_mixolydian">\key bes\mixolydian</entry>
        <entry key="-3_minor">\key c\minor</entry>
        <entry key="-3_aeolian">\key c\aeolian</entry>
        <entry key="-3_locrian">\key d\locrian</entry>
        
        <entry key="-4_major">\key as\major</entry>
        <entry key="-4_ionian">\key as\major</entry>
        <entry key="-4_dorian">\key bes\dorian</entry>
        <entry key="-4_phrygian">\key c\phrygian</entry>
        <entry key="-4_lydian">\key des\lydian</entry>
        <entry key="-4_mixolydian">\key es\mixolydian</entry>
        <entry key="-4_minor">\key f\minor</entry>
        <entry key="-4_aeolian">\key f\aeolian</entry>
        <entry key="-4_locrian">\key g\locrian</entry>
        
        <entry key="-5_major">\key des\major</entry>
        <entry key="-5_ionian">\key des\major</entry>
        <entry key="-5_dorian">\key es\dorian</entry>
        <entry key="-5_phrygian">\key f\phrygian</entry>
        <entry key="-5_lydian">\key ges\lydian</entry>
        <entry key="-5_mixolydian">\key as\mixolydian</entry>
        <entry key="-5_minor">\key bes\minor</entry>
        <entry key="-5_aeolian">\key bes\aeolian</entry>
        <entry key="-5_locrian">\key c\locrian</entry>
        
        <entry key="-6_major">\key ges\major</entry>
        <entry key="-6_ionian">\key ges\major</entry>
        <entry key="-6_dorian">\key as\dorian</entry>
        <entry key="-6_phrygian">\key bes\phrygian</entry>
        <entry key="-6_lydian">\key ces\lydian</entry>
        <entry key="-6_mixolydian">\key des\mixolydian</entry>
        <entry key="-6_minor">\key es\minor</entry>
        <entry key="-6_aeolian">\key es\aeolian</entry>
        <entry key="-6_locrian">\key f\locrian</entry>
        
        <entry key="-7_major">\key ces\major</entry>
        <entry key="-7_ionian">\key ces\major</entry>
        <entry key="-7_dorian">\key des\dorian</entry>
        <entry key="-7_phrygian">\key es\phrygian</entry>
        <entry key="-7_lydian">\key fes\lydian</entry>
        <entry key="-7_mixolydian">\key ges\mixolydian</entry>
        <entry key="-7_minor">\key as\minor</entry>
        <entry key="-7_aeolian">\key as\aeolian</entry>
        <entry key="-7_locrian">\key bes\locrian</entry>
    </xsl:variable>
    
    <!-- <alter> (Pitches) dictionary -->
    <!-- 
        <step>
        <alter>
        <display-step>
    -->
    <xsl:variable name="alter">
        <!-- The "white keys" (values of <step> and <display-step>. no <alter>, no <accidental>): -->
        <entry key="0"><xsl:value-of select="lower-case(step)"/></entry>
        <!-- 
            implicit accidentals (values of <alter> implicit accidentals) 
        -->
        <entry key="1">is</entry>
        <entry key="-1">es</entry>
        <entry key="2">isis</entry>
        <entry key="-2">eses</entry>
        <!-- Microtones -->
        <entry key="0.5">ih</entry>
        <entry key="-0.5">eh</entry>
        <entry key="1.5">isih</entry>
        <entry key="-1.5">eseh</entry>
    </xsl:variable>
    
        
    <xsl:variable name="accidentals">
        <!-- <accidental> (explicit/reminder/courtesy/cautionary accidentals) -->
        <entry key="!">!</entry>
        <!-- cautionary parenthesized accidentals: -->
        <entry key="?">?</entry>
        
        <!-- editorial accidentals -->
        
        <!-- accidental glyphs -->
        <entry key="sharp">\sharp</entry>
        <entry key="natural">\natural</entry>
        <entry key="flat">\flat</entry>
        <entry key="double-sharp">???</entry>
        <entry key="sharp-sharp">\sharp\sharp</entry>
        <entry key="flat-flat">eses</entry>
        <entry key="natural-sharp">\natural\sharp</entry>
        <entry key="natural-flat">\natural\flat</entry>
        <entry key="quarter-flat">\semiflat</entry>
        <entry key="quarter-sharp">\semisharp</entry>
        <entry key="three-quarters-flat">\sesquiflat</entry>
        <entry key="three-quarters-sharp">\sesquisharp</entry>
        <!-- 
            The -down and -up
	        accidentals are quarter-tone accidentals that include
	        arrows pointing down or up.
        -->
        <entry key="sharp-down">???</entry>
        <entry key="sharp-up">???</entry>
        <entry key="natural-down">???</entry>
        <entry key="natural-up">???</entry>
        <entry key="flat-down">???</entry>
        <entry key="flat-up">???</entry>
        <entry key="triple-sharp">???</entry>
        <entry key="triple-flat">???</entry>
        <!-- 
            The slash- accidentals
	        are used in Turkish classical music. 
        -->
        <entry key="slash-quarter-sharp">???</entry>
        <entry key="slash-sharp">???</entry>
        <entry key="slash-flat">???</entry>
        <entry key="double-slash-flat">???</entry>
        <entry key="slash-sharp">???</entry>
        <!-- 
            The numbered sharp and flat accidentals are superscripted versions
	        of the accidental signs, used in Turkish folk music.
        -->
        <entry key="sharp-1">???</entry>
        <entry key="sharp-2">???</entry>
        <entry key="sharp-3">???</entry>
        <entry key="sharp-5">???</entry>
        <entry key="flat-1">???</entry>
        <entry key="flat-2">???</entry>
        <entry key="flat-3">???</entry>
        <entry key="flat-4">???</entry>
        <!-- 
            The sori and koron accidentals are microtonal sharp and
	        flat accidentals used in Iranian and Persian music.
        -->
        <entry key="sori">???</entry>
        <entry key="koron">???</entry>
    </xsl:variable>
    <!--
    <xsl:variable name="divisions" select="4 div /score-partwise/part/measure/attributes/divisions" />
    -->
    
    <xsl:template match="/">
        <xsl:text>\version "2.17.28"
% transformed with </xsl:text>
            <xsl:value-of select="$version"/>
        <xsl:apply-templates select="score-partwise"/>             
    </xsl:template>
    
    <xsl:template match="score-partwise">
        <xsl:text>
\header {</xsl:text>
<!-- <xsl:apply-templates select="..."/> -->
        <xsl:text>
}
        </xsl:text>
        <xsl:text>
\paper {</xsl:text>
<!-- <xsl:apply-templates select="..."/> -->
        <xsl:text>
}</xsl:text>
        <xsl:text>
<!-- <xsl:apply-templates select="..."/> -->            
\layout {
  indent = 3.0\cm
%  short-indent = 0.5\cm
}
        </xsl:text>
        <xsl:text>
\score {
  &lt;&lt;</xsl:text>
        <xsl:apply-templates select="part"/>
        <xsl:text>
  &gt;&gt;            
}</xsl:text>   
    </xsl:template> <!-- end template part-wise -->
    
    <xsl:template match="part">
        <xsl:for-each select="/score-partwise/part">
            <!-- 
                Is there a <staves>2</staves> element?
                If yes: prepare a PianoStaff and two Staff blocks.
                Check for each Staff block if they contain <voice> elements (1-4)
                and prepare one Voice block for each voice.
                Problem: a <voice>2</voice> element in e.g. <staff>2</staff>
                does not necessarily mean \voiceTwo in LilyPond.  Quite a few
                scorewriters continue the numbers of voices in the second staff
                (if staff 1 contains voices 1-4 than staff 2 begins with voice 5!).
                So right now the code cannot handle parts with more than 2 staffs 
                containing more than 4 voices. The code should be simplified using
                2 loops, one for staves and one for voices.
            -->
            <xsl:choose>
                <xsl:when test="/score-partwise/part/measure/attributes/staves='2'">
                    <xsl:text>
    \new PianoStaff &lt;&lt;
      \set PianoStaff.instrumentName = #"</xsl:text><xsl:value-of select="/score-partwise/part-list/score-part/part-name"/><xsl:text>"
      \new Staff = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1" &lt;&lt;</xsl:text>
                    <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='1']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
          </xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='2']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='3']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice3" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='4']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice4" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>            
                    <xsl:text>
      &gt;&gt;</xsl:text>
                    
                    <xsl:text>
      \new Staff = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2" &lt;&lt;</xsl:text>
                    <xsl:if test="/score-partwise/part/measure/note[staff='2' and voice='1']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice1" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:text>
          </xsl:text>
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[staff='2' and voice='2']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice2" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:text>
          </xsl:text>
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[staff='2' and voice='3']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice3" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[staff='2' and voice='4']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice4" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>            
                    <xsl:text>
      &gt;&gt;</xsl:text>
                         
                    <xsl:text>
    &gt;&gt;</xsl:text> 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>
      \new Staff = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1" &lt;&lt;</xsl:text>
                    <xsl:if test="/score-partwise/part/measure/note[voice='1' or not(voice)]">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[voice='2']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {</xsl:text>
                        <!--<xsl:call-template name="pickup"/>-->
                        <xsl:text>
          </xsl:text>
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[voice='3']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice3" {</xsl:text>
                        <xsl:call-template name="pickup"/>
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>
                    <xsl:if test="/score-partwise/part/measure/note[voice='4']">
                        <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice4" {</xsl:text>
                        <xsl:call-template name="pickup"/>
                        <xsl:apply-templates select="measure"/>
                        <xsl:text>
        }</xsl:text>
                    </xsl:if>            
                    <xsl:text>
      &gt;&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:for-each>
    </xsl:template> <!-- end template part -->
    
    <xsl:template match="measure">
        <xsl:for-each select="attributes">
                                <xsl:for-each select="key">
                        <!--  -->
                        <xsl:choose>
                            <xsl:when test="fifths = '0' and mode = 'major' or mode=''">
                                  <xsl:value-of select="$keys/entry[@key='0_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='0_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0'">
                                <xsl:value-of select="$keys/entry[@key='0_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='0_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='0_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='0_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='0_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='0_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='0_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '0' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='0_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '1' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='1_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='1_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1'">
                                <xsl:value-of select="$keys/entry[@key='1_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='1_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='1_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='1_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='1_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='1_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='1_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '1' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='1_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '2' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='2_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='2_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2'">
                                <xsl:value-of select="$keys/entry[@key='2_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='2_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='2_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='2_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='2_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='2_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='2_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '2' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='2_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '3' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='3_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='3_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3'">
                                <xsl:value-of select="$keys/entry[@key='3_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='3_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='3_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='3_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='3_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='3_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='3_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '3' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='3_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '4' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='4_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='4_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4'">
                                <xsl:value-of select="$keys/entry[@key='4_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='4_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='4_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='4_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='4_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='4_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='4_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '4' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='4_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '5' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='5_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='5_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5'">
                                <xsl:value-of select="$keys/entry[@key='5_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='5_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='5_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='5_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='5_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='5_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='5_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '5' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='5_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '6' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='6_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='6_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6'">
                                <xsl:value-of select="$keys/entry[@key='6_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='6_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='6_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='6_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='6_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='6_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='6_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '6' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='6_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '7' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='7_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='7_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7'">
                                <xsl:value-of select="$keys/entry[@key='7_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='7_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='7_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='7_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='7_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='7_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='7_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '7' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='7_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-1' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-1_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-1_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1'">
                                <xsl:value-of select="$keys/entry[@key='-1_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-1_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-1_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-1_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-1_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-1_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-1_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-1' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-1_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-2' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-2_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-2_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2'">
                                <xsl:value-of select="$keys/entry[@key='-2_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-2_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-2_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-2_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-2_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-2_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-2_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-2' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-2_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-3' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-3_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-3_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3'">
                                <xsl:value-of select="$keys/entry[@key='-3_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-3_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-3_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-3_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-3_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-3_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-3_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-3' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-3_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-4' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-4_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-4_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4'">
                                <xsl:value-of select="$keys/entry[@key='-4_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-4_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-4_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-4_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-4_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-4_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-4_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-4' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-4_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-5' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-5_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-5_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5'">
                                <xsl:value-of select="$keys/entry[@key='-5_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-5_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-5_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-5_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-5_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-5_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-5_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-5' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-5_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-6' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-6_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-6_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6'">
                                <xsl:value-of select="$keys/entry[@key='-6_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-6_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-6_phrygian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-6_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-6_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-6_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-6_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-6' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-6_locrian']"/>
                            </xsl:when>
                            
                            <xsl:when test="fifths = '-7' and mode = 'major' or mode=''">
                                <xsl:value-of select="$keys/entry[@key='-7_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'ionian'">
                                <xsl:value-of select="$keys/entry[@key='-7_ionian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7'">
                                <xsl:value-of select="$keys/entry[@key='-7_major']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'dorian'">
                                <xsl:value-of select="$keys/entry[@key='-7_dorian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'phrygian'">
                                <xsl:value-of select="$keys/entry[@key='-7_phyrgian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'lydian'">
                                <xsl:value-of select="$keys/entry[@key='-7_lydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'mixolydian'">
                                <xsl:value-of select="$keys/entry[@key='-7_mixolydian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'minor'">
                                <xsl:value-of select="$keys/entry[@key='-7_minor']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'aeolian'">
                                <xsl:value-of select="$keys/entry[@key='-7_aeolian']"/>
                            </xsl:when>
                            <xsl:when test="fifths = '-7' and mode = 'locrian'">
                                <xsl:value-of select="$keys/entry[@key='-7_locrian']"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:text>
      </xsl:text>
                    </xsl:for-each> <!-- end key -->
            
                    <xsl:for-each select="time">
                        <xsl:text>    \time </xsl:text>
                        <xsl:value-of select="beats"/>
                        <xsl:text>/</xsl:text>
                        <xsl:value-of select="beat-type"/>
                        <xsl:text>
      </xsl:text>
                    </xsl:for-each> <!-- end time -->
            
                    <xsl:for-each select="clef">
                        <xsl:text>\clef </xsl:text>
                        <xsl:choose>
                            <xsl:when test="sign = 'F' and line='3'">
                                <xsl:value-of select="$clefs/entry[@key='F_3']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'F' and line='4'">
                                <xsl:value-of select="$clefs/entry[@key='F_4']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'F' and line='4' and clef-octave-change='-1'">
                                <xsl:value-of select="$clefs/entry[@key='F_4_-1']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'F' and line='4' and clef-octave-change='-2'">
                                <xsl:value-of select="$clefs/entry[@key='F_4_-2']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'F' and line='4' and clef-octave-change='2'">
                                <xsl:value-of select="$clefs/entry[@key='F_4_2']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'F' and line='5'">
                                <xsl:value-of select="$clefs/entry[@key='F_5']"/>
                            </xsl:when>
                            
                            <xsl:when test="sign = 'G' and line='1'">
                                <xsl:value-of select="$clefs/entry[@key='G_1']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'G' and line='2'">
                                <xsl:value-of select="$clefs/entry[@key='G_2']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'G' and line='2' and clef-octave-change='-1'">
                                <xsl:value-of select="$clefs/entry[@key='G_2_-1']"/>
                            </xsl:when>
     
                            <xsl:when test="sign = 'C' and line='1'">
                                <xsl:value-of select="$clefs/entry[@key='C_1']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'C' and line='2'">
                                <xsl:value-of select="$clefs/entry[@key='C_2']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'C' and line='3'">
                                <xsl:value-of select="$clefs/entry[@key='C_3']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'C' and line='4'">
                                <xsl:value-of select="$clefs/entry[@key='C_4']"/>
                            </xsl:when>
                            <xsl:when test="sign = 'C' and line='5'">
                                <xsl:value-of select="$clefs/entry[@key='C_5']"/>
                            </xsl:when>
                            
                            <xsl:when test="sign = 'percussion' and line='4'">
                                <xsl:value-of select="$clefs/entry[@key='percussion_4']"/>
                            </xsl:when>
                            
                            <xsl:when test="sign = 'TAB' and line='5'">
                                <xsl:value-of select="$clefs/entry[@key='TAB_5']"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:text>
      </xsl:text>
                    </xsl:for-each> <!-- end clef -->
                    <xsl:for-each select="measure-style">
                        <xsl:choose>
                            <xsl:when test="multiple-rest">\compressFullBarRests</xsl:when>
                        </xsl:choose>
                        
                        <xsl:text>
      </xsl:text>
                    </xsl:for-each> <!-- end for-each measure style -->
                <!-- 
                    Check if measure is a pickup measure: How to?
                    the number attribute is typically set to "0" and
                    the implicit attribute is set to "yes" but 
                    the latter only suppresses the measure number.
                    The measure number="0" seems to be the safest bet –
                    in combination with any value less than a full measure.
                    The length of the partial measure should be computed by
                    adding up the fraction values of the type elements
                    (of the partial measure). If there are no type elements
                    the values of the <duration> elements could be used as
                    an unsafe fallback.  Here I am using the unsafe solution! :/.
                -->
            <!--
            <xsl:choose>
                <xsl:when test="/score-partwise/part/measure[@number='0']
                    and 
                    /score-partwise/part/measure[@implicit='yes']
                    and
                    (sum(/score-partwise/part/measure[@number='0']/note/duration)
                    * 
                    0.25 
                    div 
                    /score-partwise/part/measure[@number='0']/attributes/divisions)
                    lt 
                    (/score-partwise/part/measure[@number='0']/attributes/divisions 
                    * 
                    /score-partwise/part/measure[@number='0']/attributes/time/beats 
                    div 
                    /score-partwise/part/measure[@number='0']/attributes/time/beat-type)
                    "><xsl:text>\partial </xsl:text>
                    <xsl:call-template name="decimal-to-fraction">
                        <xsl:with-param name="decimalnum" select="
                            (sum(/score-partwise/part/measure[@number='0']/note/duration)
                            * 
                            0.25 
                            div 
                            /score-partwise/part/measure[@number='0']/attributes/divisions)"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                </xsl:when>
            </xsl:choose>
            -->   
                </xsl:for-each> <!-- end attributes -->
        <!--
        <xsl:for-each select="/score-partwise/part/self::measure[@number='0']">Bli!</xsl:for-each>
        <xsl:if test="//self::measure[position()=1]">Bla!</xsl:if>
        -->
        <!--
        <xsl:apply-templates select="//measure[position()=1]"/>
        -->
        
        
   
    </xsl:template> <!-- end template measure -->
    

    
    <xsl:template name="staves">
        
    </xsl:template> <!-- end template "staves" -->
    
    <xsl:template name="voices">
        
    </xsl:template> <!-- end template "voices" -->
    
    <xsl:template name="measures">
        
    </xsl:template> <!-- end template "measures" -->
    
    <xsl:template name="notes">
        
    </xsl:template> <!-- end template "notes" -->
    
    <xsl:template name="pickup">
        <!--
        <xsl:choose>
        -->
            <xsl:if test="/score-partwise/part/measure[@number='0']
                and 
                /score-partwise/part/measure[@implicit='yes']
                and
                (sum(/score-partwise/part/measure[@number='0']/note/duration)
                * 
                0.25 
                div 
                /score-partwise/part/measure[@number='0']/attributes/divisions)
                lt 
                (/score-partwise/part/measure[@number='0']/attributes/divisions 
                * 
                /score-partwise/part/measure[@number='0']/attributes/time/beats 
                div 
                /score-partwise/part/measure[@number='0']/attributes/time/beat-type)
                "><xsl:text>\partial </xsl:text>
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="
                        (sum(/score-partwise/part/measure[@number='0']/note/duration)
                        * 
                        0.25 
                        div 
                        /score-partwise/part/measure[@number='0']/attributes/divisions)"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
            </xsl:if>
        <!--
        </xsl:choose>
        -->
    </xsl:template>
    
    <xsl:template name="decimal-to-fraction">
        <xsl:param name="decimalnum"/>
        <xsl:param name="num" select="round($decimalnum * 1000)"/> <!-- numerator -->
        <xsl:param name="dom" select="round(1000)"/> <!-- denominator -->
        <xsl:param name="gcd"> <!-- greatest common divisor aka highest common factor -->
            <xsl:call-template name="greatest-common-divisor">
                <xsl:with-param name="num" select="$num"/>
                <xsl:with-param name="dom" select="$dom"/>
            </xsl:call-template>
        </xsl:param>
        <!--
        <xsl:value-of select="$num div $gcd"/>/<xsl:value-of select="$dom div $gcd"/>
        <xsl:value-of select="$dom div $gcd"/>*<xsl:value-of select="$num div $gcd"/>
        -->
        <xsl:choose>
            <!-- For LilyPond durations the fractions have to be transformed into
                this form:
                denominator * numerator.
                In case the numerator equals to 1 it should be left out.
            -->
            <xsl:when test="$num div $gcd = 1"><xsl:value-of select="$dom div $gcd"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="$dom div $gcd"/>*<xsl:value-of select="$num div $gcd"/></xsl:otherwise>
        </xsl:choose>
        <!--
        <xsl:value-of select="$dom div $gcd"/>*<xsl:value-of select="$num div $gcd"/>
        -->
    </xsl:template>
    
    <xsl:template name="greatest-common-divisor">
        <xsl:param name="num"/>
        <xsl:param name="dom"/>
        <xsl:choose>
            <xsl:when test="$num &lt; 0">
                <!-- Call GCD with positive num -->
                <xsl:call-template name="greatest-common-divisor">
                    <xsl:with-param name="num" select="-$num"/>
                    <xsl:with-param name="dom" select="$dom"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$dom &lt; 0">
                <!-- Call GCD with positive dom -->
                <xsl:call-template name="greatest-common-divisor">
                    <xsl:with-param name="num" select="$num"/>
                    <xsl:with-param name="dom" select="-$dom"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$num + $dom &gt; 0">
                <!-- Valid input, call GCD-helper -->
                <xsl:call-template name="greatest-common-divisor-helper">
                    <xsl:with-param name="gcd" select="$dom"/>
                    <xsl:with-param name="num" select="$num"/>
                    <xsl:with-param name="dom" select="$dom"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <!-- Error, both parameters zero -->
                <xsl:text>error</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="greatest-common-divisor-helper">
        <!-- Recursive template. Call until $num = 0. -->
        <xsl:param name="gcd"/>
        <xsl:param name="num"/>
        <xsl:param name="dom"/>
        <xsl:choose>
            <xsl:when test="$num &gt; 0">
                <!-- Recursive call -->
                <xsl:call-template name="greatest-common-divisor-helper">
                    <xsl:with-param name="gcd" select="$num"/>
                    <xsl:with-param name="num" select="$dom mod $num"/>
                    <xsl:with-param name="dom" select="$num"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$gcd"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
 
 
    
</xsl:stylesheet>