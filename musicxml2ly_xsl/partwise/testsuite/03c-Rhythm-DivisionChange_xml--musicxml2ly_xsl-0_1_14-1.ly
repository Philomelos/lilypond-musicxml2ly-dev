\version "2.17.29"
% transformed with musicxml2ly.xsl v0.1.14-1 (01.11.2013)
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
      \new Voice = "PartP1Staff1Voice1" {
        \key c\major
        \time 4/4
        \clef treble
        c''4 c''4 c''4 c''4 |%1
        c''2 c''2 |%2
        \bar "|."
      }
    >>
  >>            
}