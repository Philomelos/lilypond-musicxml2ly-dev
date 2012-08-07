
\version "2.15.14"
% automatically converted by musicxml2ly from 128th.xml

\header {
    texidoc = Hundertundachtundzwanzigstelnote
    title = "128th"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 c128 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

