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
        des'4 des'4 ^\markup { \flat }des'!4 des'!4 ^\markup { \flat }|%1
        cis'4 cis'4 ^\markup { \sharp }cis'!4 cis'!4 ^\markup { \sharp }|%2
        deses'4 deses'4 ^\markup { \doubleflat }deses'!4 deses'!4 ^\markup { \doubleflat }|%3
        cisis'4 cisis'4 ^\markup { \doublesharp }cisis'!4 cisis'!4 ^\markup { \doublesharp }|%4
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }
    >>
  >>            
}