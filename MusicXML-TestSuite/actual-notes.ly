
\version "2.15.23"
% automatically converted by musicxml2ly from actual-notes.xml

\header {
    texidoc = "Darstellung von Polymetrik über die Elemente 'actual-notes' und 'normal-notes'."
    title = Polymetrik
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative f' {
    \clef "treble" \key c \major \time 4/4 \times 2/3 {
        f2 f2 f2 }
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

