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
      \clef treble
      g'1 |%1
      \bar "|."
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        A
      }
    >>
  >>            
}