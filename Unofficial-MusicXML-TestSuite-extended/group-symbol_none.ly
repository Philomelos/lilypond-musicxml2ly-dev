
\version "2.15.14"
% automatically converted by musicxml2ly from group-symbol_none.xml

\header {
    texidoc = "The value 'none' of the element 'group-symbol' leads to a bus error when the converted .ly-file is compiled with LilyPond v2.15.14. There is no problem with the conversion and compilation of the other group-symbols (brace, line and bracket)."
    title = "group-symbol none leads to bus error"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 }

PartPTwoVoiceNone =  \relative c {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\new StaffGroup \with { systemStartDelimiter = #'SystemStartBar } <<
    \new Staff <<
        \set Staff.instrumentName = "I"
        \context Staff << 
            \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
            >>
        >>
    \new Staff <<
        \set Staff.instrumentName = "II"
        \context Staff << 
            \context Voice = "PartPTwoVoiceNone" { \PartPTwoVoiceNone }
            >>
        >>
    
    >>

