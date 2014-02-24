\version "2.17.29"
% transformed with musicxml2ly.xsl v0.1.13-2 (30.10.2013)
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
        \time 16/4
        \clef treble
        c''\longa |%1
        c''\breve c''1 c''2 c''4 c''8 c''16 c''32 c''64 c''128 c''128 |%2
        \time 24/4
        c''\longa. |%4
        c''\breve. c''1. c''2. c''4. c''8. c''16. c''32. c''64. c''128. c''128. |%5
        \time 28/4
        c''\longa.. |%6
        c''\breve.. c''1.. c''2.. c''4.. c''8.. c''16.. c''32.. c''64.. c''64.. |%7
        \bar "|."
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        
      }
    >>
  >>            
}