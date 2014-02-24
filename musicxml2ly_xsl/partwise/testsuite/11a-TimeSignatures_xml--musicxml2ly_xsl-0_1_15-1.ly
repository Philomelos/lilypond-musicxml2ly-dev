\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.15-1 (07.11.2013)
\header {
}
        
\paper {
}
            
\layout {
  indent = 3.0\cm
%  short-indent = 0.5\cm
}
        
\score {
  <<
    \new Staff = "PartP1Staff1" <<
      \set Staff.instrumentName = #"MusicXML Part"
      \new Voice = "PartP1Staff1Voice1" {
        \key c\major
        \time 2/2
        \clef treble
        c''1 |%1
        \time 4/4
        c''1 |%2
        \once \numericTimeSignature
        \time 2/2
        c''1 |%3
        \time 3/2
        c''1. |%4
        \time 2/4
        c''2 |%5
        \time 3/4
        c''2. |%6
        \once \numericTimeSignature
        \time 4/4
        c''1 |%7
        \time 5/4
        c''1 ~ c''4 |%8
        \time 3/8
        c''4. |%9
        \time 6/8
        c''2. |%10
        \time 12/8
        c''1. |%11
        \bar "|."
      }
    >>
  >>            
}