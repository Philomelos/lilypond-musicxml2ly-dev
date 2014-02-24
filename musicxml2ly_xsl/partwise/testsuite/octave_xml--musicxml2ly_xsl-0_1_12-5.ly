\version "2.17.28"
% transformed with musicxml2ly.xsl v0.1.12-5 (25.10.2013)
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
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"Octaves"
      \new Staff = "PartP1Staff1" <<
        \new Voice = "PartP1Staff1Voice1" {
          \key c\major
          \time 4/4
          \clef treble
          r1 |%1
          c'4 c''4 c'''4 c''''4 |%2
          c'''''4 c''''''4 r2 |%3
          \bar "|."
        }
      >>
            
      \new Staff = "PartP1Staff2" <<
        \new Voice = "PartP1Staff2Voice2" {
          \key c\major
          \time 4/4
          \clef bass
          c,,,4 c,,4 c,4 c4 |%1
          r1 |%2
          r1 |%3
          \bar "|."
        }
      >>
    >>
  >>            
}