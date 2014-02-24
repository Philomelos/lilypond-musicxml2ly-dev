\version "2.17.28"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"MusicXML Part"} <<
      \new Voice = "PartP1Staff1Voice1" {
      \key c\major 
      \time 5/4
      \clef treble
      r4 e'4\rest f''4\rest a4\rest c'''4\rest |%1
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }                
    >>
  >>
}
\layout {
  indent = 3.0\cm
%  short-indent = 0.5\cm
}