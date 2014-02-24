\version "2.17.28"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"MusicXML Part"} <<
      \new Voice = "PartP1Staff1Voice1" {
      \key c\major \time 4/4
      \clef treble
      des'4 des'4 ^\markup {\smaller\flat} des'!4 des'!4 ^\markup {\smaller\flat} |%1
      cis'4 cis'4 ^\markup {\smaller\sharp} cis'!4 cis'!4 ^\markup {\smaller\sharp} |%2
      deses'4 deses'4 ^\markup {\smaller\doubleflat} deses'!4 deses'!4 ^\markup {\smaller\doubleflat} |%3
      cisis'4 cisis'4 ^\markup {\smaller\doublesharp} cisis'!4 cisis'!4 ^\markup {\smaller\doublesharp} |%4
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }                
    >>
  >>
}
\layout {
  indent = 3.0\cm
  short-indent = 1.5\cm
}