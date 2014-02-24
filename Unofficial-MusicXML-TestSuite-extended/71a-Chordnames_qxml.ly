
\version "2.14.2"
% automatically converted from 71a-Chordnames_qxml.xml

\header {
    texidoc = "A normal staff with several 
          (complex) chord names displayed."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative a' {
    \clef "treble" \key c \major \time 4/4 a4 a4 a4 a4 | % 2
    a4 a4 a4 a4 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

