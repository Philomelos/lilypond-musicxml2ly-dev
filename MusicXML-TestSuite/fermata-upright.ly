
\version "2.15.14"
% automatically converted by musicxml2ly from fermata-upright.xml

\header {
    texidoc = "Aufrechte??? Fermate."
    title = "upright fermata"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 \fermata }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

