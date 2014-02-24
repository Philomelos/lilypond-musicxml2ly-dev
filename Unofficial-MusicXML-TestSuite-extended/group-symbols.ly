
\version "2.15.14"
% automatically converted by musicxml2ly from group-symbols.xml

\header {
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPThreeVoiceNone =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c''1 }

PartPFourVoiceNone =  {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 c1 }

PartPFiveVoiceNone =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c''1 }

PartPSixVoiceNone =  {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 c1 }

PartPSevenVoiceNone =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c''1 }

PartPEightVoiceNone =  {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\score {
    <<
        \new StaffGroup \with { \consists "Instrument_name_engraver"
            systemStartDelimiter = #'SystemStartBrace } <<
            \set StaffGroup.instrumentName = "brace"
            \new Staff <<
                \context Staff << 
                    \context Voice = "PartPThreeVoiceNone" { \PartPThreeVoiceNone }
                    >>
                >>
            \new Staff <<
                \context Staff << 
                    \context Voice = "PartPFourVoiceNone" { \PartPFourVoiceNone }
                    >>
                >>
            
            >>
        \new StaffGroup \with { \consists "Instrument_name_engraver"
            systemStartDelimiter = #'SystemStartSquare } <<
            \set StaffGroup.instrumentName = "line"
            \new Staff <<
                \context Staff << 
                    \context Voice = "PartPFiveVoiceNone" { \PartPFiveVoiceNone }
                    >>
                >>
            \new Staff <<
                \context Staff << 
                    \context Voice = "PartPSixVoiceNone" { \PartPSixVoiceNone }
                    >>
                >>
            
            >>
        \new StaffGroup \with { \consists "Instrument_name_engraver" }
        <<
            \set StaffGroup.instrumentName = "bracket"
            \new Staff <<
                \context Staff << 
                    \context Voice = "PartPSevenVoiceNone" { \PartPSevenVoiceNone }
                    >>
                >>
            \new Staff <<
                \context Staff << 
                    \context Voice = "PartPEightVoiceNone" { \PartPEightVoiceNone }
                    >>
                >>
            
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

