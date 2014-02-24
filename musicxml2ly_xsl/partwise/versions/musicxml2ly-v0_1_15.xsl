<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- version number of stylesheet -->
    <xsl:variable name="version">musicxml2ly.xsl v0.1.14-6 (05.11.2013)</xsl:variable>
    
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
    <!--
        Separated fifths and mode dictionaries don't make sense.
    -->
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
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="sharp-2">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="sharp-3">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="sharp-5">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="flat-1">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="flat-2">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="flat-3">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="flat-4">
            <xsl:text>?</xsl:text>
        </entry>
        <!-- 
            The sori and koron accidentals are microtonal sharp and
	        flat accidentals used in Iranian and Persian music.
        -->
        <entry key="sori">
            <xsl:text>?</xsl:text>
        </entry>
        <entry key="koron">
            <xsl:text>?</xsl:text>
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
        <xsl:choose>
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
                <xsl:text>
      \set Staff.instrumentName = #"</xsl:text>
                <xsl:value-of select="/score-partwise/part-list/score-part/part-name"/><xsl:text>"</xsl:text>
                <xsl:if test="/score-partwise/part/measure/note[staff='1' or voice='1' or not(voice)]">
                    <xsl:text>
      \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice1" {</xsl:text>
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
        \new Voice = "Part</xsl:text><xsl:value-of select="@id"/><xsl:text>Staff1Voice2" {</xsl:text>
                    <xsl:call-template name="SingleStaffVoice2"/>
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
    
    <xsl:template name="SingleStaffVoice1">
        <!-- 
                Check if there are <stem> elements and several
                voices.  If there are no <stem> elements but
                several voices: use \voiceOne.
            -->
        <xsl:choose>
            <xsl:when test="not(//note[stem]) and //note[voice='1'] and //note[voice='2']">
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
            <xsl:for-each select="attributes">
                <xsl:apply-templates select="key"/>
                <!--
                <xsl:text>  </xsl:text>
                -->
                <xsl:apply-templates select="time"/>
                <!--
                <xsl:text>  </xsl:text>
                -->
                <xsl:choose>
                    <xsl:when test="clef and clef[@number='1'] or not(clef[@number])">
                        <xsl:apply-templates select="clef">
                            <xsl:with-param name="staffnumber">1</xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:when>
                </xsl:choose>
                <!--
                <xsl:if test="/score-partwise/part/measure[@number='0']">
                    <xsl:text>
      </xsl:text>
                </xsl:if>
                -->
                
            </xsl:for-each> <!-- end for-each attributes -->
            <!-- 
                The call-template pickup command should not be placed here
                because this way it will be called for each and every measure
                unless the XPath expression is corrected...
            -->
            <xsl:call-template name="pickup"/>
            <xsl:text>
        </xsl:text>
            <xsl:apply-templates select="note">
                <xsl:with-param name="voice">1</xsl:with-param>
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
            <xsl:text>&#124;&#37;</xsl:text>
            <xsl:value-of select="@number"/>
            <!--
            <xsl:text>    </xsl:text>
            -->
            <xsl:apply-templates select="barline"/>
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
            <xsl:for-each select="attributes">
                <xsl:apply-templates select="key"/>
                <!--
                <xsl:text>  </xsl:text>
                -->
                <xsl:apply-templates select="time"/>
                <!--
                <xsl:text>  </xsl:text>
                -->
                <xsl:choose>
                    <xsl:when test="clef and clef[@number='1'] or not(clef[@number])">
                        <xsl:apply-templates select="clef">
                            <xsl:with-param name="staffnumber">1</xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:when>
                </xsl:choose>
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
            <!--
            <xsl:text>    </xsl:text>
            -->
            <xsl:apply-templates select="barline"/>
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
            <xsl:for-each select="attributes">
                <!--
                <xsl:text>
          </xsl:text>
          -->
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
            <xsl:text>
        </xsl:text>
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
            <xsl:for-each select="attributes">
                <!--
                <xsl:text>
          </xsl:text>
          -->
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
                This could be corrected with music21.  This software
                provides a method to compute key signatures.
            -->
            <xsl:when test="@number=$staffnumber and $key">
                <xsl:text>
        </xsl:text>
                <xsl:value-of select="$keys/entry[@key=$key]"/>
            </xsl:when>
            <xsl:when test="$key">
                <xsl:text>
        </xsl:text>
                <xsl:value-of select="$keys/entry[@key=$key]"/>
            </xsl:when>                
        </xsl:choose>  
        <!--
        <xsl:if test=". and ./fifths">pups</xsl:if>
        -->
        <!--
        <xsl:text>
      </xsl:text>
      -->
    </xsl:template> <!-- end template key -->
    
    <xsl:template match="time">
        <xsl:text>
        </xsl:text>
        <xsl:text>\time </xsl:text>
        <xsl:value-of select="beats"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="beat-type"/>
    </xsl:template> <!-- end template time -->
    
    <xsl:template match="clef">
        <xsl:param name="staffnumber"/>
        <xsl:variable name="clef">
            <xsl:value-of select="./sign"/>
            <xsl:text>_</xsl:text>
            <xsl:value-of select="./line"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$clef and @number=$staffnumber">
                <xsl:text>
        </xsl:text>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
            </xsl:when>
            <!-- 
                We have a problem when there are several clefs
                but no clef numbers or simply no clef numbers!
            -->
            <xsl:when test="$clef and not(@number)">
                <xsl:text>
        </xsl:text>
                <xsl:value-of select="$clefs/entry[@key=$clef]"/>
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
        <xsl:choose>
            <xsl:when test="preceding-sibling::*[1][self::backup] and .[voice=$voice]">
                <xsl:apply-templates select="//backup"/>
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
            requested by the MusicXML file.
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
        <!--
             Rests with a display-step need to be treated first,
             because they need to be transformed with a "\rest".
        -->
        <xsl:variable name="type">
            <xsl:value-of select="."/>
        </xsl:variable>
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
            <xsl:when test=". and $silentrest !=0">
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
            Cautionary (and editorial) accidentals are only placed in 
            parentheses/brackets when they are requested by their
            corresponding attributes.
        -->
        
            <xsl:variable name="cautionary">
                <xsl:choose>
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
                    
                    <xsl:when test="../accidental[@cautionary='yes']
                        
                        ">
                        <xsl:text>!</xsl:text>
                    </xsl:when>
                    <!-- 
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
                        )
                    -->
                    <xsl:when test="../accidental[not(@cautionary)]
                        or
                        ../accidental
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
                        ">
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
                <!-- 
                        We need to make exceptions for certain parenthesized
                        accidentals because parenthesized accidentals triggered
                        by a "?" cannot be overridden by an \override command.
                    -->
                <xsl:when test="../accidental[@parentheses='yes' or cautionary='yes'] 
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
                <xsl:when test="accidental[@editorial='yes' and @parentheses='yes'] and accidental">
                    <xsl:text>^\markup \parenthesize { </xsl:text>
                    <xsl:value-of select="$accidentals/entry[@key=$accidental]"/>
                    <xsl:text> } </xsl:text>
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
        preceding divisions <xsl:value-of select="preceding-sibling::measure[last()]/attributes[last()]/divisions"/>
        preceding beats <xsl:value-of select="preceding-sibling::measure[last()]/attributes/time/beats"/>
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
          
        <!-- 
            In order to calculate the duration of
            a whole measure we need the <divisions> value.
            The sum of all <duration> elements of a whole 
            measure should always be equal to 
            fullmeasureduration = <beat-types>*(1/4*<divisions>*<beats>).
        -->        
            </xsl:when>
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
            <xsl:when test="
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
                <!-- test -->
                <!--
                <xsl:text>pups</xsl:text>
                -->
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