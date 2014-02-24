\version "2.17.26"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"Music"} <<
      \new Voice = "PartP1Staff1Voice1" {
        \key c\major \time 4/4
        \clef treble
        c'1 |%1
      }
    >>
  >>
}
