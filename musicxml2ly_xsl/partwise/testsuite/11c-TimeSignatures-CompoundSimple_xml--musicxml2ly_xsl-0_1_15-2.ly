\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.15-2 (08.11.2013)
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
        \compoundMeter #'((3 2 8))
        \clef treble
        b'8 b'8 b'8 b'8 b'8 |%1
        \compoundMeter #'((5 3 1 4))
        a'1 a'4 a'2. a'4 |%2
        \bar "|."
      }
    >>
  >>            
}