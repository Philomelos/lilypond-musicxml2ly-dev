\version "2.17.28"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"MusicXML Part"} <<
      \new Voice = "PartP1Staff1Voice1" {
      \key c\major \time 4/4
      \clef treble
      ceseh'4 deh'4 eih'4 fisih'4 |%1
      ceseh''4 deh''4 eih''4 fisih''4 \bar "|." |%2
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }                
    >>
  >>
}