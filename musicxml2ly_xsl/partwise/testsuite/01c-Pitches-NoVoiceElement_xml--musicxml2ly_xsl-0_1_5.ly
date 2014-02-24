\version "2.17.26"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"MusicXML Part"} <<
      \new Voice = "PartP1Staff1Voice1" {
      \clef treble
      g'1 \bar "|." |%1
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        A
      }                
    >>
  >>
}
