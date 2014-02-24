
\version "2.15.14"
% automatically converted by musicxml2ly from inverted-fermata.xml

\header {
    texidoc = "Invertierte Fermate"
    title = "inverted fermata"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 _\fermata }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

