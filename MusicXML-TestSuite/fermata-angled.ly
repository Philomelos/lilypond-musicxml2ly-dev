
\version "2.15.14"
% automatically converted by musicxml2ly from fermata-angled.xml

\header {
    texidoc = "Spitze Fermate."
    title = "angled fermata"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 \shortfermata }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

