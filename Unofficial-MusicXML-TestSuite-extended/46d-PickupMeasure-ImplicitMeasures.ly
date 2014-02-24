
\version "2.14.1"
% automatically converted from 46d-PickupMeasure-ImplicitMeasures.xml

\header {
    texidoc = "A 3/8 pickup measure, a measure 
          that is split into one (incomplete, only 2/4) measure and an implicit 
          measure, and an incomplete measure (containg 3/4)."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative e' {
    \clef "treble" \key c \major \time 4/4 \partial 4. e4 e8 | % 1
    f4 g4 \bar ""
    a4 b4 | % 2
    c4 d4 r4 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

