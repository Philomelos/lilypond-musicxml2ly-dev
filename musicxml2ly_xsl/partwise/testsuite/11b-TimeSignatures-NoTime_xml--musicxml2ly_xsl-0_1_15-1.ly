\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.15-1 (07.11.2013)
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
      \set PianoStaff.instrumentName = #""
      \new Staff = "PartP1Staff1" <<
        \new Voice = "PartP1Staff1Voice1" {
        \key c\major        
        \clef treble
        \time 4/4
        f'1 |%1
        
        }
      >>
            
      \new Staff = "PartP1Staff2" <<
        \new Voice = "PartP1Staff2Voice2" {
        \key c\major        
        \clef bass
        \time 4/4
        b,1 |%1
        
        }
      >>
    >>
  >>            
}