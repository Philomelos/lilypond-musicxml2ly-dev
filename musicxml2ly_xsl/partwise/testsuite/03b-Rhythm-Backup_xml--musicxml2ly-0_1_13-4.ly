\version "2.17.29"
% transformed with musicxml2ly.xsl v0.1.13-4 (31.10.2013)
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
        \voiceOne
       c'4 c'4 |%1
      }
        \new Voice = "PartP1Staff1Voice2" {
        \key c\major
        \time 4/4
        \clef treble
        \voiceTwo
        s4 a4 a4 |%1
        }
    >>
  >>            
}