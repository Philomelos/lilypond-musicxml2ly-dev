
\version "2.15.14"
% automatically converted by musicxml2ly from 64th.xml

\header {
    texidoc = Vierundsechzigstelnote
    title = "64th"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 c64 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

