
\version "2.15.14"
% automatically converted by musicxml2ly from 01e-Pitches-ParenthesizedAccidentals.xml

\header {
    texidoc = "Accidentals can be cautionary
          or editorial. Each measure has a normal accidental, an editorial,
          a cautionary and an editioal and cautionary accidental."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 des'4 des'4 des' ?4 des' ?4 | % 2
    cis'4 cis'4 cis' ?4 cis' ?4 | % 3
    deses'4 deses'4 deses' ?4 deses' ?4 | % 4
    cisis'4 cisis'4 cisis' ?4 cisis' ?4 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

