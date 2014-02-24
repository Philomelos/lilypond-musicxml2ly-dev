
\version "2.15.14"
% automatically converted by musicxml2ly from 256th.xml

\header {
    texidoc = Zweihundertsechsundfünfzigstelnote
    title = "256th"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 c256 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

