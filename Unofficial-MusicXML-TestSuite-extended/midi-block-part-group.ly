
\version "2.15.29"
% automatically converted by musicxml2ly from midi-block-part-group.xml

\header {
    texidoc = "musicxml2ly v2.15.29 currently does not include a midi-block in the generated .ly-file when there is a part-group element. This is true for this file but not necessarily for other files."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 }

PartPTwoVoiceNone =  \relative c' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\new StaffGroup <<
    \new Staff <<
        \set Staff.instrumentName = "I1"
        \context Staff << 
            \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
            >>
        >>
    \new Staff <<
        \set Staff.instrumentName = "I2"
        \context Staff << 
            \context Voice = "PartPTwoVoiceNone" { \PartPTwoVoiceNone }
            >>
        >>
    
    >>

