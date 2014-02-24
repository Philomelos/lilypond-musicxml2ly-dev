
\version "2.15.29"
% automatically converted by musicxml2ly from midi-block.xml

\header {
    texidoc = "musicxml2ly v2.15.29 currently does not include a midi-block when there is 
a) more than one part element
b) a part-group element"
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
        \set Staff.instrumentName = "Music"
        \context Staff << 
            \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
            >>
        >>
    \new Staff <<
        \set Staff.instrumentName = "Music"
        \context Staff << 
            \context Voice = "PartPTwoVoiceNone" { \PartPTwoVoiceNone }
            >>
        >>
    
    >>

