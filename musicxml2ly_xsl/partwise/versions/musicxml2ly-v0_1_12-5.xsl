<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- version number of stylesheet -->
    <xsl:variable name="version">musicxml2ly.xsl v0.1.12-5 (25.10.2013)</xsl:variable>
    
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
    <xsl:variable name="types">
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
    
    <!-- <bar-styles> dictionary  -->
    <xsl:variable name="bar-styles">
        <entry key="regular">\bar "|"</entry>
        <entry key="dotted">\bar ";"</entry>
        <entry key="dashed">\bar "!"</entry>
        <entry key="heavy">\bar "."</entry>
        <entry key="light-light">\bar "||"</entry>
        <entry key="light-heavy">\bar "|."</entry>
        <entry key="heavy-light">\bar ".|"</entry>
        <entry key="heavy-heavy">\bar ".."</entry>
        <entry key="tick">\bar "'"</entry>
        <entry key="short">\once\override Staff.BarLine.bar-extent = #'(-1 . 1)</entry>
    </xsl:variable>
    
    <!-- <clef> dictionary  -->
    <!-- 
        <sign> values: F, G, C, percussion, TAB.
        <line> values: 1, 2, 3, 4, 5, 6?
        <clef-octave-change> values: -2, -1, 1, 2 ???
    -->
    <xsl:variable name="clefs">
        <entry key="F_3">\clef varbaritone</entry>
        <entry key="F_4">\clef bass</entry>
        <entry key="F_4_-1">\clef "bass_8"</entry>
        <entry key="F_4_-2">\clef "bass_15"</entry>
        <entry key="F_4_2">\clef "bass^15"</entry>
        <entry key="F_5">\clef subbass</entry>
        
        <entry key="G_1">\clef french</entry>
        <entry key="G_2">\clef treble</entry>
        <entry key="G_2_-1">\clef "treble_8"</entry>
        
        <entry key="C_1">\clef soprano</entry>
        <entry key="C_2">\clef mezzosoprano</entry>
        <entry key="C_3">\clef alto</entry>
        <entry key="C_4">\clef tenor</entry>
        <entry key="C_5">\clef baritone</entry>
        
        <entry key="percussion_4">\clef soprano</entry>
        <!-- if TAB and font-style="normal" or font-style is left out -->
        <entry key="TAB_5">\clef moderntab</entry>
        <!-- 
            MusicXML v3.0 does not seem to provide an option for different Tab clefs.
            Even though LilyPond's default TAB clef is rather calligraphic than italic,
            I decided that font-style="italic" should be transformed to \clef tab.
            I am not sure whether any notation software provides the option to choose
            an italic font style for TAB clefs...
        -->
        <entry key="TAB_5_italic">\clef tab</entry>
    </xsl:variable>
    
    <!-- <key> signature dictionary (<fifths> and <mode>) -->
    <xsl:variable name="keys">
        <entry key="0_major">\key c\major</entry>
        <entry key="0_ionian">\key c\ionian</entry>
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
    
    <!-- <alter> (Alterations) dictionary -->
    <!-- 
        <step>
        <alter>
        <display-step>
    -->
    <xsl:variable name="alterations">
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
    </xsl:variable> <!-- end alterations -->
    
        
    <xsl:variable name="accidentals">
        <!-- <accidental> (explicit/reminder/courtesy/cautionary accidentals) -->
        <entry key="!">!</entry>
        <!-- cautionary parenthesized accidentals: -->
        <entry key="?">?</entry>
        <!-- cautionary accidentals in brackets: -->
        <entry key="[!]">???</entry>
        
        <!-- editorial accidentals -->
        <!-- accidental glyphs -->
        <!--
        <entry key="sharp">!</entry>
        -->
        <entry key="sharp">
            <xsl:text>^\markup { \sharp }</xsl:text>
        </entry>
        <entry key="bracket_sharp">
            <xsl:text>^\markup \bracket { \sharp }</xsl:text>
        </entry>
        <entry key="parentheses_sharp">
            <xsl:text>^\markup \parenthesize { \sharp }</xsl:text>
        </entry>
        <!--
        <entry key="natural">!</entry>
        -->
        <entry key="natural">
            <xsl:text>^\markup { \natural }</xsl:text>
        </entry>
        <entry key="bracket_natural">
            <xsl:text>^\markup \bracket { \natural }</xsl:text>
        </entry>
        <entry key="parentheses_natural">
            <xsl:text>^\markup \parenthesize { \natural }</xsl:text>
        </entry>
        <!--
        <entry key="flat">!</entry>
        -->
        <entry key="flat">
            <xsl:text>^\markup { \flat }</xsl:text>
        </entry>
        <entry key="bracket_flat">
            <xsl:text>^\markup \bracket { \flat }</xsl:text>
        </entry>
        <entry key="parentheses_flat">
            <xsl:text>^\markup \parenthesize { \flat }</xsl:text>
        </entry>
        <!--
        <entry key="double-sharp">???</entry>
        -->
        <entry key="double-sharp">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_double-sharp">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_double-sharp">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="sharp-sharp">\sharp\sharp</entry>
        -->
        <entry key="sharp-sharp">
            <xsl:text>^\markup { \sharp\sharp }</xsl:text>
        </entry>
        <entry key="bracket_sharp-sharp">
            <xsl:text>^\markup \parenthesize { \sharp\sharp }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-sharp">
            <xsl:text>^\markup \parenthesize { \sharp\sharp }</xsl:text>
        </entry>
        <!--
        <entry key="flat-flat">!</entry>
        -->
        <entry key="flat-flat">
            <xsl:text>^\markup { \doubleflat }</xsl:text>
        </entry>
        <entry key="bracket_flat-flat">
            <xsl:text>^\markup \bracket { \doubleflat }</xsl:text>
        </entry>
        <entry key="parentheses_flat-flat">
            <xsl:text>^\markup \parenthesize { \doubleflat }</xsl:text>
        </entry>
        <!--
        <entry key="natural-sharp">\natural\sharp</entry>
        -->
        <entry key="natural-sharp">
            <xsl:text>^\markup { \natural\sharp }</xsl:text>
        </entry>
        <entry key="bracket_natural-sharp">
            <xsl:text>^\markup \bracket { \natural\sharp }</xsl:text>
        </entry> 
        <entry key="parentheses_natural-sharp">
            <xsl:text>^\markup \parenthesize { \natural\sharp }</xsl:text>
        </entry>
        <!--
        <entry key="natural-flat">\natural\flat</entry>
        -->
        <entry key="natural-flat">
            <xsl:text>^\markup { \natural\flat }</xsl:text>
        </entry>
        <entry key="bracket_natural-flat">
            <xsl:text>^\markup \bracket { \natural\flat }</xsl:text>
        </entry>
        <entry key="parentheses_natural-flat">
            <xsl:text>^\markup \parenthesize { \natural\flat }</xsl:text>
        </entry>
        <!--
        <entry key="quarter-flat">\semiflat</entry>
        -->
        <entry key="quarter-flat">
            <xsl:text>^\markup { \semiflat }</xsl:text>
        </entry>
            <entry key="bracket_quarter-flat">
                <xsl:text>^\markup \bracket { \semiflat }</xsl:text>
            </entry>
        <entry key="parentheses_quarter-flat">
            <xsl:text>^\markup \parenthesize { \semiflat }</xsl:text>
        </entry>
        <!--
        <entry key="quarter-sharp">\semisharp</entry>
        -->
        <entry key="quarter-sharp">
            <xsl:text>^\markup { \semisharp }</xsl:text>
        </entry>
        <entry key="bracket_quarter-sharp">
            <xsl:text>^\markup \bracket { \semisharp }</xsl:text>
        </entry>    
        <entry key="parentheses_quarter-sharp">
            <xsl:text>^\markup \parenthesize { \semisharp }</xsl:text>
        </entry>
        <!--
        <entry key="three-quarters-flat">\sesquiflat</entry>
        -->
        <entry key="three-quarters-flat">
            <xsl:text>^\markup \parenthesize { \sesquiflat }</xsl:text>
        </entry>
        <entry key="bracket_three-quarters-flat">
            <xsl:text>^\markup \bracket { \sesquiflat }</xsl:text>
        </entry>
        <entry key="parentheses_three-quarters-flat">
            <xsl:text>^\markup \parenthesize { \sesquiflat }</xsl:text>
        </entry>
        <!--
        <entry key="three-quarters-sharp">\sesquisharp</entry>
        -->
        <entry key="three-quarters-sharp">
            <xsl:text>^\markup { \sesquisharp }</xsl:text>
        </entry>
        <entry key="bracket_three-quarters-sharp">
            <xsl:text>^\markup \bracket { \sesquisharp }</xsl:text>
        </entry>
        <entry key="parentheses_three-quarters-sharp">
            <xsl:text>^\markup \parenthesize { \sesquisharp }</xsl:text>
        </entry>
        <!-- 
            The -down and -up
	        accidentals are quarter-tone accidentals that include
	        arrows pointing down or up.
        -->
        <!--
        <entry key="sharp-down">???</entry>
        -->
        <entry key="sharp-down">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sharp-down">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-down">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="sharp-up">???</entry>
        -->
        <entry key="sharp-up">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sharp-up">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-up">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="natural-down">???</entry>
        -->
        <entry key="natural-down">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_natural-down">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_natural-down">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="natural-up">???</entry>
        -->
        <entry key="natural-up">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_natural-up">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_natural-up">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="flat-down">???</entry>
        -->
        <entry key="flat-down">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_flat-down">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_flat-down">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="flat-up">???</entry>
        -->
        <entry key="flat-up">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_flat-up">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_flat-up">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="triple-sharp">???</entry>
        -->
        <entry key="triple-sharp">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_triple-sharp">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_triple-sharp">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="triple-flat">???</entry>
        -->
        <entry key="triple-flat">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_triple-flat">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_triple-flat">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!-- 
            The slash- accidentals
	        are used in Turkish classical music. 
        -->
        <!--
        <entry key="slash-quarter-sharp">???</entry>
        -->
        <entry key="slash-quarter-sharp">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_slash-quarter-sharp">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_slash-quarter-sharp">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="slash-sharp">???</entry>
        -->
        <entry key="slash-sharp">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_slash-sharp">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_slash-sharp">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="slash-flat">???</entry>
        -->
        <entry key="slash-flat">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_slash-flat">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_slash-flat">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="double-slash-flat">???</entry>
        -->
        <entry key="double-slash-flat">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_double-slash-flat">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_double-slash-flat">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="double-slash-sharp">???</entry>
        -->
        <entry key="double-slash-sharp">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_double-slash-sharp">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_double-slash-sharp">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!-- 
            The numbered sharp and flat accidentals are superscripted versions
	        of the accidental signs, used in Turkish folk music.
        -->
        <!--
        <entry key="sharp-1">???</entry>
        -->
        <entry key="sharp-1">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sharp-1">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-1">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="sharp-2">???</entry>
        -->
        <entry key="sharp-2">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sharp-2">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-2">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="sharp-3">???</entry>
        -->
        <entry key="sharp-3">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sharp-3">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-3">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="sharp-5">???</entry>
        -->
        <entry key="sharp-5">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sharp-5">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sharp-5">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="flat-1">???</entry>
        -->
        <entry key="flat-1">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_flat-1">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_flat-1">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="flat-2">???</entry>
        -->
        <entry key="flat-2">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_flat-2">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_flat-2">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="flat-3">???</entry>
        -->
        <entry key="flat-3">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_flat-3">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_flat-3">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="flat-4">???</entry>
        -->
        <entry key="flat-4">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_flat-4">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_flat-4">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!-- 
            The sori and koron accidentals are microtonal sharp and
	        flat accidentals used in Iranian and Persian music.
        -->
        <!--
        <entry key="sori">???</entry>
        -->
        <entry key="sori">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_sori">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_sori">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
        <!--
        <entry key="koron">???</entry>
        -->
        <entry key="koron">
            <xsl:text>^\markup { ??? }</xsl:text>
        </entry>
        <entry key="bracket_koron">
            <xsl:text>^\markup \bracket { ??? }</xsl:text>
        </entry>
        <entry key="parentheses_koron">
            <xsl:text>^\markup \parenthesize { ??? }</xsl:text>
        </entry>
    </xsl:variable>
    <!--
    <xsl:variable name="divisions" select="4 div /score-partwise/part/measure/attributes/divisions" />
    -->
    
    <xsl:template match="/">
        <xsl:text>\version "2.17.28"
% transformed with </xsl:text>
            <xsl:value-of select="$version"/>
        <xsl:apply-templates select="score-partwise"/>             
    </xsl:template> <!-- end template / -->
    
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
    </xsl:template> <!-- end template score-partwise -->
    
    <xsl:template match="part">
        <xsl:choose>
            <xsl:when test="/score-partwise/part/measure/attributes/staves='2'">
                <xsl:text>
    \new PianoStaff &lt;&lt;
      \set PianoStaff.instrumentName = #"</xsl:text><xsl:value-of select="/score-partwise/part-list/score-part/part-name"/><xsl:text>"
      \new Staff = "Part</xsl:text><xsl:value-of select="@id"/>
                <xsl:text>Staff1" &lt;&lt;</xsl:text>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='1']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {</xsl:text>
                    <xsl:call-template name="Staff1Voice1"/><xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='2']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {</xsl:text>
                    <!--
                    <xsl:apply-templates select="measure"/>
                    -->
                    <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='3']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice3" {</xsl:text>
                    <!--
                    <xsl:apply-templates select="measure"/>
                    -->
                    <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='4']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice4" {</xsl:text>
                    <!--
                    <xsl:apply-templates select="measure"/>
                    -->
                    <xsl:text>
        }</xsl:text>
                </xsl:if>  
                <xsl:text>
      &gt;&gt;
            
      \new Staff = "Part</xsl:text><xsl:value-of select="@id"/>
                <xsl:text>Staff2" &lt;&lt;</xsl:text>
                <xsl:if test="/score-partwise/part/measure/note[staff='2' and voice='1']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice1" {</xsl:text>
                    <!--
                    <xsl:apply-templates select="measure"/>
                    -->
                    <xsl:text>
          </xsl:text>
                
                <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[voice='2']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice2" {</xsl:text>
                    <xsl:call-template name="Staff2Voice2"/><xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[voice='3']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice3" {</xsl:text>
                    <!--
                    <xsl:apply-templates select="measure"/>
                    -->
                    <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[voice='4']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice4" {</xsl:text>
                    <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:text>
      &gt;&gt;</xsl:text>
                <xsl:text>
    &gt;&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
            <!-- 
                When there is no <staves> element
                print only one staff:
            -->
                <xsl:text>
    \new Staff = "Part</xsl:text><xsl:value-of select="@id"/>
                <xsl:text>Staff1" &lt;&lt;</xsl:text>        
                <xsl:if test="/score-partwise/part/measure/note[staff='1' or voice='1' or not(voice)]">
                    <xsl:text>
      \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
        </xsl:text>
                    <xsl:call-template name="SingleStaff1Voice1"/>
                <xsl:text>
      }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[lyric and staff='1' or voice='1' or not(voice)]">
                    <xsl:text>
      \new Lyrics \lyricsto "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
        </xsl:text>
                    <xsl:call-template name="LyricsStaff1Voice1"/>
                    <xsl:text>
      }</xsl:text>
                        
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='2']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {</xsl:text>
                
                <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='3']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice3" {</xsl:text>
                
                <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='4']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice4" {</xsl:text>
                    <xsl:text>
        }</xsl:text>
            </xsl:if>
            <xsl:text>
    &gt;&gt;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> <!-- end template part -->
    
    <xsl:template name="SingleStaff1Voice1">
        <xsl:for-each select="measure">
            <xsl:for-each select="attributes">
                <xsl:apply-templates select="key">
                </xsl:apply-templates>
                <xsl:text>  </xsl:text>
                <xsl:apply-templates select="time"/>
                <xsl:text>  </xsl:text>
                <xsl:apply-templates select="clef">
                </xsl:apply-templates> <!-- end apply-templates key -->
                <!--
                <xsl:if test="/score-partwise/part/measure[@number='0']">
                    <xsl:text>
      </xsl:text>
                </xsl:if>
                -->
            </xsl:for-each> <!-- for-each attributes -->
            <!-- 
                The call-template pickup command should not be placed here
                because this way it will be called for each and every measure...
            -->
            <xsl:call-template name="pickup"/>
            <xsl:text>
        </xsl:text>
            <xsl:apply-templates select="note">
                <xsl:with-param name="voice">1</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                    bar check and bar number (|%1) 
                    in case of pickup measures (partial measures) 
                    the bar number should be 0.  It would be good if
                    wrong bar numbers were corrected automatically.
                -->
            <xsl:text>&#124;&#37;</xsl:text>
            <xsl:value-of select="@number"/>
            <!--
            <xsl:text>    </xsl:text>
            -->
            <xsl:apply-templates select="barline"/>
        </xsl:for-each> <!-- for-each measure -->
    </xsl:template> <!-- end template SingleStaff1Voice1 -->
    
    <xsl:template name="LyricsStaff1Voice1">
        <xsl:for-each select="measure">
            <xsl:for-each select="note">
                <xsl:apply-templates select="lyric"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Staff1Voice1">
        <xsl:for-each select="measure">
            <!--
            <xsl:text>    </xsl:text>
            -->
            <xsl:for-each select="attributes">
                <xsl:text>
          </xsl:text>
                <xsl:apply-templates select="key">
                    <xsl:with-param name="staffnumber">1</xsl:with-param>
                </xsl:apply-templates>
                <xsl:text>    </xsl:text>
                <xsl:apply-templates select="time"/>
                <xsl:text>    </xsl:text>
                <xsl:apply-templates select="clef">
                    <xsl:with-param name="staffnumber">1</xsl:with-param>
                </xsl:apply-templates>
                <xsl:text>
          </xsl:text>
            </xsl:for-each> <!-- for-each attributes -->
            <xsl:call-template name="pickup"/>
            <xsl:apply-templates select="note">
                <xsl:with-param name="staff">1</xsl:with-param>
                <xsl:with-param name="voice">1</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                    bar check and bar number (|%1) 
                    in case of pickup measures (partial measures) 
                    the bar number should be 0.  It would be good if
                    wrong bar numbers were corrected automatically.
                -->
            <xsl:text>&#124;&#37;</xsl:text>
            <xsl:value-of select="@number"/>
            <xsl:text>
          </xsl:text>
            <xsl:apply-templates select="barline"/>
        </xsl:for-each> <!-- for-each measure -->
    </xsl:template> <!-- end template Staff1Voice1 -->
    
    <xsl:template name="Staff2Voice2">
        <xsl:for-each select="measure">
            <xsl:for-each select="attributes">
                <xsl:text>
          </xsl:text>
                <xsl:apply-templates select="key">
                    <xsl:with-param name="staffnumber">1</xsl:with-param>
                </xsl:apply-templates>
                <xsl:text>    </xsl:text>
                <xsl:apply-templates select="time"/>
                <xsl:text>    </xsl:text>
                <xsl:apply-templates select="clef">
                    <xsl:with-param name="staffnumber">2</xsl:with-param>
                </xsl:apply-templates>
                <xsl:text>
          </xsl:text>
            </xsl:for-each> <!-- for-each attributes -->
            <xsl:call-template name="pickup"/>
            <xsl:apply-templates select="note">
                <xsl:with-param name="staff">2</xsl:with-param>
                <xsl:with-param name="voice">2</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                    bar check and bar number (|%1) 
                    in case of pickup measures (partial measures) 
                    the bar number should be 0.  It would be good if
                    wrong bar numbers were corrected automatically.
                -->
            <xsl:text>&#124;&#37;</xsl:text>
            <xsl:value-of select="@number"/>
            <xsl:text>
          </xsl:text>
            <xsl:apply-templates select="barline"/>
        </xsl:for-each> <!-- for-each measure -->
    </xsl:template> <!-- end template Staff2Voice2 -->
    
    <xsl:template match="measure"></xsl:template>
    
    <xsl:template match="attributes"></xsl:template>
    <!--
    <xsl:template match="measure">
        <xsl:apply-templates select="attributes"/>
        <xsl:call-template name="pickup"></xsl:call-template>
    </xsl:template>--> <!-- end template measure -->
    
    <!--
    <xsl:template match="attributes">
        <xsl:text>
          </xsl:text>
        <xsl:apply-templates select="key"/>
        <xsl:apply-templates select="clef">
            <xsl:with-param name="staffnumber">1</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>--> <!-- end template attributes -->
    
    <xsl:template match="key">
        <xsl:param name="staffnumber"/>
        <xsl:variable name="key">
            <xsl:value-of select="fifths"/>
            <xsl:text>_</xsl:text>
            <xsl:value-of select="mode"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@number=$staffnumber and $key">
                <xsl:value-of select="$keys/entry[@key=$key]"/>
            </xsl:when>
            <xsl:when test="$key">
                <xsl:value-of select="$keys/entry[@key=$key]"/>
            </xsl:when>                
        </xsl:choose>                
        <xsl:text>
      </xsl:text>
    </xsl:template> <!-- end template key -->
    
    <xsl:template match="time">
        <xsl:text>\time </xsl:text>
        <xsl:value-of select="beats"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="beat-type"/>
        <xsl:text>
      </xsl:text>
    </xsl:template> <!-- end template time -->
    
    <xsl:template match="clef">
        <xsl:param name="staffnumber"/>
        <xsl:variable name="clef">
            <xsl:value-of select="sign"/>
            <xsl:text>_</xsl:text>
            <xsl:value-of select="line"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$clef and @number=$staffnumber">
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
            </xsl:when>
            <!-- 
                We have a problem when there are several clefs
                but no clef numbers!
            -->
            <xsl:when test="$clef and not(@number)">
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
            </xsl:when>
            
            <!--
            <xsl:otherwise>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
            </xsl:otherwise>
            -->
        </xsl:choose>
    </xsl:template> <!-- end template clef -->
    
    <xsl:template match="measure-style">
        <!-- 
            This probably has to be moved to the note template
            in order to compute the multi measure rests...
        -->
        <xsl:choose>
            <xsl:when test="multiple-rest">\compressFullBarRests</xsl:when>
        </xsl:choose>
    </xsl:template> <!-- end template measure-style -->
    
    <xsl:template match="note">
        <xsl:param name="staff"/>
        <xsl:param name="voice"/>
        <xsl:choose>
            <xsl:when test=".[staff=$staff] and .[voice=$voice]">
                <xsl:apply-templates select="pitch"/>
            </xsl:when>
            <xsl:when test=".[voice=$voice or not(voice)]">
                <xsl:apply-templates select="pitch"/>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test=".[staff=$staff] and .[voice=$voice]">
                <xsl:apply-templates select="rest"/>
            </xsl:when>
            <!-- 
                In scores containing only a single staff the <voice>
                might or might not be there:
            -->
            <xsl:when test=".[voice=$voice] or not(.[voice])">
                <xsl:apply-templates select="rest"/>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test=".[staff=$staff] and .[voice=$voice]">
                <xsl:apply-templates select="type"/>
            </xsl:when>
            <!-- 
                In scores containing only a single staff the <voice>
                might or might not be there:
            -->
            <xsl:when test=".[voice=$voice] or not(.[voice])">
                <xsl:apply-templates select="type"/>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="duration and not(type) and .[staff=$staff] and .[voice=$voice]">
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="0.25 div /score-partwise/part/measure/attributes/divisions * duration"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
        <!--
        <xsl:choose>
            <xsl:when test=".[voice=$voice] or not(.[voice])">
                <xsl:apply-templates select="lyric"/>
            </xsl:when>
        </xsl:choose>
        -->
        <xsl:call-template name="editorial"/>
    </xsl:template> <!-- end template note -->
    
    <xsl:template match="pitch">
        <!--
        <xsl:text>    </xsl:text>
        -->
        <xsl:apply-templates select="step"/>
        <xsl:apply-templates select="alter"/>
        <xsl:apply-templates select="octave"/>
        <xsl:call-template name="cautionary"/>
    </xsl:template> <!-- end template pitch -->
    
    <xsl:template match="step">
        <xsl:value-of select="lower-case(.)"/>
        <!--
        <xsl:if test="not(pitch/alter)">
            <xsl:text> </xsl:text>
        </xsl:if>
        -->
    </xsl:template> <!-- end template step -->
    
    <xsl:template match="alter">
        <xsl:variable name="alter">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test=".">
                <xsl:value-of select="$alterations/entry[@key=$alter]"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template> <!-- end template alter -->
    
    <xsl:template match="octave">
        <xsl:variable name="octave">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test=".">
                <xsl:value-of select="$octaves/entry[@key=$octave]"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    
    <xsl:template match="rest">
        <xsl:choose>
            <xsl:when test=". and ./display-step and ./display-octave='0'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='0']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='1'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='1']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='2'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='2']"/>
            </xsl:when>
            <xsl:when test=". and rest/display-step and ./display-octave='3'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='3']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='4'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='4']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='5'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='5']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='6'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='6']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='7'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='7']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='8'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='8']"/>
            </xsl:when>
            <xsl:when test=". and ./display-step and ./display-octave='9'">
                <xsl:value-of select="translate(./display-step,'ABCDEFG', 'abcdefg')"/>
                <xsl:value-of select="$octaves/entry[@key='9']"/>
            </xsl:when>
            <xsl:when test=".[@measure='yes']">R</xsl:when>
            <xsl:when test=".">r</xsl:when>
        </xsl:choose>
    </xsl:template> <!-- end template rest -->
    
    <xsl:template match="type">
        <!-- type (graphic note duration) -->
        <!--
             Rests with a display-step need to be treated first,
             because they need to be transformed with a "\rest".
        -->
        <xsl:variable name="type">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test=".">
                <xsl:value-of select="$types/entry[@key=$type]"/>
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
        <xsl:when test="rest/display-step and .='128th'"><xsl:value-of select="$types/entry[@key='128th']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='64th'"><xsl:value-of select="$types/entry[@key='64th']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='32nd'"><xsl:value-of select="$types/entry[@key='32nd']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='16th'"><xsl:value-of select="$types/entry[@key='16th']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='eighth'"><xsl:value-of select="$types/entry[@key='eighth']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='quarter'"><xsl:value-of select="$types/entry[@key='quarter']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='half'"><xsl:value-of select="$types/entry[@key='half']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='whole'"><xsl:value-of select="$types/entry[@key='whole']"/>\rest</xsl:when>
        <xsl:when test="rest/display-step and .='breve'"><xsl:value-of select="$types/entry[@key='breve']"/>\rest</xsl:when>
            <!--
        <xsl:when test=".='128th'"><xsl:value-of select="$types/entry[@key='128th']"/></xsl:when>
        <xsl:when test=".='64th'"><xsl:value-of select="$types/entry[@key='64th']"/></xsl:when>
        <xsl:when test=".='32nd'"><xsl:value-of select="$types/entry[@key='32nd']"/></xsl:when>
        <xsl:when test=".='16th'"><xsl:value-of select="$types/entry[@key='16th']"/></xsl:when>
        <xsl:when test=".='eighth'"><xsl:value-of select="$types/entry[@key='eighth']"/></xsl:when>
        <xsl:when test=".='quarter'"><xsl:value-of select="$types/entry[@key='quarter']"/></xsl:when>
        <xsl:when test=".='half'"><xsl:value-of select="$types/entry[@key='half']"/></xsl:when>
        <xsl:when test=".='whole'"><xsl:value-of select="$types/entry[@key='whole']"/></xsl:when>
        <xsl:when test=".='breve'"><xsl:value-of select="$types/entry[@key='breve']"/></xsl:when>
        -->
        <!-- In case the type element is missing: -->
        <!-- Check whether there is a duration element.
                            Calculate the value of the LilyPond Duration:
                            1/4/divisions * duration
                        -->
           
        
        
        <!-- <xsl:value-of select="0.25 div /score-partwise/part/measure/attributes/divisions * duration"/> -->    
        <!--
                        <xsl:when test="type=''">\longa</xsl:when>
                        -->
        </xsl:choose>
        <!--
        <xsl:value-of select="0.25 div /score-partwise/part/measure/attributes/divisions * duration"/>
        -->
    </xsl:template> <!-- end template type -->
    
    <xsl:template name="cautionary">
        
        
        <!-- 
            The accidental type represents explicitly notated accidentals
            such as reminder (editorial and cautionary) accidentals.
            Reminder accidentals have to placed after the specification 
            of the octave.
            The MusicXML Reference says: "If no accidental is desired, 
            it should be omitted."
            This means: if there is an "unneeded" accidental, it should be 
            treated as a reminder/cautionary accidental (without parentheses).
            According to Elaine Gould (2011, p. 83): "Square brackets around
            accidentals should be used only to indicate editorial additions
            in practical or scholarly editions.  Editorial additions may, 
            alternatively, be given as small-sized accidentals above their
            notes [...].
        -->
        
            <xsl:variable name="cautionary">
                <xsl:choose>
                    <xsl:when test="../accidental[@cautionary='yes' and @parentheses='yes']">
                        <xsl:text>?</xsl:text>
                    </xsl:when>
                    <xsl:when test="../accidental[@cautionary='yes']">
                        <xsl:text>!</xsl:text>
                    </xsl:when>
                    <!--
            <xsl:when test=".">
                <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
            </xsl:when>
            -->
                </xsl:choose>
            </xsl:variable> <!-- end variable cautionary -->
        <!--
        <xsl:value-of select="$cautionary"/>
        -->
            <xsl:choose>
                <!--
                <xsl:when test="../accidental[@cautionary='yes'] and ../accidental[@parentheses='yes']">? </xsl:when>
                <xsl:when test="../accidental[@cautionary='yes']">! </xsl:when>
                -->
                <xsl:when test="../accidental[@cautionary='yes' and @parentheses='yes']">
                    <xsl:value-of select="$accidentals/entry[@key=$cautionary]"/>
                </xsl:when>
                <xsl:when test="../accidental[@cautionary='yes']">
                    <xsl:value-of select="$accidentals/entry[@key=$cautionary]"/>
                </xsl:when>
            </xsl:choose>
    </xsl:template> <!-- end template cautionary -->
         
        <xsl:template name="editorial">
        <xsl:variable name="editorial">
            <xsl:choose>
                <xsl:when test="accidental[@editorial='yes' and @parentheses='yes'] and accidental">
                    <xsl:text>parentheses_</xsl:text>
                    <xsl:value-of select="accidental"/>
                </xsl:when>
                <xsl:when test="accidental[@editorial='yes' and @bracket='yes'] and accidental">
                    <xsl:text>bracket_</xsl:text>
                    <xsl:value-of select="accidental"/>
                </xsl:when>
                <xsl:when test="accidental[@editorial='yes'] and accidental">
                    <xsl:value-of select="accidental"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
            <!--
        <xsl:value-of select="$editorial"/>
        -->
        <xsl:choose>
            <xsl:when test="accidental[@editorial='yes' and @parentheses='yes'] and accidental">
                <xsl:value-of select="$accidentals/entry[@key=$editorial]"/>
            </xsl:when>
            <xsl:when test="accidental[@editorial='yes'] and accidental">
                <xsl:value-of select="$accidentals/entry[@key=$editorial]"/>
            </xsl:when>
        </xsl:choose>
         <!-- end param editorial -->
        </xsl:template> <!-- end template editorial -->
    
    
    <xsl:template match="lyric">
        <xsl:apply-templates select="syllabic"/>
        <xsl:apply-templates select="text"/>
    </xsl:template> <!-- end template lyric -->
    
    <xsl:template match="syllabic">
        
    </xsl:template> <!-- end template syllabic -->
    
    <xsl:template match="text">
        <xsl:value-of select="."/>
    </xsl:template> <!-- end template text -->
    
    <xsl:template match="barline">
        <!-- barlines -->
        <!-- 
            In case of a missing location attribute the location is chosen
            merely on the basis of the requested bar-style (educated guess).
        -->
        <xsl:apply-templates select="bar-style"/>
    </xsl:template>
    
    <xsl:template match="bar-style">
        <xsl:variable name="bar-style">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test=". and not(/score-partwise/part/measure/attributes/staves)">
                <xsl:text>
        </xsl:text>
                <xsl:value-of select="$bar-styles/entry[@key=$bar-style]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$bar-styles/entry[@key=$bar-style]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="pickup">
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
            Assumes that pickup durations are the same for all
            staves and voices.  Not safe!
            Missing <staff> and <voice> elements should be taken
            into consideration.  Not tested.
        -->
        <xsl:choose>
            <xsl:when test="@number='0'
                and 
                @implicit='yes'
                and
                note[staff='1'][voice='1']
                and
                (sum(note[staff='1'][voice='1']/duration)
                * 
                0.25 
                div 
                attributes/divisions)
                lt 
                (attributes/divisions 
                * 
                attributes/time/beats 
                div 
                attributes/time/beat-type)
                ">
                <xsl:text>    \partial </xsl:text>
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="
                        (sum(note[staff='1'][voice='1']/duration)
                        * 
                        0.25 
                        div 
                        attributes/divisions)"/>
                </xsl:call-template>
                
                <xsl:text> 
          </xsl:text>   
          
                
            </xsl:when>
            <xsl:when test="@number='0'
                and 
                @implicit='yes'
                and
                not(note[staff='1'])
                or
                not(note[voice='1'])
                and
                (sum(note/duration)
                * 
                0.25 
                div 
                attributes/divisions)
                lt 
                (attributes/divisions 
                * 
                attributes/time/beats 
                div 
                attributes/time/beat-type)
                ">
                <xsl:text>    \partial </xsl:text>
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="
                        (sum(note/duration)
                        * 
                        0.25 
                        div 
                        attributes/divisions)"/>
                </xsl:call-template>
                <xsl:text>
                </xsl:text>   
            </xsl:when>
            <!--
            <xsl:otherwise>
                <xsl:text>
      </xsl:text>
            </xsl:otherwise>
            -->
        </xsl:choose>
        <!--
        <xsl:text>
      </xsl:text>
      -->
    </xsl:template> <!-- end template pickup -->
    
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
    </xsl:template> <!-- end template decimal-to-fraction -->
    
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
    </xsl:template> <!-- end template greatest-common-divisor -->
    
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
    </xsl:template> <!-- end template greatest-common-divisor-helper -->
    
</xsl:stylesheet>