
\version "2.14.2"
% automatically converted from 11a-TimeSignatures.xml

\header {
    texidoc = "Various time signatures: 2/2 
            (alla breve), 4/4 (C), 2/2, 3/2, 2/4, 3/4, 4/4, 5/4, 3/8, 6/8, 
            12/8"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 2/2 c1 | % 2
    \time 4/4  c1 | % 3
    \numericTimeSignature\time 2/2  c1 | % 4
    \time 3/2  c1. | % 5
    \time 2/4  c2 | % 6
    \time 3/4  c2. | % 7
    \numericTimeSignature\time 4/4  c1 | % 8
    \time 5/4  c1 ~ c4 | % 9
    \time 3/8  c4. | \barNumberCheck #10
    \time 6/8  c2. | % 11
    \time 12/8  c1. \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

