\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.16-1 (10.11.2013)
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
      \set Staff.instrumentName = #"MusicXML Part"
      \new Voice = "PartP1Staff1Voice1" {
        \key c\major
        \time 4/4
        \clef treble
        c'1  |%1
        \clef alto
        c'1  |%2
        \clef tenor
        c'1  |%3
        \clef bass
        c'1  |%4
        \clef percussion
        c'1  |%5
        \clef "treble_8"
        c'1  |%6
        \clef "bass_8"
        c'1  |%7
        \clef varbaritone
        c'1  |%8
        \clef french
        c'1  |%9
        \clef baritone
        c'1  |%10
        \clef mezzosoprano
        c'1  |%11
        \clef soprano
        c'1  |%12
        \clef percussion
        c'1  |%13
        \clef "treble^8"
        c'1  |%14
        \clef "bass^8"
        c'1  |%15
        \clef tab
        c'1  |%16
        \break
        \once \override Staff.Clef #'stencil = ##f
        c'1  |%17
        \clef treble
        c'1  |%18
        \bar "|."
        
      }
    >>
  >>            
}