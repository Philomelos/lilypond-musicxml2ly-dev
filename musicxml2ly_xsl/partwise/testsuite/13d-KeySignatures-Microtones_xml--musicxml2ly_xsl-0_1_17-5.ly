\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.17-5 (14.11.2013)
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
        \set Staff.keySignature = #`((4 . ,THREE-Q-FLAT)(5 . ,FLAT)(6 . ,SEMI-FLAT)(0 . ,NATURAL)(1 . ,SEMI-SHARP)(2 . ,SHARP)(3 . ,THREE-Q-SHARP))
        \time 2/4
        \clef treble
        c'2  |%1
        \bar "|."
        
      }
    >>
  >>            
}