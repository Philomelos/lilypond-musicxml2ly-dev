\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.14-6 (05.11.2013)
\header {
}
        
\paper {
}
            
\layout {
  indent = 3.0\cm
%  short-indent = 0.5\cm
}
        
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
        
sharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.01
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}
        
parenthesizedSharpSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.01
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}
        
naturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}            
        
parenthesizedNaturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.5
}            
        
naturalFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.25
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1
}   
        
sharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.arrowdown"
  }
}
        
sharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.arrowup"
  }
}
        
naturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.natural.arrowdown"
  }
}
        
naturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.natural.arrowup"
  }
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
        
parenthesizedSharpDoublesharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.sharp"
    \hspace #0.2
    \musicglyph #"accidentals.doublesharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.1
}
        
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
        
parenthesizedFlatFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.5
}
        
slashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #.5
}
        
parenthesizedSlashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
slashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.4
}
        
parenthesizedSlashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.1
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
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.5
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
        
bracketedFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.9
}
        
bracketedNaturalSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.sharp"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.5
}
        
bracketedNaturalFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.natural"
    \hspace #0.15
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.7
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
        
bracketedThreeQuartersFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.mirroredflat.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
bracketedThreeQuartersSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.slashslash.stemstemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
bracketedSharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.1
}
        
parenthesizedSharpDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}
        
parenthesizedSharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.sharp.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
parenthesizedNaturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.natural.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
parenthesizedNaturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.natural.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
parenthesizedFlatDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
parenthesizedFlatUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}
        
bracketedSharpUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.1
}
        
bracketedNaturalDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.natural.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        
bracketedNaturalUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.natural.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        
bracketedFlatDown = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.arrowdown"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        
bracketedFlatUp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.arrowup"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.8
}
        
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
        
bracketedFlatFlatFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket \concat {
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
    \musicglyph #"accidentals.flat"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #2.5
}            
        
bracketedSlashQuarterSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.slashslashslash.stem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}            
        
bracketedSlashSharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.sharp.slashslashslash.stemstem"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.9
}            
        
bracketedSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.slash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        
parenthesizedSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.slash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        
bracketedDoubleSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \bracket {
    \musicglyph #"accidentals.flat.slashslash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        
parenthesizedDoubleSlashFlat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup \parenthesize {
    \musicglyph #"accidentals.flat.slashslash"
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #0.75
}            
        
\score {
  <<
    \new Staff = "PartP1Staff1" <<
      \set Staff.instrumentName = #"Accidentals"
      \new Voice = "PartP1Staff1Voice1" {
        \key c\major
        \time 4/4
        \clef treble
        cis''!4 ^\markup { \sharp } cis''?4 ^\markup \parenthesize { \sharp } \bracketedSharp cis''!4 ^\markup \bracket { \sharp } cis''!4 |%1
        c''!4 ^\markup { \natural } c''?4 ^\markup \parenthesize { \natural } \bracketedNatural c''!4 ^\markup \bracket { \natural } c''!4 |%2
        ces''!4 ^\markup { \flat } ces''?4 ^\markup \parenthesize { \flat } \bracketedFlat ces''!4 ^\markup \bracket { \flat } ces''!4 |%3
        cisis''!4 ^\markup { \doublesharp } cisis''?4 ^\markup \parenthesize { \doublesharp } \bracketedDoubleSharp cisis''!4 ^\markup \bracket { \doublesharp } cisis''!4 |%4
        \sharpSharp cisis''!4 ^\markup { \concat {\sharp\hspace #0.05 \sharp} } \parenthesizedSharpSharp cisis''!4 ^\markup \parenthesize { \concat {\sharp\hspace #0.05 \sharp} } \bracketedSharpSharp cisis''!4 ^\markup \bracket { \concat {\sharp\hspace #0.05 \sharp} } \sharpSharp cisis''!4 |%5
        ceses''!4 ^\markup { \doubleflat } ceses''?4 ^\markup \parenthesize { \doubleflat } \bracketedFlatFlat ceses''!4 ^\markup \bracket { \doubleflat } ceses''!4 |%6
        \naturalSharp cis''!4 ^\markup { \concat {\natural\hspace #0.15 \sharp} } \parenthesizedNaturalSharp cis''!4 ^\markup \parenthesize { \concat {\natural\hspace #0.15 \sharp} } \bracketedNaturalSharp cis''!4 ^\markup \bracket { \concat {\natural\hspace #0.15 \sharp} } \naturalSharp cis''!4 |%7
        ces''!4 ^\markup { \concat {\natural\hspace #0.25 \flat} } ces''?4 ^\markup \parenthesize { \concat {\natural\hspace #0.25 \flat} } \bracketedNaturalFlat ces''!4 ^\markup \bracket { \concat {\natural\hspace #0.25 \flat} } ces''!4 |%8
        ceh''!4 ^\markup { \semiflat } ceh''?4 ^\markup \parenthesize { \semiflat } \bracketedQuarterFlat ceh''!4 ^\markup \bracket { \semiflat } ceh''!4 |%9
        cih''!4 ^\markup { \semisharp } cih''?4 ^\markup \parenthesize { \semisharp } \bracketedQuarterSharp cih''!4 ^\markup \bracket { \semisharp } cih''!4 |%10
        ceseh''!4 ^\markup { \sesquiflat } ceseh''?4 ^\markup \parenthesize { \sesquiflat } \bracketedThreeQuartersFlat ceseh''!4 ^\markup \bracket { \sesquiflat } ceseh''!4 |%11
        cisih''!4 ^\markup { \sesquisharp } cisih''?4 ^\markup \parenthesize { \sesquisharp } \bracketedThreeQuartersSharp cisih''!4 ^\markup \bracket { \sesquisharp } cisih''!4 |%12
        \sharpDown c''!4 ^\markup { \musicglyph #"accidentals.sharp.arrowdown" } \parenthesizedSharpDown c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.sharp.arrowdown" } \bracketedSharpDown c''!4 ^\markup \bracket { \musicglyph #"accidentals.sharp.arrowdown" } \sharpDown c''!4 |%13
        \sharpUp c''!4 ^\markup { \musicglyph #"accidentals.sharp.arrowup" } \parenthesizedSharpUp c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.sharp.arrowup" } \bracketedSharpUp c''!4 ^\markup \bracket { \musicglyph #"accidentals.sharp.arrowup" } \sharpUp c''!4 |%14
        \naturalDown c''!4 ^\markup { \musicglyph #"accidentals.natural.arrowdown" } \parenthesizedNaturalDown c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.natural.arrowdown" } \bracketedNaturalDown c''!4 ^\markup \bracket { \musicglyph #"accidentals.natural.arrowdown" } \naturalDown c''!4 |%15
        \naturalUp c''!4 ^\markup { \musicglyph #"accidentals.natural.arrowup" } \parenthesizedNaturalUp c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.natural.arrowup" } \bracketedNaturalUp c''!4 ^\markup \bracket { \musicglyph #"accidentals.natural.arrowup" } \naturalUp c''!4 |%16
        \flatDown c''!4 ^\markup { \musicglyph #"accidentals.flat.arrowdown" } \parenthesizedFlatDown c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.flat.arrowdown" } \bracketedFlatDown c''!4 ^\markup \bracket { \musicglyph #"accidentals.flat.arrowdown" } \flatDown c''!4 |%17
        \flatUp c''!4 ^\markup { \musicglyph #"accidentals.flat.arrowup" } \parenthesizedFlatUp c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.flat.arrowup" } \bracketedFlatUp c''!4 ^\markup \bracket { \musicglyph #"accidentals.flat.arrowup" } \flatUp c''!4 |%18
        \sharpDoublesharp c''!4 ^\markup { \concat { \sharp\hspace #0.05 \doublesharp } } \parenthesizedSharpDoublesharp c''!4 ^\markup \parenthesize { \concat { \sharp\hspace #0.05 \doublesharp } } \bracketedSharpDoublesharp c''!4 ^\markup \bracket { \concat { \sharp\hspace #0.05 \doublesharp } } \sharpDoublesharp c''!4 |%19
        \flatFlatFlat c''!4 ^\markup { \concat { \flat\flat\flat } } \parenthesizedFlatFlatFlat c''!4 ^\markup \parenthesize { \concat { \flat\flat\flat } } \bracketedFlatFlatFlat c''!4 ^\markup \bracket { \concat { \flat\flat\flat } } \flatFlatFlat c''!4 |%20
        \slashQuarterSharp c''!4 ^\markup { \musicglyph #"accidentals.sharp.slashslashslash.stem" } \parenthesizedSlashQuarterSharp c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.sharp.slashslashslash.stem" } \bracketedSlashQuarterSharp c''!4 ^\markup \bracket { \musicglyph #"accidentals.sharp.slashslashslash.stem" } \slashQuarterSharp c''!4 |%21
        \slashSharp c''!4 ^\markup { \musicglyph #"accidentals.sharp.slashslashslash.stemstem" } \parenthesizedSlashSharp c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.sharp.slashslashslash.stemstem" } \bracketedSlashSharp c''!4 ^\markup \bracket { \musicglyph #"accidentals.sharp.slashslashslash.stemstem" } \slashSharp c''!4 |%22
        \slashFlat c''!4 ^\markup { \musicglyph #"accidentals.flat.slash" } \parenthesizedSlashFlat c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.flat.slash" } \bracketedSlashFlat c''!4 ^\markup \bracket { \musicglyph #"accidentals.flat.slash" } \slashFlat c''!4 |%23
        \doubleSlashFlat c''!4 ^\markup { \musicglyph #"accidentals.flat.slashslash" } \parenthesizedDoubleSlashFlat c''!4 ^\markup \parenthesize { \musicglyph #"accidentals.flat.slashslash" } \bracketedDoubleSlashFlat c''!4 ^\markup \bracket { \musicglyph #"accidentals.flat.slashslash" } \doubleSlashFlat c''!4 |%24
        \questionMark cis''!4 ^\markup { ? } \parenthesizedQuestionMark cis''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark cis''!4 ^\markup \bracket { ? } \questionMark cis''!4 |%25
        \questionMark cis''!4 ^\markup { ? } \parenthesizedQuestionMark cis''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark cis''!4 ^\markup \bracket { ? } \questionMark cis''!4 |%26
        \questionMark cis''!4 ^\markup { ? } \parenthesizedQuestionMark cis''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark cis''!4 ^\markup \bracket { ? } \questionMark cis''!4 |%27
        \questionMark cis''!4 ^\markup { ? } \parenthesizedQuestionMark cis''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark cis''!4 ^\markup \bracket { ? } \questionMark cis''!4 |%28
        \questionMark ces''!4 ^\markup { ? } \parenthesizedQuestionMark ces''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark ces''!4 ^\markup \bracket { ? } \questionMark ces''!4 |%29
        \questionMark ces''!4 ^\markup { ? } \parenthesizedQuestionMark ces''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark ces''!4 ^\markup \bracket { ? } \questionMark ces''!4 |%30
        \questionMark ces''!4 ^\markup { ? } \parenthesizedQuestionMark ces''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark ces''!4 ^\markup \bracket { ? } \questionMark ces''!4 |%31
        \questionMark ces''!4 ^\markup { ? } \parenthesizedQuestionMark ces''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark ces''!4 ^\markup \bracket { ? } \questionMark ces''!4 |%32
        \questionMark cih''!4 ^\markup { ? } \parenthesizedQuestionMark cih''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark cih''!4 ^\markup \bracket { ? } \questionMark cih''!4 |%33
        \questionMark ceh''!4 ^\markup { ? } \parenthesizedQuestionMark ceh''!4 ^\markup \parenthesize { ? } \bracketedQuestionMark ceh''!4 ^\markup \bracket { ? } \questionMark ceh''!4 |%34
      }
    >>
  >>            
}