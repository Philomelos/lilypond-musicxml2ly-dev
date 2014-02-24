\version "2.17.29"
% transformed with musicxml2ly.xsl v0.1.14-2 (02.11.2013)
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
        \compressFullBarRests
        \time 1/8
        c''8 |%1
        R8  |%2
        \time 2/8
        c''4 |%3
        R4  |%4
        \time 3/4
        c''2. |%5
        R4*3  |%6
        \time 4/4
        c''1 |%7
        R1  |%8
        \time 5/16
        c''4 c''16 |%9
        R16*5  |%10
        \time 7/8
        c''2.. |%11
        R8*7  |%12
        \time 9/8
        c''1 c''8 |%13
        R8*9  |%14
        \time 31/8
        c''16 \repeat unfold 61 { r16 } |%15
        R8*31  |%16
        \time 2/2
        c''1 |%17
      }
    >>
  >>            
}