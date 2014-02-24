\version "2.17.28"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"MusicXML Part"} <<
      \new Voice = "PartP1Staff1Voice1" {
      \key c\major 
      \time 4/4
      \clef treble
      \compressFullBarRests
      R1 |%1
      R1 |%2
      R1 |%3
      r2 r4 r8 r16 r32 r64 r128 r128 |%4
      r2. r4 |%5
      r4. r8. r16. r32. r64. r128. r128. r4 \bar "|." |%6
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }                
    >>
  >>
}
\layout {
  indent = 3.0\cm
%  short-indent = 1.5\cm
}