
\version "2.15.14"
% automatically converted by musicxml2ly from 33c-Spanners-Slurs.xml

\header {
    texidoc = "A note can be the end of one 
          slur and the start of a new slur. Also, in MusicXML, nested slurs 
          are possible like in the second measure where one slur goes over all
          four notes, and another slur goes from the second to the third 
          note."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \clef "treble" \key c \major \time 4/4 g4 ( c4 ) ( a4 ) ( g4 ) | % 2
    g4 ( c4 a4 ) g4 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

