<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- musicxml2ly.xsl v0.1.10 (13.10.2013) -->
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
    
    
    <xsl:template match="/">
        <xsl:text>\version "2.17.28"
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
                    </xsl:for-each>
                    <xsl:for-each select="measure-style">
                        <xsl:choose>
                            <xsl:when test="multiple-rest">\compressFullBarRests</xsl:when>
                        </xsl:choose>
                        <xsl:text>
      </xsl:text>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:for-each select="note">
                    <xsl:for-each select="pitch">
                        <!-- XSLT v2.0 only: -->
                        <!--
                        <xsl:value-of select="lower-case(step)"/> 
                        -->
                        <!--
                        <xsl:value-of select="translate(step,'ABCDEFG', 'abcdefg')"/>
                        -->
                        <xsl:value-of select="$alter/entry[@key='0']"/>
                        <xsl:choose>
                            <xsl:when test="alter='1' or ../accidental='sharp'">is                            </xsl:when>
                            <xsl:when test="alter='-1' or ../accidental='flat'">es                            </xsl:when>
                            <xsl:when test="alter='2' or ../accidental='double-sharp'">isis                            </xsl:when>
                            <xsl:when test="alter='-2' or ../accidental='flat-flat'">eses                            </xsl:when>
                            
                        </xsl:choose>
                        <xsl:choose>
                            <!-- Microtones -->
                            <xsl:when test="alter='.5' or alter='0.5'">ih</xsl:when>
                            <xsl:when test="alter='-.5' or alter='-0.5'">eh</xsl:when>
                            <xsl:when test="alter='1.5' or alter='1.5'">isih</xsl:when>
                            <xsl:when test="alter='-1.5' or alter='-1.5'">eseh</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <!-- Specification of octaves -->
                            <xsl:when test="octave = '0'">
                                <xsl:value-of select="$octaves/entry[@key='0']"/>
                            </xsl:when>
                            <xsl:when test="octave = '1'">
                                <xsl:value-of select="$octaves/entry[@key='1']"/>
                            </xsl:when>
                            <xsl:when test="octave = '2'">
                                <xsl:value-of select="$octaves/entry[@key='2']"/>
                            </xsl:when>
                            <xsl:when test="octave = '3'">
                                <xsl:value-of select="$octaves/entry[@key='3']"/>
                            </xsl:when>
                            <xsl:when test="octave = '4'">
                                <xsl:value-of select="$octaves/entry[@key='4']"/>
                            </xsl:when>
                            <xsl:when test="octave = '5'">
                                <xsl:value-of select="$octaves/entry[@key='5']"/>
                            </xsl:when>
                            <xsl:when test="octave = '6'">
                                <xsl:value-of select="$octaves/entry[@key='6']"/>
                            </xsl:when>
                            <xsl:when test="octave = '7'">
                                <xsl:value-of select="$octaves/entry[@key='7']"/>
                            </xsl:when>
                            <xsl:when test="octave = '8'">
                                <xsl:value-of select="$octaves/entry[@key='8']"/>
                            </xsl:when>
                            <xsl:when test="octave = '9'">
                                <xsl:value-of select="$octaves/entry[@key='9']"/>
                            </xsl:when>
                        </xsl:choose>
                        
                        <xsl:choose>
                        
                            <!-- Reminder accidentals have to placed after the specification of the octave -->
                            <!-- Reminder accidentals (cautionary/editorial) -->
                            <!-- 
                                The MusicXML Reference says: "If no accidental is desired, it should be omitted."
                                This means: if there is an "unneeded" accidental, it should be treated as a 
                                reminder/cautionary accidental (without parentheses).
                            -->
                            <!-- 
                                What's the difference between <accidental parentheses="yes">foo</accidental> and
                                <accidental cautionary="yes">foo</accidental> or 
                                <accidental editorial="yes">foo</accidental>?
                                Probable answer: cautionary and editorial accidentals don't have to be in parentheses.
                                IINM they can also be placed on top of the staff?!
                            -->
                            <!--
                            <xsl:when test="../accidental[@parentheses='yes']">?</xsl:when>
                            -->
                            <!--
                            <xsl:when test="../accidental[@cautionary='yes'] or ../accidental='natural'">!</xsl:when>
                            -->
                            <xsl:when test="../accidental[@cautionary='yes'] and ../accidental[@parentheses='yes']">? </xsl:when>
                            <xsl:when test="../accidental[@cautionary='yes']">! </xsl:when>
                            <!-- Not sure how an editorial accidental is supposed to look like. 
                                 According to Elaine Gould (2011, p. 83): "Square brackets around
                                 accidentals should be used only to indicate editorial additions
                                 in practical or scholarly editions.  Editorial additions may, 
                                 alternatively, be given as small-sized accidentals above their
                                 notes [...].
                                 
                            -->
                            <!--
                                Markup needs to be put after the durations.  See below
                                -->
                            <!--
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp'">^\markup {\smaller\sharp}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='natural'">^\markup {\smaller\natural}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat'">^\markup {\smaller\flat}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='double-sharp'">^\markup {\smaller\doublesharp}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-sharp'">^\markup {\smaller{\sharp\sharp}}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-flat'">^\markup {\smaller\doubleflat}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='natural-sharp'">^\markup {\smaller{\natural\sharp}}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='natural-flat'">^\markup {\smaller{\natural\flat}}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='quarter-flat'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='quarter-sharp'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='three-quarters-flat'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='three-quarters-sharp'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-down'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-up'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='natural-down'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='natural-up'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-down'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-up'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='triple-sharp'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='triple-flat'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='slash-quarter-sharp'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='slash-sharp'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='slash-flat'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='double-slash-flat'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-1'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-2'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-3'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sharp-5'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-1'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-2'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-3'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='flat-4'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='sori'">^\markup {\smaller ???}</xsl:when>
                            <xsl:when test="../accidental[@editorial='yes'] and ../accidental='koron'">^\markup {\smaller ???}</xsl:when>
                            -->
                        
                        </xsl:choose>      
                    </xsl:for-each> <!-- end pitch -->  
                    <!--
                    <xsl:for-each select="/score-partwise/part/measure/note/rest">
                    -->
                    <xsl:choose>
                        <!-- Rests -->
                        <!-- 
                                Here it has to be taken into consideration that
                                MusicXML offers several markups for rests:
                                <rest/>
                                and
                                <rest>
                                  <display-step>C</display-step>
                                  <display-octave>4</display-octave>
                                </rest>
                                The <measure-style> element is also important. 
                                Multiple rests should be transformed into R. 
                            -->
                        <!-- 
                            The following solution is too simplistic.
                            It covers only a few use cases
                        -->
                        <!--
                        <xsl:when test="rest and type='whole'">R</xsl:when>
                        -->
                        <!-- The next line tries to count all rests
                            of the type whole but it's plain wrong because it counts
                            all rest elements and because full measure rests are
                            not always of type "whole".
                        -->
                        <!--
                        <xsl:when test="rest and type='whole'">R<xsl:value-of select="count(preceding-sibling::type) + 1"/></xsl:when>
                        -->
                        <!-- The next line checks whether there is a multiple-rest element.
                            
                        -->
                        <!--
                        <xsl:when test="/score-partwise/part/measure/attributes/measure-style/multiple-rest">bla</xsl:when>
                        -->
                        <!-- 
                            If the measure attribute [of the rest element] 
                            is set to yes, this indicates this is a 
                            complete measure rest. 
                            [http://www.musicxml.com/UserManuals/MusicXML/MusicXML.htm#EL-MusicXML-rest.htm]
                        -->
                        <!-- Rests -->
                        <!-- 
                            display-step values: ABCDEFG
                            display-octave values: 0 <= x <= 9
                        -->
                        <xsl:when test="rest and rest/display-step and rest/display-octave='0'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='0']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='1'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='1']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='2'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='2']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='3'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='3']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='4'">
                            <xsl:value-of select="$pitchidentals/entry[@key='ABCDEFG']"/>
                            <xsl:value-of select="$octaves/entry[@key='4']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='5'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='5']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='6'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='6']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='7'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='7']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='8'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='8']"/>
                        </xsl:when>
                        <xsl:when test="rest and rest/display-step and rest/display-octave='9'">
                            <xsl:value-of select="translate(rest/display-step,'ABCDEFG', 'abcdefg')"/>
                            <xsl:value-of select="$octaves/entry[@key='9']"/>
                        </xsl:when>
                        <xsl:when test="rest[@measure='yes']">R</xsl:when>
                        <xsl:when test="rest">r</xsl:when>
                    </xsl:choose>
                    <!--
                    </xsl:for-each>
                    -->
                    <xsl:choose>
                        <!-- type (graphic note duration) -->
                        <!--
                            Rests with a display-step need to be treated first,
                            because they need to be transformed with a "\rest".
                        -->
                        <xsl:when test="rest/display-step and type='128th'"><xsl:value-of select="$durations/entry[@key='128th']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='64th'"><xsl:value-of select="$durations/entry[@key='64th']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='32nd'"><xsl:value-of select="$durations/entry[@key='32nd']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='16th'"><xsl:value-of select="$durations/entry[@key='16th']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='eighth'"><xsl:value-of select="$durations/entry[@key='eighth']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='quarter'"><xsl:value-of select="$durations/entry[@key='quarter']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='half'"><xsl:value-of select="$durations/entry[@key='half']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='whole'"><xsl:value-of select="$durations/entry[@key='whole']"/>\rest</xsl:when>
                        <xsl:when test="rest/display-step and type='breve'"><xsl:value-of select="$durations/entry[@key='breve']"/>\rest</xsl:when>
                        <xsl:when test="type='128th'"><xsl:value-of select="$durations/entry[@key='128th']"/></xsl:when>
                        <xsl:when test="type='64th'"><xsl:value-of select="$durations/entry[@key='64th']"/></xsl:when>
                        <xsl:when test="type='32nd'"><xsl:value-of select="$durations/entry[@key='32nd']"/></xsl:when>
                        <xsl:when test="type='16th'"><xsl:value-of select="$durations/entry[@key='16th']"/></xsl:when>
                        <xsl:when test="type='eighth'"><xsl:value-of select="$durations/entry[@key='eighth']"/></xsl:when>
                        <xsl:when test="type='quarter'"><xsl:value-of select="$durations/entry[@key='quarter']"/></xsl:when>
                        <xsl:when test="type='half'"><xsl:value-of select="$durations/entry[@key='half']"/></xsl:when>
                        <xsl:when test="type='whole'"><xsl:value-of select="$durations/entry[@key='whole']"/></xsl:when>
                        <xsl:when test="type='breve'"><xsl:value-of select="$durations/entry[@key='breve']"/></xsl:when>
                        <!--
                        <xsl:when test="type=''">\longa</xsl:when>
                        -->
                    </xsl:choose>
                    <xsl:for-each select="dot">.</xsl:for-each>
                    <xsl:text> </xsl:text>
                    
                    <xsl:choose>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp'">^\markup {\tiny\concat {[\sharp]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='natural'">^\markup {\tiny\concat {[\natural]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat'">^\markup {\tiny\concat {[\flat]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='double-sharp'">^\markup {\tiny\concat {[\doublesharp]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-sharp'">^\markup {\tiny\concat {[\sharp\sharp]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-flat'">^\markup {\tiny\concat {[\doubleflat]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='natural-sharp'">^\markup {\tiny\concat {[\natural\sharp]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='natural-flat'">^\markup {\tiny\concat {[\natural\flat]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='quarter-flat'">^\markup {\tiny\concat {[\semiflat]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='quarter-sharp'">^\markup {\tiny\concat {[\semisharp]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='three-quarters-flat'">^\markup {\tiny\concat {[\sesquiflat]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='three-quarters-sharp'">^\markup {\tiny\concat {[\sesquisharp]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-down'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-up'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='natural-down'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='natural-up'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-down'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-up'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='triple-sharp'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='triple-flat'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='slash-quarter-sharp'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='slash-sharp'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='slash-flat'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='double-slash-flat'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-1'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-2'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-3'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sharp-5'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-1'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-2'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-3'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='flat-4'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='sori'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental[@parentheses='yes'] and accidental='koron'">^\markup {\tiny\concat {[???]}} </xsl:when>
                        
                        
                        
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp'">^\markup {\tiny\sharp} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='natural'">^\markup {\tiny\natural} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat'">^\markup {\tiny\flat} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='double-sharp'">^\markup {\tiny\doublesharp} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-sharp'">^\markup {\tiny {\sharp\sharp}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-flat'">^\markup {\tiny \doubleflat} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='natural-sharp'">^\markup {\tiny {\natural\sharp}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='natural-flat'">^\markup {\tiny {\natural\flat}} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='quarter-flat'">^\markup {\tiny\semiflat} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='quarter-sharp'">^\markup {\tiny\semisharp} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='three-quarters-flat'">^\markup {\tiny\sesquiflat} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='three-quarters-sharp'">^\markup {\tiny\sesquisharp} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-down'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-up'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='natural-down'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='natural-up'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-down'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-up'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='triple-sharp'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='triple-flat'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='slash-quarter-sharp'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='slash-sharp'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='slash-flat'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='double-slash-flat'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-1'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-2'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-3'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sharp-5'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-1'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-2'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-3'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='flat-4'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='sori'">^\markup {\tiny ???} </xsl:when>
                        <xsl:when test="accidental[@editorial='yes'] and accidental='koron'">^\markup {\tiny ???} </xsl:when>
                        
                        
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="barline">
                    <!-- barlines -->
                    <!-- In case of a missing location attribute the location is chosen
                        merely on the basis of the requested bar-style (educated guess).
                    -->
                    <xsl:choose>
                        <xsl:when test="../barline[@location='right'] and bar-style='regular'">
                            <xsl:value-of select="$barlines/entry[@key='right_regular']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='regular'">
                            <xsl:value-of select="$barlines/entry[@key='right_regular']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='right'] and bar-style='dotted'">
                            <xsl:value-of select="$barlines/entry[@key='right_dotted']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='dotted'">
                            <xsl:value-of select="$barlines/entry[@key='right_dotted']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='right'] and bar-style='dashed'">
                            <xsl:value-of select="$barlines/entry[@key='right_dashed']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='dashed'">
                            <xsl:value-of select="$barlines/entry[@key='right_dashed']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='right'] and bar-style='heavy'">
                            <xsl:value-of select="$barlines/entry[@key='right_heavy']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='heavy'">
                            <xsl:value-of select="$barlines/entry[@key='right_heavy']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='right'] and bar-style='light-light'">
                            <xsl:value-of select="$barlines/entry[@key='right_light-light']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='light-light'">
                            <xsl:value-of select="$barlines/entry[@key='right_light-light']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='right'] and bar-style='light-heavy'">
                            <xsl:value-of select="$barlines/entry[@key='right_light-heavy']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='light-heavy'">
                            <xsl:value-of select="$barlines/entry[@key='right_light-heavy']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='left'] and bar-style='heavy-light'">
                            <xsl:value-of select="$barlines/entry[@key='left_heavy-light']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='heavy-light'">
                            <xsl:value-of select="$barlines/entry[@key='left_heavy-light']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='right'] and bar-style='heavy-heavy'">
                            <xsl:value-of select="$barlines/entry[@key='right_heavy-heavy']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='heavy-heavy'">
                            <xsl:value-of select="$barlines/entry[@key='right_heavy-heavy']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='middle'] and bar-style='tick'">
                            <xsl:value-of select="$barlines/entry[@key='middle_tick']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='tick'">
                            <xsl:value-of select="$barlines/entry[@key='middle_tick']"/>
                        </xsl:when>
                        
                        <xsl:when test="../barline[@location='middle'] and bar-style='short'">
                            <xsl:value-of select="$barlines/entry[@key='middle_short']"/>
                        </xsl:when>
                        <xsl:when test="bar-style='short'">
                            <xsl:value-of select="$barlines/entry[@key='middle_short']"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:text>&#124;&#37;</xsl:text>
                <xsl:value-of select="@number"/>
                <xsl:text>
      </xsl:text>
            </xsl:for-each>
     <xsl:text>}
      </xsl:text>
            <xsl:text>\new Lyrics \lyricsto "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
        </xsl:text>
            <xsl:for-each select="/score-partwise/part/measure/note/lyric">
                <xsl:value-of select="text"/>
            </xsl:for-each>
            <xsl:text>
      }                
  </xsl:text>
<xsl:text>  &gt;&gt;
</xsl:text>  
    </xsl:for-each>
<xsl:text>  &gt;&gt;
}</xsl:text>
        <xsl:text>
\layout {
  indent = 3.0\cm
%  short-indent = 0.5\cm
}</xsl:text>
    </xsl:template>
  
</xsl:stylesheet>