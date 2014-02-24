
\version "2.15.14"
% automatically converted by musicxml2ly from bug-trill-mark_wavy-line.xml

\header {
    texidoc = "musicxml2ly v2.15.14 konvertiert ein trill-mark in Kombination mit wavy-line nicht als Trillersymbol in Kombination mit einer Wellenlinie, sondern als ein Trillersymbol ohne und eines mit einer Wellenlinie."
    title = "bug: trill-mark / wavy-line"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 \trill \startTrillSpan }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

