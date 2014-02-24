
\version "2.15.29"
% automatically converted by musicxml2ly from multiple-rights.xml

\header {
    texidoc = "there can be multiple <rights> tags with or without one of the three values \"music\", \"words\" or \"arrangement\" in the identification element of a score. musicxml2ly dumps all of them in the LilyPond variable copyright without mentioning the type. The content of this variable is typeset in one line."
    copyright = "Public Domain
Public Domain
CC0"
    title = "multiple rights"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

