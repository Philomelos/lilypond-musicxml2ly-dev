\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.15-5 (08.11.2013)
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
        \compoundMeter #'((3 8))
        \clef treble
        b'4. |%1
        \compoundMeter #'((3 2 8))
        b'8 b'2 |%2
        \compoundMeter #'((1 8)(2 4))
        b'8 b'2 |%3
        \bar "|."
      }
    >>
  >>            
}