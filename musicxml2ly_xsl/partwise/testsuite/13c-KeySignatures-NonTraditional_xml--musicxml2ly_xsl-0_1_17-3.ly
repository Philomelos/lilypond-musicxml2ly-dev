\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.17-3 (12.11.2013)
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
        \set Staff.keySignature = #`((3 . ,SHARP)(5 . ,FLAT)(6 . ,FLAT))
        \time 2/4
        \clef treble
        c'2  |%1
        \set Staff.keySignature = #`(((-2 . 0). ,DOUBLE-FLAT)((-1 . 4). ,DOUBLE-SHARP)((0 . 1). ,FLAT)((1 . 6). ,SHARP)((2 . 3). ,NATURAL))
        c'2  |%2
        \bar "|."
        
      }
    >>
  >>            
}