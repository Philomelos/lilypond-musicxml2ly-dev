
\version "2.15.14"
% automatically converted by musicxml2ly from fermata-square.xml

\header {
    texidoc = "Eckige Fermate."
    title = "square fermata"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 \longfermata }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

