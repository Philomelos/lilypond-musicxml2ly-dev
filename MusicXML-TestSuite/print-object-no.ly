
\version "2.15.23"
% automatically converted by musicxml2ly from print-object-no.xml

\header {
    texidoc = "Darstellung von Polymetrik über die Elemente 'actual-notes' und 'normal-notes'."
    title = "print-lyric=\"no\""
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 s2 c'2 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

