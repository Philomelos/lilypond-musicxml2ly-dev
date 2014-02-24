<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- version number of stylesheet -->
    <xsl:variable name="version">musicxml2ly.xsl v0.1.17-5 (14.11.2013)</xsl:variable>
    
    <!-- Dictionaries -->
    <!-- <dot> dictionary -->
    <xsl:variable name="dots">
        <entry key=".">.</entry>
    </xsl:variable>
    <!-- <octave> dictionary -->
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
    
    <!-- <rest> dictionary -->
    <xsl:variable name="rests">
        <entry key="rest">\rest</entry>
        <entry key="r">r</entry>
        <entry key="R">R</entry>
    </xsl:variable>
    
    <!-- <step> dictionary -->
    <!-- 
        The steps dictionary is a bit redundant with regard to alterations key="0"
        but it's more intuitive.
    -->
    <!--
    <xsl:variable name="steps">
        <entry key="ABCDEFG">
            <xsl:value-of select="lower-case(step)"/>
        </entry>
    </xsl:variable>
    -->
    
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
        <entry key="long">\longa</entry>
        <!-- 
            \maxima is supported only within ancient music
            notation contexts.
        -->
        <entry key="maxima">\maxima</entry>
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
        <entry key="F_3">varbaritone</entry>
        <entry key="F_4">bass</entry>
        <entry key="F_4_1">"bass^8"</entry>
        <entry key="F_4_-1">"bass_8"</entry>
        <entry key="F_4_-2">"bass_15"</entry>
        <entry key="F_4_2">"bass^15"</entry>
        <entry key="F_5">subbass</entry>
        
        <entry key="G_1">french</entry>
        <entry key="G_2">treble</entry>
        <entry key="G_2_1">"treble^8"</entry>
        <entry key="G_2_-1">"treble_8"</entry>
        
        <entry key="C_1">soprano</entry>
        <entry key="C_2">mezzosoprano</entry>
        <entry key="C_3">alto</entry>
        <entry key="C_4">tenor</entry>
        <entry key="C_5">baritone</entry>
        
        <entry key="percussion">percussion</entry>
        <!-- if TAB and font-style="normal" or font-style is left out -->
        <entry key="TAB_5">tab</entry>
        <!-- 
            MusicXML v3.0 does not seem to provide an option for different Tab clefs.
            Even though LilyPond's default TAB clef is rather calligraphic than italic,
            I decided that font-style="italic" should be transformed to \clef tab.
            I am not sure whether any notation software provides the option to choose
            an italic font style for TAB clefs...
        -->
        <entry key="TAB_5_italic">tab</entry>
        <entry key="none">\once \override Staff.Clef #'stencil = ##f</entry>
        <!-- LilyPond does not support the jianpu clef -->
        <entry key="jianpu">treble</entry>
    </xsl:variable>
    
    
    <!-- <key> signature dictionary (<fifths> and <mode>) -->
    <!--
        Separated fifths and mode dictionaries don't make sense.
    -->
    <xsl:variable name="keys">
        <entry key="0_major">c\major</entry>
        <entry key="0_ionian">c\ionian</entry>
        <entry key="0_dorian">d\dorian</entry>
        <entry key="0_phrygian">e\phrygian</entry>
        <entry key="0_lydian">f\lydian</entry>
        <entry key="0_mixolydian">g\mixolydian</entry>
        <entry key="0_minor">a\minor</entry>
        <entry key="0_aeolian">a\aeolian</entry>
        <entry key="0_locrian">b\locrian</entry>
        
        <entry key="1_major">g\major</entry>
        <entry key="1_ionian">g\ionian</entry>
        <entry key="1_dorian">a\dorian</entry>
        <entry key="1_phrygian">b\phrygian</entry>
        <entry key="1_lydian">c\lydian</entry>
        <entry key="1_mixolydian">d\mixolydian</entry>
        <entry key="1_minor">e\minor</entry>
        <entry key="1_aeolian">e\aeolian</entry>
        <entry key="1_locrian">fis\locrian</entry>
        
        <entry key="2_major">d\major</entry>
        <entry key="2_ionian">d\ionian</entry>
        <entry key="2_dorian">e\dorian</entry>
        <entry key="2_phrygian">fis\phrygian</entry>
        <entry key="2_lydian">g\lydian</entry>
        <entry key="2_mixolydian">a\mixolydian</entry>
        <entry key="2_minor">b\minor</entry>
        <entry key="2_aeolian">b\aeolian</entry>
        <entry key="2_locrian">cis\locrian</entry>
        
        <entry key="3_major">a\major</entry>
        <entry key="3_ionian">a\ionian</entry>
        <entry key="3_dorian">b\dorian</entry>
        <entry key="3_phrygian">cis\phrygian</entry>
        <entry key="3_lydian">d\lydian</entry>
        <entry key="3_mixolydian">e\mixolydian</entry>
        <entry key="3_minor">fis\minor</entry>
        <entry key="3_aeolian">fis\aeolian</entry>
        <entry key="3_locrian">gis\locrian</entry>
        
        <entry key="4_major">e\major</entry>
        <entry key="4_ionian">e\ionian</entry>
        <entry key="4_dorian">fis\dorian</entry>
        <entry key="4_phrygian">gis\phrygian</entry>
        <entry key="4_lydian">a\lydian</entry>
        <entry key="4_mixolydian">b\mixolydian</entry>
        <entry key="4_minor">cis\minor</entry>
        <entry key="4_aeolian">cis\aeolian</entry>
        <entry key="4_locrian">dis\locrian</entry>
        
        <entry key="5_major">b\major</entry>
        <entry key="5_ionian">b\ionian</entry>
        <entry key="5_dorian">cis\dorian</entry>
        <entry key="5_phrygian">dis\phrygian</entry>
        <entry key="5_lydian">e\lydian</entry>
        <entry key="5_mixolydian">fis\mixolydian</entry>
        <entry key="5_minor">gis\minor</entry>
        <entry key="5_aeolian">gis\aeolian</entry>
        <entry key="5_locrian">ais\locrian</entry>
        
        <entry key="6_major">fis\major</entry>
        <entry key="6_ionian">fis\ionian</entry>
        <entry key="6_dorian">gis\dorian</entry>
        <entry key="6_phrygian">ais\phrygian</entry>
        <entry key="6_lydian">b\lydian</entry>
        <entry key="6_mixolydian">cis\mixolydian</entry>
        <entry key="6_minor">dis\minor</entry>
        <entry key="6_aeolian">dis\aeolian</entry>
        <entry key="6_locrian">eis\locrian</entry>
        
        <entry key="7_major">cis\major</entry>
        <entry key="7_ionian">cis\ionian</entry>
        <entry key="7_dorian">dis\dorian</entry>
        <entry key="7_phrygian">eis\phrygian</entry>
        <entry key="7_lydian">fis\lydian</entry>
        <entry key="7_mixolydian">gis\mixolydian</entry>
        <entry key="7_minor">ais\minor</entry>
        <entry key="7_aeolian">ais\aeolian</entry>
        <entry key="7_locrian">bis\locrian</entry>
        
        <entry key="8_major">gis\major</entry>
        <entry key="8_ionian">gis\ionian</entry>
        <entry key="8_dorian">ais\dorian</entry>
        <entry key="8_phrygian">bis\phrygian</entry>
        <entry key="8_lydian">cis\lydian</entry>
        <entry key="8_mixolydian">dis\mixolydian</entry>
        <entry key="8_minor">eis\minor</entry>
        <entry key="8_aeolian">eis\aeolian</entry>
        <entry key="8_locrian">fisis\locrian</entry>
        
        <entry key="9_major">dis\major</entry>
        <entry key="9_ionian">dis\ionian</entry>
        <entry key="9_dorian">eis\dorian</entry>
        <entry key="9_phrygian">fisis\phrygian</entry>
        <entry key="9_lydian">gis\lydian</entry>
        <entry key="9_mixolydian">ais\mixolydian</entry>
        <entry key="9_minor">bis\minor</entry>
        <entry key="9_aeolian">bis\aeolian</entry>
        <entry key="9_locrian">cisis\locrian</entry>
        
        <entry key="10_major">ais\major</entry>
        <entry key="10_ionian">ais\ionian</entry>
        <entry key="10_dorian">bis\dorian</entry>
        <entry key="10_phrygian">cisis\phrygian</entry>
        <entry key="10_lydian">dis\lydian</entry>
        <entry key="10_mixolydian">eis\mixolydian</entry>
        <entry key="10_minor">fisis\minor</entry>
        <entry key="10_aeolian">fisis\aeolian</entry>
        <entry key="10_locrian">gisis\locrian</entry>
        
        <entry key="11_major">eis\major</entry>
        <entry key="11_ionian">eis\ionian</entry>
        <entry key="11_dorian">fisis\dorian</entry>
        <entry key="11_phrygian">gisis\phrygian</entry>
        <entry key="11_lydian">ais\lydian</entry>
        <entry key="11_mixolydian">bis\mixolydian</entry>
        <entry key="11_minor">cisis\minor</entry>
        <entry key="11_aeolian">cisis\aeolian</entry>
        <entry key="11_locrian">disis\locrian</entry>
        
        <entry key="-1_major">f\major</entry>
        <entry key="-1_ionian">f\ionian</entry>
        <entry key="-1_dorian">g\dorian</entry>
        <entry key="-1_phrygian">a\phrygian</entry>
        <entry key="-1_lydian">bes\lydian</entry>
        <entry key="-1_mixolydian">c\mixolydian</entry>
        <entry key="-1_minor">d\minor</entry>
        <entry key="-1_aeolian">d\aeolian</entry>
        <entry key="-1_locrian">e\locrian</entry>
        
        <entry key="-2_major">bes\major</entry>
        <entry key="-2_ionian">bes\ionian</entry>
        <entry key="-2_dorian">c\dorian</entry>
        <entry key="-2_phrygian">d\phrygian</entry>
        <entry key="-2_lydian">es\lydian</entry>
        <entry key="-2_mixolydian">f\mixolydian</entry>
        <entry key="-2_minor">g\minor</entry>
        <entry key="-2_aeolian">g\aeolian</entry>
        <entry key="-2_locrian">a\locrian</entry>
        
        <entry key="-3_major">es\major</entry>
        <entry key="-3_ionian">es\ionian</entry>
        <entry key="-3_dorian">f\dorian</entry>
        <entry key="-3_phrygian">g\phrygian</entry>
        <entry key="-3_lydian">as\lydian</entry>
        <entry key="-3_mixolydian">bes\mixolydian</entry>
        <entry key="-3_minor">c\minor</entry>
        <entry key="-3_aeolian">c\aeolian</entry>
        <entry key="-3_locrian">d\locrian</entry>
        
        <entry key="-4_major">as\major</entry>
        <entry key="-4_ionian">as\ionian</entry>
        <entry key="-4_dorian">bes\dorian</entry>
        <entry key="-4_phrygian">c\phrygian</entry>
        <entry key="-4_lydian">des\lydian</entry>
        <entry key="-4_mixolydian">es\mixolydian</entry>
        <entry key="-4_minor">f\minor</entry>
        <entry key="-4_aeolian">f\aeolian</entry>
        <entry key="-4_locrian">g\locrian</entry>
        
        <entry key="-5_major">des\major</entry>
        <entry key="-5_ionian">des\ionian</entry>
        <entry key="-5_dorian">es\dorian</entry>
        <entry key="-5_phrygian">f\phrygian</entry>
        <entry key="-5_lydian">ges\lydian</entry>
        <entry key="-5_mixolydian">as\mixolydian</entry>
        <entry key="-5_minor">bes\minor</entry>
        <entry key="-5_aeolian">bes\aeolian</entry>
        <entry key="-5_locrian">c\locrian</entry>
        
        <entry key="-6_major">ges\major</entry>
        <entry key="-6_ionian">ges\ionian</entry>
        <entry key="-6_dorian">as\dorian</entry>
        <entry key="-6_phrygian">bes\phrygian</entry>
        <entry key="-6_lydian">ces\lydian</entry>
        <entry key="-6_mixolydian">des\mixolydian</entry>
        <entry key="-6_minor">es\minor</entry>
        <entry key="-6_aeolian">es\aeolian</entry>
        <entry key="-6_locrian">f\locrian</entry>
        
        <entry key="-7_major">ces\major</entry>
        <entry key="-7_ionian">ces\ionian</entry>
        <entry key="-7_dorian">des\dorian</entry>
        <entry key="-7_phrygian">es\phrygian</entry>
        <entry key="-7_lydian">fes\lydian</entry>
        <entry key="-7_mixolydian">ges\mixolydian</entry>
        <entry key="-7_minor">as\minor</entry>
        <entry key="-7_aeolian">as\aeolian</entry>
        <entry key="-7_locrian">bes\locrian</entry>
        
        <entry key="-8_major">fes\major</entry>
        <entry key="-8_ionian">fes\ionian</entry>
        <entry key="-8_dorian">ges\dorian</entry>
        <entry key="-8_phrygian">as\phrygian</entry>
        <entry key="-8_lydian">beses\lydian</entry>
        <entry key="-8_mixolydian">ces\mixolydian</entry>
        <entry key="-8_minor">des\minor</entry>
        <entry key="-8_aeolian">des\aeolian</entry>
        <entry key="-8_locrian">es\locrian</entry>
        
        <entry key="-9_major">beses\major</entry>
        <entry key="-9_ionian">beses\ionian</entry>
        <entry key="-9_dorian">ces\dorian</entry>
        <entry key="-9_phrygian">des\phrygian</entry>
        <entry key="-9_lydian">eses\lydian</entry>
        <entry key="-9_mixolydian">fes\mixolydian</entry>
        <entry key="-9_minor">ges\minor</entry>
        <entry key="-9_aeolian">ges\aeolian</entry>
        <entry key="-9_locrian">as\locrian</entry>
        
        <entry key="-10_major">eses\major</entry>
        <entry key="-10_ionian">eses\ionian</entry>
        <entry key="-10_dorian">fes\dorian</entry>
        <entry key="-10_phrygian">ges\phrygian</entry>
        <entry key="-10_lydian">ases\lydian</entry>
        <entry key="-10_mixolydian">beses\mixolydian</entry>
        <entry key="-10_minor">ces\minor</entry>
        <entry key="-10_aeolian">ces\aeolian</entry>
        <entry key="-10_locrian">des\locrian</entry>
        
        <entry key="-11_major">ases\major</entry>
        <entry key="-11_ionian">ases\ionian</entry>
        <entry key="-11_dorian">beses\dorian</entry>
        <entry key="-11_phrygian">ces\phrygian</entry>
        <entry key="-11_lydian">deses\lydian</entry>
        <entry key="-11_mixolydian">eses\mixolydian</entry>
        <entry key="-11_minor">fes\minor</entry>
        <entry key="-11_aeolian">fes\aeolian</entry>
        <entry key="-11_locrian">ges\locrian</entry>
    </xsl:variable>
    
    <!-- <mode> element -->
    <!--
    <xsl:variable name="modes">
        <entry key="major">\major</entry>
        <entry key="ionian">\ionian</entry>
        <entry key="dorian">\dorian</entry>
        <entry key="phrygian">\phrygian</entry>
        <entry key="lydian">\lydian</entry>
        <entry key="mixolydian">\mixolydian</entry>
        <entry key="minor">\minor</entry>
        <entry key="aeolian">\aeolian</entry>
        <entry key="locrian">\locrian</entry>
    </xsl:variable>
    --> <!-- end modes -->
    
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
            implicit accidentals (values of <alter>) 
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
    
    <!-- <key-step> dictionary -->
    <xsl:variable name="key-steps">
        <entry key="C">0</entry>
        <entry key="D">1</entry>
        <entry key="E">2</entry>
        <entry key="F">3</entry>
        <entry key="G">4</entry>
        <entry key="A">5</entry>
        <entry key="B">6</entry>
    </xsl:variable> <!-- end key-steps dictionary -->
    
    <!-- <key-alter> dictionary -->
    <!-- not complete! -->
    <xsl:variable name="key-alterations">
        <entry key="0">NATURAL</entry>
        <entry key="1">SHARP</entry>
        <entry key="-1">FLAT</entry>
        <entry key="2">DOUBLE-SHARP</entry>
        <entry key="-2">DOUBLE-FLAT</entry>
        <entry key="-1.5">THREE-Q-FLAT</entry>
        <entry key="-0.5">SEMI-FLAT</entry>
        <entry key="0.5">SEMI-SHARP</entry>
        <entry key="1.5">THREE-Q-SHARP</entry>
    </xsl:variable> <!-- end key-alterations dictionary -->
    
    <!-- <key-octave> dictionary -->
    <xsl:variable name="key-octaves">
        <entry key="0">-4</entry>
        <entry key="1">-3</entry>
        <entry key="2">-2</entry>
        <entry key="3">-1</entry>
        <entry key="4">0</entry>
        <entry key="5">1</entry>
        <entry key="6">2</entry>
        <entry key="7">3</entry>
        <entry key="8">4</entry>
        <entry key="9">5</entry>
    </xsl:variable> <!-- end key-steps dictionary -->
    
        
    <xsl:variable name="accidentals">
        <!-- <accidental> (explicit/reminder/courtesy/cautionary accidentals) -->
        <entry key="!">!</entry>
        <!-- cautionary parenthesized accidentals: -->
        <entry key="?">?</entry>
        <!-- cautionary accidentals in brackets: -->
        <entry key="[!]">?</entry>
        
        <!-- editorial accidentals -->
        <!-- accidental glyphs -->
        <entry key="sharp">
            <xsl:text>\sharp</xsl:text>
        </entry>
        <entry key="natural">
            <xsl:text>\natural</xsl:text>
        </entry>
        <entry key="flat">
            <xsl:text>\flat</xsl:text>
        </entry>
        <entry key="double-sharp">
            <xsl:text>\doublesharp</xsl:text>
        </entry>
        <!-- 
            Combinations of glyphs need to be concatenated
            otherwise each of them will be parenthesized 
            or bracketed when the <accidental> element contains
            a parentheses or bracket attribute.
        -->
        <entry key="sharp-sharp">
            <xsl:text>\concat {\sharp\hspace #0.05 \sharp}</xsl:text>
        </entry>
        <entry key="flat-flat">
            <xsl:text>\doubleflat</xsl:text>
        </entry>
        <entry key="natural-sharp">
            <xsl:text>\concat {\natural\hspace #0.15 \sharp}</xsl:text>
        </entry>
        <entry key="natural-flat">
            <xsl:text>\concat {\natural\hspace #0.25 \flat}</xsl:text>
        </entry>
        <entry key="quarter-flat">
            <xsl:text>\semiflat</xsl:text>
        </entry>
        <entry key="quarter-sharp">
            <xsl:text>\semisharp</xsl:text>
        </entry>
        <entry key="three-quarters-flat">
            <xsl:text>\sesquiflat</xsl:text>
        </entry>
        <entry key="three-quarters-sharp">
            <xsl:text>\sesquisharp</xsl:text>
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
            <xsl:text>\musicglyph #"accidentals.sharp.arrowdown"</xsl:text>
        </entry>
        <entry key="sharp-up">
            <xsl:text>\musicglyph #"accidentals.sharp.arrowup"</xsl:text>
        </entry>
        <entry key="natural-down">
            <xsl:text>\musicglyph #"accidentals.natural.arrowdown"</xsl:text>
        </entry>
        <entry key="natural-up">
            <xsl:text>\musicglyph #"accidentals.natural.arrowup"</xsl:text>
        </entry>
        <entry key="flat-down">
            <xsl:text>\musicglyph #"accidentals.flat.arrowdown"</xsl:text>
        </entry>
        <entry key="flat-up">
            <xsl:text>\musicglyph #"accidentals.flat.arrowup"</xsl:text>
        </entry>
        <entry key="triple-sharp">
            <xsl:text>\concat { \sharp\hspace #0.05 \doublesharp }</xsl:text>
        </entry>
            <!-- 
                Alternative: \sharp\sharp\sharp.
                I only found examples of \sharp\doublesharp
            -->
            <!--
            <xsl:text>\concat { \sharp\sharp\sharp }?</xsl:text>
            -->
        <entry key="triple-flat">
            <xsl:text>\concat { \flat\flat\flat }</xsl:text>
        </entry>
            <!-- 
                Alternative: \flat\doubleflat but
                \flat\flat\flat looks more even.
            -->
        <!-- 
            The slash- accidentals
	        are used in Turkish classical music. 
        -->
        <entry key="slash-quarter-sharp">
            <xsl:text>\musicglyph #"accidentals.sharp.slashslashslash.stem"</xsl:text>
        </entry>
        <entry key="slash-sharp">
            <xsl:text>\musicglyph #"accidentals.sharp.slashslashslash.stemstem"</xsl:text>
        </entry>
        <entry key="slash-flat">
            <xsl:text>\musicglyph #"accidentals.flat.slash"</xsl:text>
        </entry>
        <entry key="double-slash-flat">
            <xsl:text>\musicglyph #"accidentals.flat.slashslash"</xsl:text>
        </entry>
        <!-- 
            The numbered sharp and flat accidentals are superscripted versions
	        of the accidental signs, used in Turkish folk music.
        -->
        <!--
        <entry key="sharp-1">???</entry>
        -->
        <entry key="sharp-1">
            <xsl:text>\concat { \musicglyph #"accidentals.sharp"\super 1 }</xsl:text>
        </entry>
        <entry key="sharp-2">
            <xsl:text>\concat { \musicglyph #"accidentals.sharp"\super 2 }</xsl:text>
        </entry>
        <entry key="sharp-3">
            <xsl:text>\concat { \musicglyph #"accidentals.sharp"\super 3 }</xsl:text>
        </entry>
        <entry key="sharp-5">
            <xsl:text>\concat { \musicglyph #"accidentals.sharp"\super 5 }</xsl:text>
        </entry>
        <entry key="flat-1">
            <xsl:text>\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 1 }</xsl:text>
        </entry>
        <entry key="flat-2">
            <xsl:text>\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 2 }</xsl:text>
        </entry>
        <entry key="flat-3">
            <xsl:text>\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 3 }</xsl:text>
        </entry>
        <entry key="flat-4">
            <xsl:text>\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 4 }</xsl:text>
        </entry>
        <!-- 
            The sori and koron accidentals are microtonal sharp and
	        flat accidentals used in Iranian and Persian music.
        -->
        <entry key="sori">
            <xsl:text>\lower #0.9 {\override #'(thickness . 1.75) \draw-line #'(0 . 2.5) \hspace #-0.25 \override #'(thickness . 1.75) \raise #0.2 \draw-line #'(0 . 2.5) \hspace #-1.8 \raise #0.4 \fontsize #3 >}</xsl:text>
        </entry>
        <entry key="koron">
            <xsl:text> \lower #0.9 \override #'(thickness . 1.75) \draw-line #'(0 . 2.25) \hspace #-1.18 \raise #1.3  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}</xsl:text>
        </entry>
        
    </xsl:variable>
    <!--
    <xsl:variable name="divisions" select="4 div /score-partwise/part/measure/attributes/divisions" />
    -->
    
    <xsl:template match="/">
        <xsl:text>\version "2.17.95"
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
        <!-- 
            Here we need to define and include some special LilyPond 
            commands for certain accidentals.
        -->
        <xsl:choose>
            <!-- 
                This condition is not really needed anymore because 
                in the mean time I have defined some commands for the 
                accidentals listed here.
            -->
            <xsl:when test="
                //accidental='sharp-1' 
                or 
                //accidental='sharp-2'
                or 
                //accidental='sharp-3'
                or 
                //accidental='sharp-5'
                or 
                //accidental='flat-1'
                or 
                //accidental='flat-2'
                or 
                //accidental='flat-3'
                or 
                //accidental='flat-4'
                or 
                //accidental='sori'
                or 
                //accidental='koron'
                ">
                <xsl:text>      
                    
questionMark = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    ?
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #0.25
}

bracketedQuestionMark = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup\bracket {
    ?
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}

parenthesizedQuestionMark = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    ?
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.5
}
        </xsl:text>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="//accidental='sharp-sharp'">
sharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.01
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='sharp-sharp'">
parenthesizedSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.01
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='sharp-sharp'">
bracketedSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}
        </xsl:if>
        
        
        <xsl:if test="//accidental='natural-sharp'">
naturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}            
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='natural-sharp'">
parenthesizedNaturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.5
}            
        </xsl:if>
        
        <xsl:if test="//accidental='natural-flat'">
naturalFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.25
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1
}   
        </xsl:if>
        
        <xsl:if test="//accidental='sharp-down'">
sharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.arrowdown"
  }
}
        </xsl:if>
        
        <xsl:if test="//accidental='sharp-up'">
sharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.arrowup"
  }
}
        </xsl:if>
        
        <xsl:if test="//accidental='natural-down'">
naturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.natural.arrowdown"
  }
}
        </xsl:if>
        
        <xsl:if test="//accidental='natural-down'">
naturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.natural.arrowup"
  }
}
        </xsl:if>
        
        <xsl:if test="//accidental='flat-down'">
flatDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.flat.arrowdown"
  }
}
        </xsl:if>
        
        <xsl:if test="//accidental='flat-up'">
flatUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.flat.arrowup"
  }
}
        </xsl:if>
        
        <xsl:if test="//accidental='triple-sharp'">
sharpSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.5
}
            
sharpDoublesharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.2
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.8
}
        </xsl:if>
        <!--
        <xsl:if test="//accidental[@bracket='yes']='triple-sharp'">
bracketedSharpDoublesharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.2
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #5.0
}
        </xsl:if>
        -->
        <xsl:if test="//accidental[@parentheses='yes']='triple-sharp'">
parenthesizedSharpDoublesharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.2
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.1
}
        </xsl:if>
        
        <xsl:if test="//accidental='triple-flat'">
flatFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2
}
            
flatDoubleflat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flatflat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.75
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='triple-flat'">
parenthesizedFlatFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.5
}
        </xsl:if>
        
        <xsl:if test="//accidental='slash-quarter-sharp'">
slashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #.5
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='slash-quarter-sharp'">
parenthesizedSlashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        
        <xsl:if test="//accidental='slash-sharp'">
slashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.4
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='slash-sharp'">
parenthesizedSlashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.1
}
        </xsl:if>
        
        <xsl:if test="//accidental='slash-flat'">
slashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.flat.slash"
  }
% \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}
        </xsl:if>
        
        <xsl:if test="//accidental='double-slash-flat'">
doubleSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.flat.slashslash"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='sharp'">
bracketedSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='natural'">
bracketedNatural = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.natural"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='flat'">
bracketedFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.5
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='double-sharp'">
bracketedDoubleSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        
               
        
        <xsl:if test="//accidental[@bracket='yes']='flat-flat'">
bracketedFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='natural-sharp'">
bracketedNaturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.5
}
        </xsl:if>
        <!--
        <xsl:if test="//accidental[@parentheses='yes']='natural-sharp'">
parenthesizedNaturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}
        </xsl:if>
        -->
        
        <xsl:if test="//accidental[@bracket='yes']='natural-flat'">
bracketedNaturalFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.7
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='quarter-flat'">
bracketedQuarterFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.mirroredflat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='quarter-sharp'">
bracketedQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp.slashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='three-quarters-flat'">
bracketedThreeQuartersFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.mirroredflat.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='three-quarters-sharp'">
bracketedThreeQuartersSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.slashslash.stemstemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='sharp-down'">
bracketedSharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.1
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='sharp-down'">
parenthesizedSharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='sharp-up'">
parenthesizedSharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='natural-down'">
parenthesizedNaturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.natural.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='natural-up'">
parenthesizedNaturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.natural.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='flat-down'">
parenthesizedFlatDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='flat-up'">
parenthesizedFlatUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='sharp-up'">
bracketedSharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.1
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='natural-down'">
bracketedNaturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.natural.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='natural-up'">
bracketedNaturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.natural.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='flat-down'">
bracketedFlatDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='flat-up'">
bracketedFlatUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='triple-sharp'">
bracketedSharpDoublesharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2
}
            
bracketedSharpSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}            
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='triple-flat'">
bracketedFlatFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.5
}            
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='slash-quarter-sharp'">
bracketedSlashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}            
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='slash-sharp'">
bracketedSlashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}            
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='slash-flat'">
bracketedSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.slash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='slash-flat'">
parenthesizedSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.slash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='double-slash-flat'">
bracketedDoubleSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.slashslash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='double-slash-flat'">
parenthesizedDoubleSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.slashslash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        </xsl:if>
        
        <xsl:if test="//accidental='sharp-1'">
sharpOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='sharp-1'">
bracketedSharpOne = {
            \once \override Accidental.stencil = #ly:text-interface::print
            \once \override Accidental.text = \markup \bracket \concat {
            \musicglyph #"accidentals.sharp"\lower #0.3 \super 1
            }
            \once \override Staff.AccidentalPlacement #'right-padding = #0.75
            }          
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='sharp-1'">
parenthesizedSharpOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        </xsl:if>
        
        <xsl:if test="//accidental='sharp-2'">
sharpTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        <xsl:if test="//accidental[@parentheses='yes']='sharp-2'">
parenthesizedSharpTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='sharp-2'">
bracketedSharpTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        
        <xsl:if test="//accidental='sharp-3'">
sharpThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='sharp-3'">
parenthesizedSharpThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        <xsl:if test="//accidental[@bracket='yes']='sharp-3'">
bracketedSharpThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        
        <xsl:if test="//accidental='sharp-5'">
sharpFive = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 5
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='sharp-5'">
parenthesizedSharpFive = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 5
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='sharp-5'">
bracketedSharpFive = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 5
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}          
        </xsl:if>
        
        <xsl:if test="//accidental='flat-1'">
flatOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='flat-1'">
parenthesizedFlatOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='flat-1'">
bracketedFlatOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental='flat-2'">
flatTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='flat-2'">
parenthesizedFlatTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='flat-2'">
bracketedFlatTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental='flat-3'">
flatThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='flat-3'">
parenthesizedFlatThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='flat-3'">
bracketedFlatThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental='flat-4'">
flatFour = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 4
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='flat-4'">
parenthesizedFlatFour = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 4
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='flat-4'">
bracketedFlatFour = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 4
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}        
        </xsl:if>
        
        <xsl:if test="//accidental='sori'">
sori = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup   {
    \lower #1.2 {
      \override #'(thickness . 1.75)
      \draw-line #'(0 . 2.5)\hspace #-0.25
      \override #'(thickness . 1.75)
      \raise #0.2 \draw-line #'(0 . 2.5)
      \hspace #-1.8 \raise #0.4 \fontsize #3 >
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}      
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='sori'">
parenthesizedSori = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
  \musicglyph #"accidentals.leftparen"
    \lower #1.2 {
      \override #'(thickness . 1.75)
      \draw-line #'(0 . 2.5)\hspace #-0.25
      \override #'(thickness . 1.75)
      \raise #0.2 \draw-line #'(0 . 2.5)
      \hspace #-1.8 \raise #0.4 \fontsize #3 >
    }
    \hspace #-0.6
    \musicglyph #"accidentals.rightparen"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}      
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='sori'">
bracketedSori = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
  "["
    \lower #1.2 {
      \override #'(thickness . 1.75)
      \draw-line #'(0 . 2.5)\hspace #-0.25
      \override #'(thickness . 1.75)
      \raise #0.2 \draw-line #'(0 . 2.5)
      \hspace #-1.8 \raise #0.4 \fontsize #3 >
    }
    \hspace #-1.0
    "]"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.75
}      
        </xsl:if>
        
        <xsl:if test="//accidental='koron'">
koron = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup { 
    \lower #1.6
      \override #'(thickness . 1.75)
      \draw-line #'(0 . 2.25)
      \hspace #-1.18 \lower #0.2  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}   
        </xsl:if>
        
        <xsl:if test="//accidental[@parentheses='yes']='koron'">
parenthesizedKoron = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
  \musicglyph #"accidentals.leftparen"
    \lower #1.6
      \override #'(thickness . 1.75)
      \draw-line #'(0 . 2.25)
      \hspace #-1.18 \lower #0.2  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}
    \hspace #-0.6
    \musicglyph #"accidentals.rightparen"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.75
}   
        </xsl:if>
        
        <xsl:if test="//accidental[@bracket='yes']='koron'">
bracketedKoron = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
  "["
    \lower #1.6
      \override #'(thickness . 1.75)
      \draw-line #'(0 . 2.25)
      \hspace #-1.18 \lower #0.2  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}
    \hspace #-1.0
    "]"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2
}   
        </xsl:if>
        
        <!-- clefs -->
        <xsl:if test="//sign='jianpu'">
jianpu =  {
  \once \override Clef.stencil = #ly:text-interface::print
  \once \override Clef.text = \markup {
  ?
  }            
}   
        </xsl:if>

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
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {
        </xsl:text>
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
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff2Voice2" {
          </xsl:text>
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
                <xsl:text>
      \set Staff.instrumentName = #"</xsl:text>
                <xsl:value-of select="/score-partwise/part-list/score-part/part-name"/><xsl:text>"</xsl:text>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' or voice='1' or not(voice)]">
                    <xsl:text>
      \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
        </xsl:text>
                    <xsl:call-template name="SingleStaffVoice1"/>
                <xsl:text>
      }</xsl:text>
                </xsl:if>
                <!--
                <xsl:if test="/score-partwise/part/measure/note[lyric and staff='1' or voice='1' or not(voice)]">
                -->
                
                <xsl:if test="/score-partwise/part/measure/note[lyric and (staff='1' or voice='1' or not(voice))]">
                    <xsl:text>
      \new Lyrics \lyricsto "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {
        </xsl:text>
                    <xsl:call-template name="LyricsStaff1Voice1"/>
                    <xsl:text>
      }</xsl:text>
                        
                </xsl:if>
                <!--
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='2' or not(staff)]">
                -->
                <xsl:if test="/score-partwise/part/measure/note[voice='2' and (staff='1' or not(staff))]">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {
          </xsl:text>
                    <xsl:call-template name="SingleStaffVoice2"/>
                <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='3']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice3" {
          </xsl:text>
                
                <xsl:text>
        }</xsl:text>
                </xsl:if>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' and voice='4']">
                    <xsl:text>
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice4" {
          </xsl:text>
                    <xsl:text>
        }</xsl:text>
            </xsl:if>
            <xsl:text>
    &gt;&gt;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> <!-- end template part -->
    
    <xsl:template name="SingleStaffVoice1">
        <!-- 
                Check if there are <stem> elements and several
                voices.  If there are no <stem> elements but
                several voices: use \voiceOne.
            -->
        <xsl:choose>
            <xsl:when test="not(//note[stem]) and //note[voice='1'] and //note[voice='2']">
                <!--
                <xsl:text>
        </xsl:text>
        -->
                <xsl:text>\voiceOne
        </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="//rest[@measure='yes'] or //multiple-rest">
                <xsl:text>\compressFullBarRests
        </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="measure">
            <!--
            <xsl:for-each select="attributes">
                <xsl:apply-templates select="key"/>
                <xsl:apply-templates select="time"/>
                <xsl:choose>
                    <xsl:when test="clef and clef[@number='1'] or not(clef[@number])">
                        <xsl:apply-templates select="clef">
                            <xsl:with-param name="staffnumber">1</xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:when>
                </xsl:choose>
                <xsl:apply-templates select="//attributes"/>
            </xsl:for-each>
            --><!-- end for-each attributes -->
            <!-- 
                The call-template pickup command should not be placed here
                because this way it will be called for each and every measure
                unless the XPath expression is corrected...
            -->
            <xsl:call-template name="pickup"/>
            <!--
            <xsl:text>
        </xsl:text>
        -->
            <xsl:apply-templates select="note">
                <xsl:with-param name="voice">1</xsl:with-param>
                <xsl:with-param name="staff">1</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                measure completion template does not work with
                several <divisions> or <backup> elements.  Needs work!
            -->
            <!--
            <xsl:call-template name="measure-completion">
                <xsl:with-param name="voice">1</xsl:with-param>
            </xsl:call-template>
            -->
            <!-- 
                    bar check and bar number (|%1) 
                    in case of pickup measures (partial measures) 
                    the bar number should be 0.  It would be good if
                    wrong bar numbers were corrected automatically.
                -->
            <xsl:text> &#124;&#37;</xsl:text>
            <xsl:value-of select="@number"/>
            <!--
            <xsl:text>    </xsl:text>
            -->
            <xsl:apply-templates select="barline"/>
            <xsl:text>
        </xsl:text>
        </xsl:for-each> <!-- for-each measure -->
    </xsl:template> <!-- end template SingleStaffVoice1 -->
    
    <xsl:template name="SingleStaffVoice2">
        <!-- 
                Check if there are <stem> elements and several
                voices.  If there are no <stem> elements but
                several voices: use \voiceOne.
            -->
        <xsl:choose>
            <xsl:when test="not(//note[stem]) and //note[voice='1'] and //note[voice='2']">
                <!--
                <xsl:text>
        </xsl:text>
        -->
                <xsl:text>\voiceTwo
          </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="//rest[@measure='yes'] or //multiple-rest">
                <xsl:text>
        \compressFullBarRests</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="measure">
            <!--
            <xsl:for-each select="attributes">
                <xsl:if test="key">
                    <xsl:apply-templates select="key"/>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                <xsl:if test="time">
                    <xsl:apply-templates select="time"/>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                
                <xsl:choose>
                    <xsl:when test="clef and clef[@number='1'] or not(clef[@number])">
                        <xsl:apply-templates select="clef">
                            <xsl:with-param name="staffnumber">1</xsl:with-param>
                        </xsl:apply-templates>
                        <xsl:text>  </xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:apply-templates select="//attributes"/>
            </xsl:for-each>--> <!-- for-each attributes -->
            <!-- 
                The call-template pickup command should not be placed here
                because this way it will be called for each and every measure...
            -->
            <xsl:call-template name="pickup"/>
            <!--
            <xsl:text>
        </xsl:text>
        -->
            <xsl:apply-templates select="note">
                <xsl:with-param name="voice">2</xsl:with-param>
                <xsl:with-param name="staff">1</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                The measure-completion template should not be called
                in pickup measures.  It might be necessary to add a
                condition later in case the attribute number="0" is
                missing...
            -->
            <!-- 
                measure completion template does not work with
                several <divisions> or <backup> elements.  Needs work!
            -->
            <!--
            <xsl:if test="not(.[@number='0'])">
                <xsl:call-template name="measure-completion">
                    <xsl:with-param name="voice">2</xsl:with-param>
                </xsl:call-template>
            </xsl:if>
            -->
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
            <xsl:text>
        </xsl:text>
        </xsl:for-each> <!-- for-each measure -->
    </xsl:template> <!-- end template SingleStaffVoice2 -->
    
    <xsl:template name="LyricsStaff1Voice1">
        <xsl:for-each select="measure">
            <xsl:for-each select="note">
                <xsl:apply-templates select="lyric"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="Staff1Voice1">
        <xsl:choose>
            <xsl:when test="not(.[stem]) and .[voice='1' and voice='2']">
                <xsl:text>
        </xsl:text>
                <xsl:text>\voiceOne</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="//rest[@measure='yes'] or //multiple-rest">
                <xsl:text>
        \compressFullBarRests</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="measure">
            <!--
            <xsl:text>    </xsl:text>
            -->
            <xsl:text>
          </xsl:text>
            <!--
            <xsl:for-each select="attributes">
                <xsl:if test="key">
                    <xsl:apply-templates select="key">
                        <xsl:with-param name="staffnumber">1</xsl:with-param>
                    </xsl:apply-templates>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                <xsl:if test="time">
                    <xsl:apply-templates select="time"/>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                <xsl:if test="clef">
                    <xsl:apply-templates select="clef">
                        <xsl:with-param name="staffnumber">1</xsl:with-param>
                    </xsl:apply-templates>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                -->
                
                <!--
                <xsl:apply-templates select="//attributes"/>
                -->
                <!--
                <xsl:text>
        </xsl:text>
        -->
            <!--
            </xsl:for-each>--> <!-- for-each attributes -->
            <xsl:call-template name="pickup"/>
            <xsl:apply-templates select="note">
                <xsl:with-param name="staff">1</xsl:with-param>
                <xsl:with-param name="voice">1</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                The measure-completion template should not be called
                in pickup measures.  It might be necessary to add a
                condition later in case the attribute number="0" is
                missing...
            -->
            <!-- 
                measure completion template does not work with
                several <divisions> or <backup> elements.  Needs work!
            -->
            <!--
            <xsl:if test="not(.[@number='0'])">
                <xsl:call-template name="measure-completion"/>
            </xsl:if>
            -->
            <!-- 
                    bar check and bar number (|%1) 
                    in case of pickup measures (partial measures) 
                    the bar number should be 0.  It would be good if
                    wrong bar numbers were corrected automatically.
                -->
            <xsl:text>&#124;&#37;</xsl:text>
            <xsl:value-of select="@number"/>
            <xsl:choose>
                <xsl:when test=".[@number='0']">
                    <xsl:text>  </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>
          </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="barline"/>
        </xsl:for-each> <!-- for-each measure -->
    </xsl:template> <!-- end template Staff1Voice1 -->
    
    <xsl:template name="Staff2Voice2">
        <xsl:choose>
            <xsl:when test="not(.[stem]) and .[voice='1' and voice='2']">
                <xsl:text>
        </xsl:text>
                <xsl:text>\voiceTwo</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="//rest[@measure='yes'] or //multiple-rest">
                <xsl:text>
        \compressFullBarRests</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="measure">
            <!--
            <xsl:for-each select="attributes">
                <xsl:text>
          </xsl:text>
                <xsl:if test="key">
                    <xsl:apply-templates select="key">
                        <xsl:with-param name="staffnumber">1</xsl:with-param>
                    </xsl:apply-templates>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                <xsl:if test="time">
                    <xsl:apply-templates select="time"/>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                <xsl:if test="clef">
                    <xsl:apply-templates select="clef">
                        <xsl:with-param name="staffnumber">2</xsl:with-param>
                    </xsl:apply-templates>
                    <xsl:text>  </xsl:text>
                </xsl:if>
                -->
                <!--
                <xsl:apply-templates select="//attributes"/>
                -->
                <!--
                <xsl:text>
        </xsl:text>
        -->
            <!--
            </xsl:for-each> --><!-- for-each attributes -->
            <xsl:variable name="attributes">
                <xsl:value-of select="count(./attributes)"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$attributes = 1">
                    <xsl:apply-templates select="attributes">
                        <xsl:with-param name="staff">2</xsl:with-param>
                    </xsl:apply-templates>
                </xsl:when>
            </xsl:choose>
            
            
            <xsl:call-template name="pickup"/>
            <xsl:apply-templates select="note">
                <xsl:with-param name="staff">2</xsl:with-param>
                <xsl:with-param name="voice">2</xsl:with-param>
            </xsl:apply-templates>
            <!-- 
                The measure-completion template should not be called
                in pickup measures.  It might be necessary to add a
                condition later in case the attribute number="0" is
                missing...
            -->
            <!-- 
                measure completion template does not work with
                several <divisions> or <backup> elements.  Needs work!
            -->
            <!--
            <xsl:if test="not(.[@number='0'])">
                <xsl:call-template name="measure-completion">
                    <xsl:with-param name="voice">2</xsl:with-param>
                </xsl:call-template>
            </xsl:if>
            -->
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
    
    <xsl:template match="attributes">
        <xsl:param name="staff"/>
        <xsl:apply-templates select="key">
            <xsl:with-param name="staff">
                <xsl:value-of select="$staff"/>
            </xsl:with-param>
        </xsl:apply-templates>
        <xsl:apply-templates select="time">
            <xsl:with-param name="staff"/>
        </xsl:apply-templates>
        <xsl:apply-templates select="clef">
            <xsl:with-param name="staff">
                <xsl:value-of select="$staff"/>
            </xsl:with-param>
        </xsl:apply-templates>
        
        <!--
            If the time element is missing we assume that a
            4/4 time signature is requested.  A \time 4/4
            command should end up in the LilyPond file.  
            Strictly speaking this command is not really
            necessary as 4/4 is the default time signature
            in LilyPond.
        -->
        <!-- test -->
        <!--
        time: <xsl:value-of select="//time"/>
        -->
        <!--
        <xsl:choose>
            <xsl:when test="not(//time) and not(measure[@number='0'])">
                <xsl:call-template name="time-signature-calculator">
                    <xsl:with-param name="decimalnum" select="
                        sum(../note[staff='1' or not(staff) or voice='1' or not(voice)]/duration) 
                        * 
                        0.25 
                        div 
                        divisions"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
        -->
        <!--
        <xsl:choose>
            <xsl:when test=". and following-sibling::*[1]note">
                <xsl:text>pups</xsl:text>
            </xsl:when>
        </xsl:choose>
        -->
    </xsl:template> <!-- end attributes template -->
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
    
    <xsl:template match="key-octave">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <!--
    <xsl:template name="loop">
        <xsl:param name="i"/>
        <xsl:param name="limit"/>
        <xsl:if test="$i &lt;= $limit">
            <div>
                <xsl:value-of select="$i"/>
            </div>
            <xsl:call-template name="loop">
                <xsl:with-param name="i" select="$i+1"/>
                <xsl:with-param name="limit" select="$limit"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    -->
    
    <xsl:template match="key">
        <xsl:param name="staff"/>
        <!--
        <xsl:variable name="counter" select="1" saxon:assignable="yes"/>
        -->
        <xsl:variable name="key">
            <xsl:choose>
                <xsl:when test=". and ./fifths and ./mode">
                    <xsl:value-of select="./fifths"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./mode"/>
                </xsl:when>
                <xsl:when test=". and ./fifths and not(./mode)">
                    <xsl:value-of select="./fifths"/>
                    <xsl:text>_major</xsl:text>
                </xsl:when>
                <xsl:when test=". and ./mode and not(./fifths)">
                    <xsl:text>0_</xsl:text>
                    <xsl:value-of select="./mode"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <!--
                It's not uncommon that information on key signatures
                is incomplete.  In this case we have to guess.
                This could be corrected with music21.  music21
                provides a method to compute key signatures.
            -->
            <xsl:when test="@number=$staff and $key">
                <xsl:text>\key </xsl:text>
                <xsl:value-of select="$keys/entry[@key=$key]"/>
                <xsl:text>
      </xsl:text>
            </xsl:when>
            <xsl:when test=". and ./key-step and ./key-alter and ./key-octave">
                <!--
                <xsl:for-each select="./key-step">
                -->
                <xsl:variable name="counter" select="count(//key-octave)"/>
                <!--
                <xsl:value-of select="$counter"/>
                -->
                <xsl:choose>
                    <xsl:when test="$counter gt 1">
                        <xsl:text>\set Staff.keySignature = #`(</xsl:text>
                        <xsl:if test="./key-octave[@number='1']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='1']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[1]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[1]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='2']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='2']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[2]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[2]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='3']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='3']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[3]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[3]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='4']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='4']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[4]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[4]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='5']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='5']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[5]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[5]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='6']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='6']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[6]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[6]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='7']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='7']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[7]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[7]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='8']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='8']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[8]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[8]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='9']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='9']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[9]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[9]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:if test="./key-octave[@number='10']">
                            <xsl:text>((</xsl:text>
                            <xsl:variable name="key-octave">
                                <xsl:value-of select="key-octave[@number='10']"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-octaves/entry[@key=$key-octave]"/>
                            <xsl:text> . </xsl:text>
                            <xsl:variable name="key-step">
                                <xsl:value-of select="./key-step[10]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                            <xsl:text>). ,</xsl:text>
                            <xsl:variable name="key-alter">
                                <xsl:value-of select="./key-alter[10]"/>
                            </xsl:variable>
                            <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:text>)
        </xsl:text>
                    </xsl:when>
                </xsl:choose>
                    
                    <!--
                        <xsl:apply-templates select="following-sibling::key-octave"/>
                    <xsl:call-template name="loop">
                        <xsl:with-param name="i" select="1"/>
                        <xsl:with-param name="limit" select="5"/>
                        
                    </xsl:call-template>
                    -->
                    <!--
                        <xsl:value-of select="following-sibling::key-octave[@number=&lt;xsl:call-template name="loop"/&gt;]"/>
                        -->
                    <!--
                    <xsl:if test="$loop &lt; $counter">
                        
                    </xsl:if>
                    -->
                    <!--
                    <xsl:variable name="i" select="$i+1"/>
                    -->
                   
                    <!--
                    <xsl:apply-templates select="following-sibling::key-octave/position()"/>
                    -->
                    <!--<xsl:value-of select="$number+1"/>-->
                    <!--
                    <xsl:value-of select="."/>
                    <saxon:assign name="counter" select="$counter+1"/>
                    -->
                <!--
                </xsl:for-each>
                -->
            </xsl:when>
            <!--
            <xsl:when test=". and ./key-step and ./key-alter and ./key-octave">
                <xsl:text>\set Staff.keySignature = #'(</xsl:text>
                <xsl:for-each select="./key-octave">
                    <xsl:text>(</xsl:text>
                    <xsl:text>(</xsl:text>
                    <xsl:variable name="key-octave">
                        <xsl:value-of select="./self::key-octave"/>
                    </xsl:variable>
                    <xsl:value-of select="$key-octave"/>
                    <xsl:text> . </xsl:text>
                    <xsl:variable name="key-step">
                        <xsl:value-of select="preceding::key-step"/>
                    </xsl:variable>
                    <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                    <xsl:text>)</xsl:text>
                    <xsl:text> . ,</xsl:text>
                    <xsl:variable name="key-alter">
                        <xsl:value-of select="preceding::key-alter"/>
                    </xsl:variable>
                    <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                    <xsl:text>)</xsl:text>
                </xsl:for-each>
                -->
                <!--
                <xsl:for-each select="./key-step">
                    
                </xsl:for-each>
                <xsl:for-each select="./key-alter">
                    
                </xsl:for-each>
                    -->
                <!--
                <xsl:text>)
        </xsl:text>
            </xsl:when>
            -->
            <xsl:when test=". and ./key-step and ./key-alter and not(./key-octave)">
                <xsl:text>\set Staff.keySignature = #`(</xsl:text>
                <xsl:for-each select="./key-step">
                    <xsl:text>(</xsl:text>
                    <xsl:variable name="key-step">
                        <xsl:value-of select="./self::key-step"/>
                    </xsl:variable>
                    <xsl:value-of select="$key-steps/entry[@key=$key-step]"/>
                    <xsl:text> . ,</xsl:text>
                    <xsl:variable name="key-alter">
                        <xsl:value-of select="following-sibling::key-alter[1]"/>
                    </xsl:variable>
                    <xsl:value-of select="$key-alterations/entry[@key=$key-alter]"/>
                    <xsl:text>)</xsl:text>
                </xsl:for-each>
                <xsl:text>)
        </xsl:text>
            </xsl:when>
            <xsl:when test="$key and not(./key-step or ./key-alter or ./key-octave)">
                <xsl:text>\key </xsl:text>
                <xsl:value-of select="$keys/entry[@key=$key]"/>
                <xsl:text>
        </xsl:text>
            </xsl:when>                
        </xsl:choose>  
    </xsl:template> <!-- end template key -->
    
    <xsl:template match="time">
        <xsl:param name="staff"/>
        <!-- 
            I want to declare a variable for the output 
            of LilyPond time signatures so that I can just
            call e.g. $time instead of typing:
            
                <xsl:text>
                </xsl:text>
                <xsl:text>\time </xsl:text>
                <xsl:value-of select="beats"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="beat-type"/>
        
            over and over again in various conditions.  
            Is this rather a case for a function or a 
            named template???
        -->
        <!-- 
            Regular expressions are needed to differentiate
            between simple and compound time signatures.
        -->
        <xsl:variable name="time">
            <xsl:choose>
                <!-- complex time signatures -->
                <xsl:when test="count(beats) gt 1">
                    <xsl:text>\compoundMeter #'(</xsl:text>
                    <xsl:for-each select="beats">
                        <xsl:if test="matches(., '\d+( *\+ *\d*)*') 
                            and 
                            following-sibling::beat-type[matches(., '\d+')]">    
                            <xsl:text>(</xsl:text>
                            <xsl:value-of select="replace(., '\+',' ')"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="following-sibling::beat-type[1]"/>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>)
        </xsl:text>
                </xsl:when>
                <!-- simple compound time signatures -->
                <!-- 
                    If there is a simple compound time signature
                    like 3+2/8 it has to result in
                    \compoundMeter #'((3 2 8)).  In case there are
                    one or several white space between the plus signs
                    they should be replaced with just one space.
                -->
                
                <xsl:when test="
                    beats[matches(., '\d+( *\+ *\d*)+')] 
                    and 
                    beat-type[matches(., '\d+')]">
                    <xsl:text>\compoundMeter #'((</xsl:text>
                    <xsl:value-of select="replace(beats, ' *\+ *',' ')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="beat-type"/>
                    <xsl:text>))
        </xsl:text>
                </xsl:when>
                
                <!-- 
                    simple time signatures with attribute "single-number"
                -->
                <xsl:when test="
                    beats[matches(., '\d+')] 
                    and
                    .[@symbol='single-number']
                    and 
                    beat-type[matches(., '\d+')] and count(beats) eq 1">
                    <!--
                    <xsl:text>
        </xsl:text>
        -->
                    <xsl:text>\once \override Staff.TimeSignature.style = #'single-digit
        \time </xsl:text>
                    <xsl:value-of select="beats"/>
                    <xsl:text>/</xsl:text>
                    <xsl:value-of select="beat-type"/>
                </xsl:when>
                
                <!-- simple time signatures -->
                <xsl:when test="beats[matches(., '\d+')] 
                    and 
                    beat-type[matches(., '\d+')] and count(beats) eq 1">
                    <!--
                    <xsl:text>
        </xsl:text>
        -->
                    <xsl:text>\time </xsl:text>
                    <xsl:value-of select="beats"/>
                    <xsl:text>/</xsl:text>
                    <xsl:value-of select="beat-type"/>
                    <xsl:text>
        </xsl:text>
                </xsl:when>
                <!-- senza misura -->
                <xsl:when test="./senza-misura">
                    <xsl:text>\once \override Score.TimeSignature #'stencil = ##f
        \cadenzaOn
        </xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- 
            Right now I can think of only two cases where
            \once \numericTimeSignature is necessary:
            a) 4/4 without symbol="common"
            b) 2/2 without symbol="cut"
            
            "common" and "cut" seem to be the only exceptions
            that don't lead to a numeric time signature.
            Even though "common" only applies to 4/4 and "cut" can
            only be used with 2/2 they sometimes get mixed up, e.g.:
            11a-TimeSignatures.xml.  These errors have to be
            taken into consideration.
        -->
        <xsl:choose>
            <xsl:when test="
                 (not(.[@symbol='common'] or .[@symbol='cut'])
                 and
                 ./beats='4'
                 and
                 ./beat-type='4'
                 )
                 or
                 (not(.[@symbol='common'] or .[@symbol='cut'])
                 and
                 ./beats='2'
                 and
                 ./beat-type='2')">
                <xsl:text>\once \numericTimeSignature
        </xsl:text>
                <xsl:value-of select="$time"/>
            </xsl:when>
            <xsl:otherwise>
                <!--
                <xsl:text>
        </xsl:text>
        -->
                <xsl:value-of select="$time"/>
                <!--
                <xsl:text>
        </xsl:text>
        -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> <!-- end template time -->
    
    <xsl:template match="clef">
        <xsl:param name="staff"/>
        <xsl:variable name="clef">
            <xsl:choose>
                <xsl:when test="./sign and ./line and ./clef-octave-change">
                    <xsl:value-of select="./sign"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./line"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./clef-octave-change"/>
                </xsl:when>
                
                <xsl:when test="./sign and ./line and @number=$staff">
                    <xsl:value-of select="./sign"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./line"/>
                </xsl:when>
                
                <xsl:when test="./sign and ./line">
                    <xsl:value-of select="./sign"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./line"/>
                </xsl:when>
                <xsl:when test="./sign and not(./line)">
                    <xsl:value-of select="./sign"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <!--
            <xsl:when test=".">
                <xsl:text>\clef </xsl:text>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
            </xsl:when>
            -->
            <xsl:when test="./sign='none'">
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
                <xsl:text>
        </xsl:text>
            </xsl:when>
            <xsl:when test="./sign='jianpu'">
                <xsl:text>\jianpu
        \clef </xsl:text>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
                <xsl:text>
        </xsl:text>
            </xsl:when>
            <xsl:when test=". and @number=$staff and not(./sign='none')">
                <!--
                <xsl:text>
        </xsl:text>
        -->
                <xsl:text>\clef </xsl:text>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
                <xsl:text>
        </xsl:text>
            </xsl:when>
            <!-- 
                We have a problem when there are several clefs for
                several staves but no clef numbers!
            -->
            <xsl:when test=". and not(@number) and not(./sign='none')">
                <!--
                <xsl:text>
        </xsl:text>
        -->
                <xsl:text>\clef </xsl:text>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
                <xsl:text>
        </xsl:text>
            </xsl:when>
            <!--
            <xsl:otherwise>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
            </xsl:otherwise>
            -->
        </xsl:choose>
    </xsl:template> <!-- end template clef -->
    
    <!--
    <xsl:template match="measure-style">
    -->
        <!-- 
            This probably has to be moved to the note template
            in order to compute the multi measure rests...
        -->
    <!--
        <xsl:choose>
            <xsl:when test="multiple-rest">
                <xsl:text>\compressFullBarRests
        </xsl:text></xsl:when>
        </xsl:choose>
    </xsl:template>--> <!-- end template measure-style -->
    
    <xsl:template match="note">
        <xsl:param name="staff"/>
        <xsl:param name="voice"/>
        <!-- 
            <attributes> can be placed in front of every note.
            We need to test this for every note. If there is 
            only a single voice this is easy.  When there are
            several voices it gets nitty-gritty.
        -->
        <xsl:choose>
            
            <xsl:when test=". and preceding-sibling::*[1][self::attributes] and (.[voice=$voice] or .[staff=$staff])">
                <xsl:apply-templates select="preceding-sibling::*[1][self::attributes]/key"/>
                <xsl:apply-templates select="preceding-sibling::*[1][self::attributes]/time"/>
                <xsl:apply-templates select="preceding-sibling::*[1][self::attributes]/clef[@number='1']">
                    <xsl:with-param name="staff">1</xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            
            <!-- 
                The following is plain wrong! I'm simply asking 2 questions: 
                a) Is there a note element containing a voice or staff 
                element with value 2?
                b) Is there an attributes element somewhere before this
                note element?
                This is bound to be always true in polyphonic situations.
                Therefore key, clef and time of all voices / staves are 
                printed for each note in all voices except the last.  
                Wrong approach.
            -->
            <!--
            <xsl:when test=".[voice='2' or staff='2'] and preceding-sibling::*[self::attributes]">
                <xsl:apply-templates select="preceding-sibling::*[self::attributes]/key">
                    <xsl:with-param name="staff">2</xsl:with-param>
                </xsl:apply-templates>
                <xsl:apply-templates select="preceding-sibling::*[self::attributes]/time">
                    <xsl:with-param name="staff">2</xsl:with-param>
                </xsl:apply-templates>
                <xsl:apply-templates select="preceding-sibling::*[self::attributes]/clef">
                    <xsl:with-param name="staff">2</xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            -->
            <!--
            <xsl:when test=".[voice='2'] and preceding-sibling::*[self::attributes]">
                <xsl:apply-templates select="preceding-sibling::*[self::attributes]/key">
                    <xsl:with-param name="voice">2</xsl:with-param>
                </xsl:apply-templates>
                <xsl:apply-templates select="preceding-sibling::*[self::attributes]/time">
                    <xsl:with-param name="voice">2</xsl:with-param>
                </xsl:apply-templates>
                <xsl:apply-templates select="preceding-sibling::*[self::attributes]/clef">
                    <xsl:with-param name="voice">2</xsl:with-param>
                </xsl:apply-templates>
            </xsl:when>
            -->
        </xsl:choose>
        
        <!-- test -->
        <!--
        <xsl:text>attributes: </xsl:text>
        -->
        <!--
        <xsl:variable name="attributes">
            <xsl:value-of select="count(//attributes)"/>
        </xsl:variable>
        <xsl:if test="$attributes != 1">pups</xsl:if>
        -->
        <!--
        
        -->
        <!-- 
            As backup elements don't include voice or staff elements 
            we have to check if there is a backup element right before
            a note belonging to a different staff or voice.
            
            I just replaced <xsl:apply-templates select="//backup"/> with
            <xsl:apply-templates select="preceding-sibling::*[1][self::backup]"/>
            to make sure that the backup template is not called for each and
            every backup element in the score.
        -->
        <xsl:choose>
            <xsl:when test="preceding-sibling::*[1][self::backup] and .[voice=$voice]">
                <xsl:apply-templates select="preceding-sibling::*[1][self::backup]"/>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test=".[staff=$staff] and .[voice=$voice or not(voice)]">
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
            <xsl:when test="duration and not(type) and (.[staff=$staff] or .[voice=$voice])">
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="0.25 div /score-partwise/part/measure/attributes/divisions * duration"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
        
        
        <!--
        <xsl:apply-templates select="rest"/>
        -->
        <!--
        <xsl:choose>
            <xsl:when test=".[voice=$voice] or not(.[voice])">
                <xsl:apply-templates select="lyric"/>
            </xsl:when>
        </xsl:choose>
        -->
        <xsl:apply-templates select="dot"/>
        <xsl:choose>
            <xsl:when test=".[voice=$voice]">
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:apply-templates select="tie"/>
        <xsl:call-template name="editorial"/>
        <!--
        <xsl:call-template name="measure-completion"/>
        -->
    </xsl:template> <!-- end template note -->
    
    <xsl:template match="pitch">
        <!-- 
            In LilyPond not all accidentals can be called by pitch
            names.  New pitch names could be defined to do so.
            For the time being we stick with the default pitch names
            and override the default accidentals to show the ones
            requested by the MusicXML file even though this will result
            in wrong pitches in MIDI files.
        -->
        <!-- 
            Quite a few accidentals need an extra command to be typeset 
            in brackets or parentheses.  Some of them need a special
            command to show up at all.  Some accidentals like flat and
            sharp only need a special command to be surrounded by brackets.
        -->
        <xsl:choose>
            <xsl:when test="../accidental[@bracket='yes']='sharp'">
                <xsl:text>\bracketedSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='natural'">
                <xsl:text>\bracketedNatural </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat'">
                <xsl:text>\bracketedFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='double-sharp'">
                <xsl:text>\bracketedDoubleSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-sharp'">
                <xsl:text>\bracketedSharpSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-sharp'">
                <xsl:text>\parenthesizedSharpSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-sharp'">
                <xsl:text>\sharpSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-flat'">
                <xsl:text>\bracketedFlatFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='natural-sharp'">
                <xsl:text>\bracketedNaturalSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='natural-sharp'">
                <xsl:text>\parenthesizedNaturalSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='natural-sharp'">
                <xsl:text>\naturalSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='natural-flat'">
                <xsl:text>\bracketedNaturalFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='quarter-flat'">
                <xsl:text>\bracketedQuarterFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='quarter-sharp'">
                <xsl:text>\bracketedQuarterSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='three-quarters-flat'">
                <xsl:text>\bracketedThreeQuartersFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='three-quarters-sharp'">
                <xsl:text>\bracketedThreeQuartersSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-down'">
                <xsl:text>\bracketedSharpDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-down'">
                <xsl:text>\parenthesizedSharpDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-down'">
                <xsl:text>\sharpDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-up'">
                <xsl:text>\bracketedSharpUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-up'">
                <xsl:text>\parenthesizedSharpUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-up'">
                <xsl:text>\sharpUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='natural-down'">
                <xsl:text>\bracketedNaturalDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='natural-down'">
                <xsl:text>\parenthesizedNaturalDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='natural-down'">
                <xsl:text>\naturalDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='natural-up'">
                <xsl:text>\bracketedNaturalUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='natural-up'">
                <xsl:text>\parenthesizedNaturalUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='natural-up'">
                <xsl:text>\naturalUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-down'">
                <xsl:text>\bracketedFlatDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='flat-down'">
                <xsl:text>\parenthesizedFlatDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='flat-down'">
                <xsl:text>\flatDown </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-up'">
                <xsl:text>\bracketedFlatUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='flat-up'">
                <xsl:text>\parenthesizedFlatUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='flat-up'">
                <xsl:text>\flatUp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='triple-sharp'">
                <xsl:text>\bracketedSharpDoublesharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='triple-sharp'">
                <xsl:text>\parenthesizedSharpDoublesharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='triple-sharp'">
                <xsl:text>\sharpDoublesharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='triple-flat'">
                <xsl:text>\bracketedFlatFlatFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='triple-flat'">
                <xsl:text>\parenthesizedFlatFlatFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='triple-flat'">
                <xsl:text>\flatFlatFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='slash-quarter-sharp'">
                <xsl:text>\bracketedSlashQuarterSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='slash-quarter-sharp'">
                <xsl:text>\parenthesizedSlashQuarterSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='slash-quarter-sharp'">
                <xsl:text>\slashQuarterSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='slash-sharp'">
                <xsl:text>\bracketedSlashSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='slash-sharp'">
                <xsl:text>\parenthesizedSlashSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='slash-sharp'">
                <xsl:text>\slashSharp </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='slash-flat'">
                <xsl:text>\bracketedSlashFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='slash-flat'">
                <xsl:text>\parenthesizedSlashFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='slash-flat'">
                <xsl:text>\slashFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='double-slash-flat'">
                <xsl:text>\bracketedDoubleSlashFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='double-slash-flat'">
                <xsl:text>\parenthesizedDoubleSlashFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='double-slash-flat'">
                <xsl:text>\doubleSlashFlat </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-1'">
                <xsl:text>\bracketedSharpOne </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-1'">
                <xsl:text>\parenthesizedSharpOne </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-1'">
                <xsl:text>\sharpOne </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-2'">
                <xsl:text>\bracketedSharpTwo </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-2'">
                <xsl:text>\parenthesizedSharpTwo </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-2'">
                <xsl:text>\sharpTwo </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-3'">
                <xsl:text>\bracketedSharpThree </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-3'">
                <xsl:text>\parenthesizedSharpThree </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-3'">
                <xsl:text>\sharpThree </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='sharp-5'">
                <xsl:text>\bracketedSharpFive </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sharp-5'">
                <xsl:text>\parenthesizedSharpFive </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sharp-5'">
                <xsl:text>\sharpFive </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-1'">
                <xsl:text>\bracketedFlatOne </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='flat-1'">
                <xsl:text>\parenthesizedFlatOne </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='flat-1'">
                <xsl:text>\flatOne </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-2'">
                <xsl:text>\bracketedFlatTwo </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='flat-2'">
                <xsl:text>\parenthesizedFlatTwo </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='flat-2'">
                <xsl:text>\flatTwo </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-3'">
                <xsl:text>\bracketedFlatThree </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='flat-3'">
                <xsl:text>\parenthesizedFlatThree </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='flat-3'">
                <xsl:text>\flatThree </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@bracket='yes']='flat-4'">
                <xsl:text>\bracketedFlatFour </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='flat-4'">
                <xsl:text>\parenthesizedFlatFour </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='flat-4'">
                <xsl:text>\flatFour </xsl:text>
            </xsl:when>
            
            <xsl:when test="../accidental[@bracket='yes']='sori'">
                <xsl:text>\bracketedSori </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='sori'">
                <xsl:text>\parenthesizedSori </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='sori'">
                <xsl:text>\sori </xsl:text>
            </xsl:when>
            
            <xsl:when test="../accidental[@bracket='yes']='koron'">
                <xsl:text>\bracketedKoron </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental[@parentheses='yes']='koron'">
                <xsl:text>\parenthesizedKoron </xsl:text>
            </xsl:when>
            <xsl:when test="../accidental='koron'">
                <xsl:text>\koron </xsl:text>
            </xsl:when>
            
            <!-- not needed anymore -->
            <!--
            <xsl:when test="(
                ../accidental='sharp-1'
                or
                ../accidental='sharp-2'
                or
                ../accidental='sharp-3'
                or
                ../accidental='sharp-5'
                or
                ../accidental='flat-1'
                or
                ../accidental='flat-2'
                or
                ../accidental='flat-3'
                or
                ../accidental='flat-4'
                or
                ../accidental='sori'
                or
                ../accidental='koron'
                )
                and
                ../accidental[@parentheses='yes']
                ">
                <xsl:text>\parenthesizedQuestionMark </xsl:text>
            </xsl:when>
            <xsl:when test="(
                ../accidental='sharp-1'
                or
                ../accidental='sharp-2'
                or
                ../accidental='sharp-3'
                or
                ../accidental='sharp-5'
                or
                ../accidental='flat-1'
                or
                ../accidental='flat-2'
                or
                ../accidental='flat-3'
                or
                ../accidental='flat-4'
                or
                ../accidental='sori'
                or
                ../accidental='koron'
                )
                and
                ../accidental[@bracket='yes']
                ">
                <xsl:text>\bracketedQuestionMark </xsl:text>
            </xsl:when>
            -->
            <!--
            <xsl:when test="(
                ../accidental='sharp-1'
                or
                ../accidental='sharp-2'
                or
                ../accidental='sharp-3'
                or
                ../accidental='sharp-5'
                or
                ../accidental='flat-1'
                or
                ../accidental='flat-2'
                or
                ../accidental='flat-3'
                or
                ../accidental='flat-4'
                or
                ../accidental='sori'
                or
                ../accidental='koron'
                )
                ">
                <xsl:text>\questionMark </xsl:text>
            </xsl:when>
            -->
        </xsl:choose>
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
        <!--
            Check if the <rest> element has the following child elements:
            <display-step>
            <display-octave>
            
            These elements are needed to place rests (and other unpitched
            elements) on the staff.
            In LilyPond pitched rests have the syntax:
            pitch-octave-duration[dots]\rest, e.g.: c'4\rest
        -->
        
        <xsl:variable name="rest">
            <xsl:choose>
                <xsl:when test=". and ./display-step and ./display-octave">
                    <xsl:text>rest</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="display-octave">
            <xsl:choose>
                <xsl:when test=". and ./display-octave">
                    <xsl:value-of select="./display-octave"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test=". and ./display-step and ./display-octave">
                <xsl:value-of select="lower-case(./display-step)"/>
                <xsl:value-of select="$octaves/entry[@key=$display-octave]"/>
                <!--
                <xsl:value-of select="$rests/entry[@key=$rest]"/>
                -->
            </xsl:when>
            <!-- 
                If the measure attribute [of the rest element] 
                is set to yes, this indicates this is a 
                complete measure rest. 
                [http://www.musicxml.com/UserManuals/MusicXML/MusicXML.htm#EL-MusicXML-rest.htm]
            -->
            <!-- 
                Some files incorrectly use the <multiple-rest> element to indicate
                full measure rests.
            -->
            <xsl:when test=".[@measure='yes'] or ../../attributes/measure-style/multiple-rest">
                <xsl:value-of select="$rests/entry[@key='R']"/>
            </xsl:when>
            <xsl:when test=".">
                <xsl:value-of select="$rests/entry[@key='r']"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template> <!-- end template rest -->
    
    <xsl:template match="type">
        <!-- type (graphic note duration) -->
        <xsl:variable name="type">
            <xsl:value-of select="."/>
        </xsl:variable>
        <!--
             Rests with a display-step need to be treated first,
             because they need to be transformed with a "\rest".
        -->
        <xsl:choose>
            <xsl:when test="../rest/display-step or ../rest/display-octave and .">
                <xsl:value-of select="$types/entry[@key=$type]"/>
                <xsl:value-of select="$rests/entry[@key='rest']"/>
                <!--
                <xsl:text> </xsl:text>
                -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$types/entry[@key=$type]"/>
            </xsl:otherwise>
        </xsl:choose>
        
        
        <!-- In case the type element is missing: -->
        <!-- Check whether there is a duration element.
                            Calculate the value of the LilyPond Duration:
                            1/4/divisions * duration
                        -->
           
        
        
        <!-- <xsl:value-of select="0.25 div /score-partwise/part/measure/attributes/divisions * duration"/> -->    
        <!--
                        <xsl:when test="type=''">\longa</xsl:when>
                        -->
        <!--
        </xsl:choose>
        -->
        <!--
        <xsl:value-of select="0.25 div /score-partwise/part/measure/attributes/divisions * duration"/>
        -->
    </xsl:template> <!-- end template type -->
    
    <xsl:template match="dot">
        <xsl:variable name="dot">
            <xsl:choose>
                <xsl:when test=".">
                    <xsl:text>.</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test=".">
                <xsl:value-of select="$dots/entry[@key=$dot]"/>
            </xsl:when>
        </xsl:choose>
        <!--
        <xsl:text> </xsl:text>
        -->
    </xsl:template>
    
    <xsl:template match="stem">
        
    </xsl:template> <!-- end template stem -->
    
    <xsl:template match="voice">
        
    </xsl:template> <!-- end template voice -->
    
    <xsl:template match="backup">
        <!-- 
            In MusicXML the <backup> element is used to move back
            one or several notes in one voice or staff in order
            to find a position to let another voice or staff begin.
            The <backup> element does not always go back to the beginning
            of a measure. The note elements of another voice or staff
            can start anywhere in that measure.  The backup template
            tries to find backup elements, sums up the note durations of 
            the other voice (or staff) and subtracts the duration of
            the backup element.  If the result is greater than 0
            the LilyPond-Duration is calculated taking the time element
            into account and a spacer rest results thereof. In case 
            $silentrest equals to 0 the second voice or staff starts at the
            beginning of the measure so nothing should be done.
            In case $silentrest is negative something is wrong.  In
            11b-TimeSignatures-NoTime.xml there is a backup value of 384 
            instead of 4.  In this case the value of a full measure should
            be taken to set the second voice or staff to the beginning of the
            measure.  That is to say: do nothing till you hear from me!
            Not safe but probably the best bet for the time being.
        -->
        <xsl:variable name="silentrest">
            <xsl:choose>
                <xsl:when test=".">
                    <xsl:value-of select="
                        sum(preceding-sibling::note[staff='1' 
                        or not(staff) 
                        and voice='1']/duration)
                        -
                        .[duration]
                        "/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test=". and $silentrest &gt; 0">
                <xsl:text>s</xsl:text>
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="
                        $silentrest
                        * 
                        0.25 
                        div 
                        //attributes/divisions"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
        <!-- test -->
        <!--
        <xsl:value-of select="//attributes/divisions"/>
        -->
        <!--
        <xsl:choose>
            <xsl:when test=".">
                
                
                <xsl:value-of select="sum(preceding-sibling::note[staff='1' or not(staff) and voice='1']/duration)"/>
                <xsl:text> </xsl:text>
            </xsl:when>
        </xsl:choose>
        -->
        
        <!--
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="
                        (sum(note[staff='1'][voice='1']/duration)
                        * 
                        0.25 
                        div 
                        attributes/divisions)"/>
                </xsl:call-template>
                -->
        
        <!--
        <xsl:apply-templates select="child::duration"></xsl:apply-templates>
        -->
    </xsl:template>
    
    <xsl:template match="duration">
        <xsl:value-of select="."/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tie">
        <!-- 
            MusicXML differentiates between sounding and
            visual ties:
            
                <tie type="start"/>
            and
                <notations>
                    <tied type="start"/>
                </notations>.
                
            In case one of them is missing we should have an
            or-condition.  As ties only connect neighbouring
            notes it suffices to check where a tie starts.
        -->
        <xsl:if test="@type='start'">
            <xsl:text>~ </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="cautionary">
        <!-- 
            The accidental type represents explicitly notated accidentals
            such as reminder (editorial and cautionary) accidentals.
            Reminder accidentals have to be placed after the specification 
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
            Cautionary (and editorial) accidentals are only placed in 
            parentheses/brackets when they are requested by their
            corresponding attributes.
        -->
        
            <xsl:variable name="cautionary">
                <xsl:choose>
                    <!-- 
                        Parenthesized accidentals called with a ? cannot
                        be overridden.  Therefore in some cases a ! has 
                        to be used instead.
                    -->
                    <xsl:when test="../accidental[@cautionary='yes' 
                        and 
                        @parentheses='yes']
                        and 
                        (not(../accidental='sharp-1')
                        and
                        not(../accidental='sharp-2')
                        and
                        not(../accidental='sharp-3')
                        and
                        not(../accidental='sharp-5')
                        and
                        not(../accidental='flat-1')
                        and
                        not(../accidental='flat-2')
                        and
                        not(../accidental='flat-3')
                        and
                        not(../accidental='flat-4')
                        and
                        not(../accidental='sori')
                        and
                        not(../accidental='koron')
                        and
                        not(../accidental='natural-sharp')
                        and
                        not(../accidental='sharp-sharp')
                        )
                        ">
                        <xsl:text>?</xsl:text>
                    </xsl:when>
                    <!-- 
                        Don't place a reminder accidental if only an
                        editorial accidental is requested.
                    -->
                    <xsl:when test="../accidental[@editorial='yes'] 
                        and 
                        ../accidental[not(@cautionary)]
                        ">
                        <xsl:text></xsl:text>
                    </xsl:when>
                    
                    <!-- 
                        Add a reminder accidental if cautionary="yes".
                        Also add a reminder accidental in case the 
                        accidental element does not contain a cautionary /
                        editorial attribute.  (The accidental element
                        should be left out if an accidental is not wanted.)
                    -->
                    <xsl:when test="../accidental[@cautionary='yes' and (@bracket='yes' or @parentheses='yes')]
                        or
                        (../accidental[not(@editorial)]
                        and
                        ../accidental[not(@cautionary) or @cautionary])
                        ">
                        <xsl:text>!</xsl:text>
                    </xsl:when>
                    
                    
                    <!--
                        and 
                        (../accidental='sharp-1'
                        or
                        ../accidental='sharp-2'
                        or
                        ../accidental='sharp-3'
                        or
                        ../accidental='sharp-5'
                        or
                        ../accidental='flat-1'
                        or
                        ../accidental='flat-2'
                        or
                        ../accidental='flat-3'
                        or
                        ../accidental='flat-4'
                        or
                        ../accidental='sori'
                        or
                        ../accidental='koron'
                        )
                        -->
                    
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
                <!-- 
                        We need to make exceptions for certain parenthesized
                        accidentals because parenthesized accidentals triggered
                        by a "?" cannot be overridden by an \override command.
                    -->
                <xsl:when test="../accidental[@parentheses='yes' and @cautionary='yes'] 
                    and (
                    ../accidental='sharp-down'
                    or
                    ../accidental='sharp-up'
                    or
                    ../accidental='natural-down'
                    or
                    ../accidental='natural-up'
                    or
                    ../accidental='flat-down'
                    or
                    ../accidental='flat-up'
                    or
                    ../accidental='triple-sharp'
                    or
                    ../accidental='triple-flat'
                    or
                    ../accidental='slash-quarter-sharp'
                    or
                    ../accidental='slash-sharp'
                    or
                    ../accidental='slash-flat'
                    or
                    ../accidental='double-slash-flat'
                    or
                    ../accidental='sharp-1'
                    or
                    ../accidental='sharp-2'
                    or
                    ../accidental='sharp-3'
                    or
                    ../accidental='sharp-5'
                    or
                    ../accidental='flat-1'
                    or
                    ../accidental='flat-2'
                    or
                    ../accidental='flat-3'
                    or
                    ../accidental='flat-4'
                    or
                    ../accidental='sori'
                    or
                    ../accidental='koron'
                    )
                    ">
                    <xsl:text>!</xsl:text>
                </xsl:when>
                <xsl:when test="../accidental[@cautionary='yes' and @parentheses='yes']">
                    <xsl:value-of select="$accidentals/entry[@key=$cautionary]"/>
                </xsl:when>
                <xsl:when test="../accidental[@cautionary='yes']">
                    <xsl:value-of select="$accidentals/entry[@key=$cautionary]"/>
                </xsl:when>
                <xsl:when test="../accidental[not(@cautionary)]">
                    <xsl:value-of select="$accidentals/entry[@key=$cautionary]"/>
                </xsl:when>
            </xsl:choose>
    </xsl:template> <!-- end template cautionary -->
         
        <xsl:template name="editorial">
            <xsl:variable name="accidental">
                <xsl:choose>
                    <xsl:when test="accidental">
                        <xsl:value-of select="accidental"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <!--
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
        -->
            <!--
        <xsl:value-of select="$editorial"/>
        -->
            <xsl:choose>
                <xsl:when test="accidental[@editorial='yes' and @parentheses='yes'] and (accidental='sori' or accidental='koron')">
                    <xsl:text>^\markup { \musicglyph #"accidentals.leftparen"</xsl:text>
                    <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
                    <xsl:text>\musicglyph #"accidentals.rightparen"</xsl:text>
                    <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:when test="accidental[@editorial='yes' and @parentheses='yes'] and accidental">
                    <xsl:text>^\markup \parenthesize { </xsl:text>
                    <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
                    <xsl:text> } </xsl:text>
                </xsl:when>
                <xsl:when test="accidental[@editorial='yes' and @bracket='yes'] and (accidental='sori' or accidental='koron')">
                    <xsl:text>^\markup { [</xsl:text>
                    <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
                    <xsl:text>]</xsl:text>
                    <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:when test="accidental[@editorial='yes' and @bracket='yes'] and accidental">
                    <xsl:text>^\markup \bracket { </xsl:text>
                    <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
                    <xsl:text> } </xsl:text>
                </xsl:when>
                <xsl:when test="accidental[@editorial='yes'] and accidental">
                    <xsl:text>^\markup { </xsl:text>
                    <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
                    <xsl:text> } </xsl:text>
                </xsl:when>
            </xsl:choose>
            <!--
        <xsl:choose>
            <xsl:when test="accidental[@editorial='yes' and @parentheses='yes'] and accidental">
                <xsl:value-of select="$accidentals/entry[@key=$editorial]"/>
            </xsl:when>
            <xsl:when test="accidental[@editorial='yes'] and accidental">
                <xsl:value-of select="$accidentals/entry[@key=$editorial]"/>
            </xsl:when>
        </xsl:choose>
        -->
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
        <xsl:text> </xsl:text>
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
    
    <xsl:template name="measure-completion">
        <xsl:param name="staff"/>
        <xsl:param name="voice"/>
        <!-- 
            Check if there are incomplete measures and complete
            the missing durations using \repeat unfold y { rx }.
        -->
        <!-- 
            Computing the sum of the durations contained
            in a measure (durations per measure).
            Some scores with only one staff don't even 
            contain a <voice> element! :(
        -->
        <xsl:variable name="dpm">
            <xsl:value-of select="
                sum(note[staff=$staff or voice=$voice or not(voice) ]/duration)
                *
                0.25
                div
                1
                "/>
        </xsl:variable>
        <!--
        dpm <xsl:value-of select="$dpm"/>
        
        backup <xsl:value-of select="backup/duration/node()"></xsl:value-of>
        -->
        <!-- 
            Computing the duration of a whole measure
            (measure duration).
        -->
        <xsl:variable name="md">
            <xsl:choose>
                <!-- 
                    In case the time signature elements are missing
                    assume 4/4.
                -->
                <xsl:when test="not(//attributes/time)">
                    <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:when test="./attributes/time">
                    <xsl:value-of select="
                        ./attributes/time/beats
                        div
                        ./attributes/time/beat-type
                        "/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="
                        preceding-sibling::measure[last()]/attributes/time/beats
                        div
                        preceding-sibling::measure[last()]/attributes/time/beat-type
                        "/>
                    <!--
                        preceding-sibling::*[1][./attributes/time/beats]
                        div
                        preceding-sibling::*[1][./attributes/time/beat-type]
                        -->
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!--
        md <xsl:value-of select="$md"/>
        -->
        <!--
        preceding divisions <xsl:value-of select="preceding-sibling::measure[last()]/attributes[last()]/divisions"/>
        preceding beats <xsl:value-of select="preceding-sibling::measure[last()]/attributes/time/beats"/>
        -->
        <xsl:choose>
            <!-- 
                (The output is defined in the decimal-to-fraction
                template.)
            -->
            <!-- 
                At the moment the measure-completion template 
                does not work correctly in the presence of
                <backup> elements. Unfortunately the <backup> element
                does not contain a <voice> element.  So it's hard to
                automatically determine the voice a backup element refers to.
            -->
            <xsl:when test="$md - $dpm &gt; 0 and not(//backup)">
                <!-- test -->
                <!--
                <xsl:text> pups</xsl:text>
                -->
                <xsl:text>\repeat unfold </xsl:text>
                <xsl:call-template name="decimal-to-fraction">
                    <xsl:with-param name="decimalnum" select="
                        $md - $dpm"/>
                </xsl:call-template>
            </xsl:when>
            <!--
            <xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
            -->
            
            <!--
            <xsl:when test="$md - $dpm eq 0"><xsl:text> </xsl:text></xsl:when>
            -->
        </xsl:choose> 
        <!-- test -->
        <!--
        md = <xsl:value-of select="$md"/>
        dpm = <xsl:value-of select="$dpm"/>
        -->
        
        
        <!-- 
            <xsl:choose>
                <xsl:when test="not(./attributes/time/beats)">
                    <xsl:value-of select="
                        preceding-sibling::measure[last()]/attributes/time/beats
                        "/>
                </xsl:when>
            </xsl:choose>
        -->
    <!--
        <xsl:choose>
        -->
            <!--
            <xsl:when test="not(measure[@number='0']) 
                and
                (sum(note[staff='1' or voice='1']/duration)
                * 
                0.25 
                div 
                //divisions)
                lt 
                ./attributes/time/beats 
                div 
                ./attributes/time/beat-type
                ">
                <xsl:text>\repeat unfold</xsl:text>
                -->
                <!--
                <xsl:call-template name="decimal-to-fraction">
                    
                </xsl:call-template>
                -->
                <!--
                <xsl:value-of select="sum(note[staff='1' or voice='1']/duration)"/>
                -->
                <!--
            </xsl:when>
        </xsl:choose>
        -->
        <!--
                and
                .[staff='1' or voice='1']
                
                (sum(.[staff='1' or voice='1']/duration)
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
                -->
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
        <!-- 
            In order to calculate the duration of
            a whole measure we need the <divisions> value.
            The sum of all <duration> elements of a whole 
            measure should always be equal to 
            fullmeasureduration = <beat-types>*(1/4*<divisions>*<beats>).
            A pickup measure contains only durations that are smaller than
            a full measure duration.
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
                <xsl:text>\partial </xsl:text>
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
            <!-- In case a voice or staff element is missing: -->
            <xsl:when test="@number='0'
                and 
                @implicit='yes'
                and
                (not(note[staff='1'])
                or
                not(note[voice='1']))
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
                <xsl:text>\partial </xsl:text>
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
    
    <xsl:template name="time-signature-calculator">
        <xsl:param name="decimalnum"/>
        <xsl:param name="num" select="round($decimalnum * 10000)"/> <!-- numerator -->
        <xsl:param name="dom" select="round(10000)"/> <!-- denominator -->
        <xsl:param name="gcd"> <!-- greatest common divisor aka highest common factor -->
            <xsl:call-template name="greatest-common-divisor">
                <xsl:with-param name="num" select="$num"/>
                <xsl:with-param name="dom" select="$dom"/>
            </xsl:call-template>
        </xsl:param>
        <xsl:text>
        \time </xsl:text>
        <xsl:choose>
            <xsl:when test="($num div $gcd = 1) and ($dom div $gcd = 1)">
                <xsl:value-of select="$num div $gcd * 4"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="$dom div $gcd * 4"/>
                <!--
                <xsl:text>
        </xsl:text>
        -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$num div $gcd"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="$dom div $gcd"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> <!-- end time signature-calculator template -->
    
    <xsl:template name="decimal-to-fraction">
        <xsl:param name="decimalnum"/>
        <xsl:param name="num" select="round($decimalnum * 10000)"/> <!-- numerator -->
        <xsl:param name="dom" select="round(10000)"/> <!-- denominator -->
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
        <!-- test -->
        <!--
        <xsl:text>
            test start
        </xsl:text>
        beats: 
        <xsl:value-of select="./attributes/time/beats"/>
        beat-type: 
        <xsl:value-of select="./attributes/time/beat-type"/>
        note duration
        <xsl:value-of select="sum(./note[staff='1' or voice='1']/duration)"/>
        <xsl:text>
            
            test end
        </xsl:text>
        -->
        <xsl:choose>
            <!-- 
                In case the score contains incomplete measures
                they should be filled up with suitable silent rest durations.
                This is checked by the measure-completion template
                which calls the decimal-to-fraction template in order to
                output fractions in this way:
                $num { s$dom }.
            -->
            
            <xsl:when test="not(.[@number='0'])
                and
                ./attributes/time/beats
                div
                ./attributes/time/beat-type
                -
                (sum(note[staff='1' or voice='1']/duration)
                *
                0.25
                div
                //divisions
                )
                gt
                0
                or
                preceding-sibling::measure[last()]/attributes/time/beats
                div
                preceding-sibling::measure[last()]/attributes/time/beat-type
                -
                sum(note[staff='1' or voice='1']/duration)
                *
                0.25
                div
                //divisions
                gt
                0
                ">
                <xsl:value-of select="$num div $gcd"/>
                    <xsl:text> { s</xsl:text><xsl:value-of select="$dom div $gcd"/>
                    <xsl:text> } </xsl:text>
            </xsl:when>
            
            
            <!--
            <xsl:when test="$num div $gcd = 0"><xsl:text> </xsl:text></xsl:when>
            -->
            <!-- For LilyPond durations the fractions have to be transformed into
                this form:
                denominator * numerator.
                In case the numerator equals to 1 it should be left out.
            -->
            
            <xsl:when test="$num div $gcd = 1"><xsl:value-of select="$dom div $gcd"/></xsl:when>
            
            <xsl:otherwise>
                <xsl:value-of select="$dom div $gcd"/>
                <xsl:text>*</xsl:text>
                <xsl:value-of select="$num div $gcd"/>
            </xsl:otherwise>
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