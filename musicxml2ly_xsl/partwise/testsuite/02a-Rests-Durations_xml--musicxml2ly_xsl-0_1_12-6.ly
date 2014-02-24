\version "2.17.28"
% transformed with musicxml2ly.xsl v0.1.12-6 (26.10.2013)
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
        R1 |%1
        R1 |%2
        R1 |%3
        r2 r4 r8 r16 r32 r64 r128 r128 |%4
        r2. r4 |%5
        r4. r8. r16. r32. r64. r128. r128. r4 |%6
        \bar "|."
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }
    >>
  >>            
}