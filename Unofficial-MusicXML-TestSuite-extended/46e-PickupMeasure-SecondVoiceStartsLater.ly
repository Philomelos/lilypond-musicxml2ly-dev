
\version "2.14.1"
% automatically converted from 46e-PickupMeasure-SecondVoiceStartsLater.xml

\header {
    texidoc = "Voice 2 should start at 2nd 
            beat of first full measure."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \partial 4 c4 | % 1
    c4 a4 f4 c'4 }

PartPOneVoiceTwo =  \relative c' {
    \partial 4 s4 | % 1
    s4 c4 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \voiceOne \PartPOneVoiceOne }
        \context Voice = "PartPOneVoiceTwo" { \voiceTwo \PartPOneVoiceTwo }
        >>
    >>

