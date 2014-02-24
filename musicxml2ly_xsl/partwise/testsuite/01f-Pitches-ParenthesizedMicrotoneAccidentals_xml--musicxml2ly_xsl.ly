\version "2.17.28"
\score {
  <<
    \new Staff = "PartP1Staff1" \with {
      instrumentName = #"MusicXML Part"} <<
      \new Voice = "PartP1Staff1Voice1" {
      \key c\major \time 4/4
      \clef treble
      deh'4 deh'4 ^\markup {\tiny\concat {[\semiflat]}} deh'! 4 deh'? 4 ^\markup {\tiny\concat {[\semiflat]}} |%1
      cis'4 cis'4 ^\markup {\tiny\sharp} cis'! 4 cis'! 4 ^\markup {\tiny\sharp} |%2
      deseh'4 deseh'4 ^\markup {\tiny\sesquiflat} deseh'! 4 deseh'! 4 ^\markup {\tiny\sesquiflat} |%3
      cisih'4 cisih'4 ^\markup {\tiny\sesquisharp} cisih'! 4 cisih'! 4 ^\markup {\tiny\sesquisharp} |%4
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