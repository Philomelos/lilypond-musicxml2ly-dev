
\version "2.15.23"
% automatically converted by musicxml2ly from feathered-beams.xml

\header {
    texidoc = "Das Markup fan=\"accel\" scheint sich nicht auszuwirken, wird eventuell von LilyPond 2.15.23 noch nicht unterstützt oder aber das Minimalbeispiel ist so nicht richtig."
    title = "Feathered Beams"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative f {
    \clef "bass" \key f \major \numericTimeSignature\time 4/4 f16 [ g16
    a16 g16 ] f16 [ g16 a16 g16 ] f16 [ e16 f16 g16 ] a16 [ bes16 a16 g16
    ] }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

