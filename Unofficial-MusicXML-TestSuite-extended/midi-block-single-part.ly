
\version "2.15.29"
% automatically converted by musicxml2ly from midi-block-single-part.xml

\header {
    texidoc = "musicxml2ly v2.15.29 currently does not include a midi-block in the generated .ly-file when there is only one part element."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\new Staff <<
    \set Staff.instrumentName = "I1"
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

