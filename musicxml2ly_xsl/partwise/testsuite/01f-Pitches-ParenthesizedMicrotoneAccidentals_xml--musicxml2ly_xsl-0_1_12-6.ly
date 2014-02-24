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
        deh'4 deh'4 ^\markup \parenthesize { \semiflat }deh'!4 deh'?4 ^\markup \parenthesize { \semiflat }|%1
        cis'4 cis'4 ^\markup { \sharp }cis'!4 cis'!4 ^\markup { \sharp }|%2
        deseh'4 deseh'4 ^\markup \parenthesize { \sesquiflat }deseh'!4 deseh'!4 ^\markup \parenthesize { \sesquiflat }|%3
        cisih'4 cisih'4 ^\markup { \sesquisharp }cisih'!4 cisih'!4 ^\markup { \sesquisharp }|%4
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }
    >>
  >>            
}