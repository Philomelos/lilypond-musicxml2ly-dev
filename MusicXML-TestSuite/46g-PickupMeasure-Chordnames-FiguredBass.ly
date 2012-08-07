
\version "2.14.1"
% automatically converted from 46g-PickupMeasure-Chordnames-FiguredBass.xml

\header {
    texidoc = "Pickup measure with chord names 
           and figured bass."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \key c \major \numericTimeSignature\time 4/4 \partial 4 c8 c8 | % 1
    c,4 c4 c4 c4 }

PartPOneVoiceOneChords =  \chordmode {
    \partial 4 c8:5 s8 | % 1
    c4:5 s4 s4 }

PartPOneVoiceOneFiguredBass =  \figuremode {
    \partial 4 <3>8 s8 | % 1
    <3>8 s8 s4 s4 }


% The score definition
\new Staff <<
    \context ChordNames = "PartPOneVoiceOneChords" \PartPOneVoiceOneChords
    \context Staff <<
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \context FiguredBass = "PartPOneVoiceOneFiguredBass" \PartPOneVoiceOneFiguredBass
        >>
    >>

