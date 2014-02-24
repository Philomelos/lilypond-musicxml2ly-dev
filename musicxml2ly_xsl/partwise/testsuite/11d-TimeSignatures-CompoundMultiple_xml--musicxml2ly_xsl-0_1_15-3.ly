\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.15-4 (08.11.2013)
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
        \compoundMeter #'((3 8)(2 8)(3 4))
        \clef treble
        b'8 b'8 b'8 b'8 b'8 b'4 b'4 b'4 |%1
        \compoundMeter #'((5 2)(1 8))
        a'\breve a'2 a'8 |%2
        \bar "|."
      }
    >>
  >>            
}