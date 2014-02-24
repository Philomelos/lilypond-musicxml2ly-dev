\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.15-7 (08.11.2013)
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
        \once \override Score.TimeSignature #'stencil = ##f
        \cadenzaOn
        \clef treble
        b'8 b'8 b'8 |%1
        \bar "|."
      }
    >>
  >>            
}