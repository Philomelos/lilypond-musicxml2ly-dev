\version "2.17.28"

sharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.sharp"\hspace #0.01
      \musicglyph #"accidentals.sharp"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}

naturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.natural"\hspace #0.15
      \musicglyph #"accidentals.sharp"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}

naturalFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.natural"\hspace #0.25
      \musicglyph #"accidentals.flat"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1
}


sharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.sharp.arrowdown"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #0.25
}

sharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.sharp.arrowup"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

naturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
%    \concat {
      \musicglyph #"accidentals.natural.arrowdown"
 %   }
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

naturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
%    \concat {
      \musicglyph #"accidentals.natural.arrowup"
%    }
  }
 % \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

flatDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.flat.arrowdown"
  }
}

flatUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.flat.arrowup"
  }
}

sharpSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.sharp"
      \musicglyph #"accidentals.sharp"
      \musicglyph #"accidentals.sharp"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.5
}

sharpDoublesharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.sharp"\hspace #0.2
      \musicglyph #"accidentals.doublesharp"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.25
}

flatFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.flat"
      \musicglyph #"accidentals.flat"
      \musicglyph #"accidentals.flat"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2
}

flatDoubleflat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.flat"
      \musicglyph #"accidentals.flatflat"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.75
}

slashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #.5
}

slashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #.5
}

slashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.flat.slash"
  }
 % \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

doubleSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.flat.slashslash"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

sharpArrowboth = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.sharp.arrowboth"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

naturalArrowboth = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
      \musicglyph #"accidentals.natural.arrowboth"
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

flatArrowboth = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.flat.arrowboth"
    }
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

mirroredflatBackslash = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
%    \concat {
      \musicglyph #"accidentals.mirroredflat.backslash"
 %   }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #-.75
}

flatflatSlash = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
%    \concat {
      \musicglyph #"accidentals.flatflat.slash"
%    }
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

questionMark = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    ?
  }
%  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
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
  \once \override Staff.AccidentalPlacement #'right-padding = #0.7
}

bracketedSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
     \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

bracketedNatural = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
     \musicglyph #"accidentals.natural"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

bracketedFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

bracketedDoubleSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

bracketedSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp"
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}


\header {
  title = "Accidentals (LilyPond / MusicXML)"
  subtitle = \markup {
    \center-column {
      \line{"Lilypond: pitch name / accidental glyph name"}
      \line{"MusicXML: pitch, alter / accidental element"}
    }
  }
}

bracketedNaturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.natural"
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}

bracketedNaturalFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.natural"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}

bracketedQuarterFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.mirroredflat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}

bracketedQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.sharp.slashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}

bracketedThreeQuartersSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.mirroredflat.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}

sharpOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

sharpTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

sharpThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

sharpFive = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"\lower #0.3 \super 5
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

flatOne = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 1
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

flatTwo = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 2
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

flatThree = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 3
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

flatFour = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.flat"\hspace #-0.5 \lower #0.3 \super 4
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

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

koron = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup   {%\hspace #1 
                                               \lower #1.6
    \override #'(thickness . 1.75)
  \draw-line #'(0 . 2.25)
 \hspace #-1.18 \lower #0.2  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}

parenthesizedSoriMarkup = \markup  {
  \musicglyph #"accidentals.leftparen"
  \lower #0.9 {
  \override #'(thickness . 1.75)
  \draw-line #'(0 . 2.5)\hspace #-0.25
  \override #'(thickness . 1.75)
  \raise #0.2 \draw-line #'(0 . 2.5)
  \hspace #-1.8 \raise #0.4 \fontsize #3 >
  }
  \hspace #-0.6
  \musicglyph #"accidentals.rightparen"
  }


%{
koron = \markup {\override #'(thickness . 1.75)
  \draw-line #'(0 . 2.25)
 \hspace #-1.18 \raise #1.3  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}
}


sori = \markup {
  \override #'(thickness . 1.75)
  \draw-line #'(0 . 2.5)\hspace #-0.25
  \override #'(thickness . 1.75)
  \raise #0.2 \draw-line #'(0 . 2.5)
  \hspace #-1.8 \raise #0.4 \fontsize #3 >
}
%}

\relative {
  %\accidentalStyle Score.dodecaphonic
  %\bracketedSharp
  %aisis'1^\markup\bracket{\concat{\sharp\sharp}}
  %\parenthesizedQuestionMark
%  \bracketedQuestionMark
  ais'1^\markup { \sharp } 
  %\bracketedNatural
  a!^\markup { \natural }  
 % \bracketedFlat
  as^\markup { \flat }  
  aisis^\markup { \doublesharp }  
  \break
  \sharpSharp\bracketedSharpSharp
  aisis^\markup \concat { \sharp\hspace #0.05 \sharp ? } 
  aeses^\markup { \doubleflat }  
 % \set Staff.extraNatural = ##t
 \naturalSharp
  ais^\markup \concat { \natural\hspace #0.15 \sharp } 
  \naturalFlat
  as^\markup \concat { \natural\hspace #0.25 \flat } 
  \break
  aeh^\markup { \semiflat } 
  aih^\markup { \semisharp } 
  aeseh^\markup { \sesquiflat } 
  \break
  aisih^\markup { \sesquisharp } 
  \sharpDown
  ais^\markup { \musicglyph #"accidentals.sharp.arrowdown" } 
  \sharpUp
  ais^\markup { \musicglyph #"accidentals.sharp.arrowup" } 
  \naturalDown
  a!^\markup { \musicglyph #"accidentals.natural.arrowdown" } 
  \naturalUp
  a!^\markup { \musicglyph #"accidentals.natural.arrowup" } 
  \flatDown
  as^\markup { \musicglyph #"accidentals.flat.arrowdown" } 
  \flatUp
  as^\markup { \musicglyph #"accidentals.flat.arrowup" } 
  \sharpDoublesharp
  ais2^\markup  \concat { \sharp\hspace #0.2 \doublesharp } 
  \sharpSharpSharp
  aisis2^\markup  \concat { \sharp\sharp\sharp } 
  \flatDoubleflat
  as!2^\markup  \concat { \flat\doubleflat }
  \flatFlatFlat
  as!2^\markup  \concat { \flat\flat\flat }
  \slashQuarterSharp
  aih1^\markup { \musicglyph #"accidentals.sharp.slashslashslash.stem" } 
  \slashSharp
  ais!^\markup { \musicglyph #"accidentals.sharp.slashslashslash.stemstem" } 
  \slashFlat
  as!^\markup { \musicglyph #"accidentals.flat.slash" } 
  \doubleSlashFlat
  as^\markup { \musicglyph #"accidentals.flat.slashslash" } 
  \sharpOne
  a!^\markup\concat { \musicglyph #"accidentals.sharp"\super 1 }
   \sharpTwo
  a!^\markup\concat { \musicglyph #"accidentals.sharp"\super 2 }
   \sharpThree
  a!^\markup\concat { \musicglyph #"accidentals.sharp"\super 3 }
   \sharpFive
  a!^\markup\concat { \musicglyph #"accidentals.sharp"\super 5 }
   \flatOne
  a!^\markup\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 1 }
   \flatTwo
  a!^\markup\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 2 }
   \flatThree
  a!^\markup\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 3 }
   \flatFour
  a!^\markup\concat { \musicglyph #"accidentals.flat"\hspace #-0.4 \super 4 }
   \sori
  a!^\parenthesizedSoriMarkup
   \koron
  a!^\markup { \override #'(thickness . 1.75)
  \draw-line #'(0 . 2.25)
 \hspace #-1.18 \raise #1.3  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f} }
  \sharpArrowboth
  ais^\markup { \musicglyph #"accidentals.sharp.arrowboth" } 
  \naturalArrowboth
  a!^\markup { \musicglyph #"accidentals.natural.arrowboth" } 
  \flatArrowboth
  as^\markup { \musicglyph #"accidentals.flat.arrowboth" } 
%  a^\markup { \musicglyph #"accidentals.mirroredflat.flat" } 
\mirroredflatBackslash
  aeseh^\markup { \musicglyph #"accidentals.mirroredflat.backslash" } 
  \flatflatSlash
  ases^\markup { \musicglyph #"accidentals.flatflat.slash" } 
  \bar "|."
}

\addlyrics { 
  \set stanza = #"LilyPond"
  "is | b / .sharp"
  "- / .natural"
  "es | fk / .flat"
  "isis / .doublesharp"
  "? / .sharp .sharp?"
  "eses / .flatflat"
  "is / .natural .sharp?"
  "es / .natural .flat?"
  "eh | fc / .mirroredflat"
  "ih | c / .sharp.slashslash.stem"
  "eseh / .mirroredflat.flat"
  "isih / .sharp.slashslash.stemstemstem"
  "ise? / .sharp.arrowdown"
  "isi? / .sharp.arrowup"
  "e? / .natural.arrowdown"
  "i? / .natural.arrowup"
  "ese / .flat.arrowdown"
  "esi? / .flat.arrowup"
  "is-isis? / .sharp doublesharp"
  "isisis / .sharp .sharp .sharp"
  "es-eses / .flat flatflat"
  "eseses / .flat .flat .flat"
  "ck / .sharp.slashslashslash.stem"
  "bm / .sharp.slashslashslash.stemstem"
  "fb / .flat.slash"
  "fbm / .flat.slashslash"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "isie / .sharp.arrowboth"
  "ie / .natural.arrowboth"
  "esie / .flat.arrowboth"
  "? / .mirroredflat.backslash"
  "? / .flatflat.slash"
}

\addlyrics { 
  \set stanza = #"MusicXML"
  "1 | 0.88 / sharp" 
  "0 / natural" 
  "-1 | -1.11 / flat" 
  "2 / double-sharp" 
  "2 / sharp-sharp" 
  "-2 / flat-flat" 
  "1 / natural-sharp"
  "-1 / natural-flat"
  "-0.5 | -0.22 / quarter-flat"
  "0.5 | 0.22/ quarter-sharp"
  "-1.5 / three-quarters-flat"
  "1.5 / three-quarters-sharp"
  "0.5 / sharp-down"
  "1.5? / sharp-up"
  "-0.5? / natural-down"
  "0.5? / natural-up"
  "-1.5 / flat-down"
  "-0.5 / flat-up"
  "3 / triple-sharp"
  "3 / triple-sharp"
  "-3 / triple-flat"
  "-3 / triple-flat"
  "1.11 / slash-quarter-sharp"
  "1.78 / slash-sharp"
  "-0.88 / slash-flat"
  "-1.78 / double-slash-flat"
  "? / sharp-1"
  "? / sharp-2"
  "? / sharp-3"
  "? / sharp-5"
  "? / flat-1"
  "? / flat-2"
  "? / flat-3"
  "? / flat-4"
  "0.5 / sori"
  "-0.5 / koron"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
  "? / ?"
}

