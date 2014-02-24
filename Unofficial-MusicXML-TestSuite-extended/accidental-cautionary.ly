
\version "2.15.14"
% automatically converted by musicxml2ly from cautionary-accidental.xml

\header {
    texidoc = "Accidentals can be cautionary
          or editorial. Each measure has a normal accidental, an editorial,
          a cautionary and an editorial and cautionary accidental."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key g \major \time 4/4 fis' ?4 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

