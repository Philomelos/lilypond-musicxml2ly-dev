\version "2.17.95"
% transformed with musicxml2ly.xsl v0.1.17-2 (11.11.2013)
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
        \key d\major
        \time 4/4
        \clef treble
        g'4 \key b\minor
        g'4 \key d\ionian
        g'4 \key e\dorian
        g'4  |%1
        \key fis\phrygian
        g'4 \key g\lydian
        g'4 \key a\mixolydian
        g'4 \key b\aeolian
        g'4  |%2
        \key cis\locrian
        g'4  |%3
        
      }
      \new Lyrics \lyricsto "PartP1Staff1Voice1" {
        major minor ionian dorian phrygian lydian mixolydian aeolian locrian 
      }
    >>
  >>            
}