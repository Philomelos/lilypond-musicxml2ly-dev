
\version "2.15.14"
% automatically converted by musicxml2ly from group-symbol_bracket.xml

\header {
    texidoc = Akkolade
    title = "group-symbol brace"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c''1 }

PartPTwoVoiceNone =  {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\new StaffGroup \with { \consists "Instrument_name_engraver" } <<
    \set StaffGroup.instrumentName = "bracket"
    \new Staff <<
        \context Staff << 
            \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
            >>
        >>
    \new Staff <<
        \context Staff << 
            \context Voice = "PartPTwoVoiceNone" { \PartPTwoVoiceNone }
            >>
        >>
    
    >>

