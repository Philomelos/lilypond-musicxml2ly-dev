\version "2.17.28"
% transformed with musicxml2ly.xsl v0.1.12-5 (25.10.2013)
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
          cis''4 ces''4 cisis''4 ceses''4 |%1
          cih''4 ceh''4 cisih''4 ceseh''4 |%2
          \bar "|."
      }
    >>
  >>            
}