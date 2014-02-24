\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.16-1 (10.11.2013)
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
    \new Staff = "PartP0Staff1" <<
      \set Staff.instrumentName = #""
      \new Voice = "PartP0Staff1Voice1" {
        \once \numericTimeSignature
        \time 4/4
        c'1  |%1
        c'1  |%2
        
      }
    >>
  >>            
}