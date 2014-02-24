\version "2.17.28"
% transformed with musicxml2ly.xsl v0.1.12-7 (26.10.2013)
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
      \set PianoStaff.instrumentName = #"MusicXML Part"
      \new Staff = "PartP1Staff1" <<
        \new Voice = "PartP1Staff1Voice1" {
          \key c\major
          \time 4/4
          \clef treble
              \partial 4 
          c''4  |%0
          a'1  |%1
          \bar "|."
        }
      >>
            
      \new Staff = "PartP1Staff2" <<
        \new Voice = "PartP1Staff2Voice2" {
          \key c\major
          \time 4/4
          \clef bass
              \partial 4 
           r4  |%0
           e1 |%1
          \bar "|."
        }
      >>
    >>
  >>            
}