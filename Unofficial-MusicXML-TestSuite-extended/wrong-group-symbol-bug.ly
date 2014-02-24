
\version "2.15.20"
% automatically converted by musicxml2ly from wrong-group-symbol-bug.xml

\header {
    texidoc = "Im 1. Satz von BWV1047 wird bei den Violini di ripieno eine eckige Klammer anstelle einer geforderten geschweiften Systemklammer gesetzt. Verdacht: Regression in LilyPond v2.15.20. In v2.15.14 und v2.15.23 tritt der Fehler nicht auf. Im 3. Satz tritt der Fehler auch mit v2.15.20 nicht auf. Verdacht I: Fehler hängt mit Auftakt zusammen. Nicht bestätigt. Verdacht II: Fehler hängt mit cut-Symbol zusammen?"
    }

PartPOneVoiceOne =  {
    \clef "treble" \key c \major \numericTimeSignature\time 2/2 \partial
    8 c'8 }

PartPOneVoiceNone =  {
    \clef "treble" \key c \major \numericTimeSignature\time 2/2 \partial
    8 s8 | % 1
    c''1*1/8 }

PartPTwoVoiceOne =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 f''8 }

PartPTwoVoiceNone =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 s8 | % 1
    c1*1/8 }

PartPThreeVoiceOne =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 f''8 }

PartPThreeVoiceNone =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 s8 | % 1
    c''1*1/8 }

PartPFourVoiceOne =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 f''8 }

PartPFourVoiceNone =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 s8 | % 1
    c1*1/8 }

PartPFiveVoiceOne =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 f''8 }

PartPFiveVoiceNone =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 s8 | % 1
    c''1*1/4 }

PartPSixVoiceOne =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 c''8 }

PartPSixVoiceNone =  {
    \clef "treble" \key f \major \numericTimeSignature\time 2/2 \partial
    8 s8 | % 1
    c1*1/4 }

PartPSevenVoiceOne =  {
    \clef "alto" \key f \major \numericTimeSignature\time 2/2 \partial 8
    a'8 }

PartPSevenVoiceNone =  {
    \clef "alto" \key f \major \numericTimeSignature\time 2/2 \partial 8
    s8 | % 1
    c''1*1/4 }

PartPEightVoiceOne =  {
    \clef "bass" \key f \major \numericTimeSignature\time 2/2 \partial 8
    f,8 }

PartPEightVoiceNone =  {
    \clef "bass" \key f \major \numericTimeSignature\time 2/2 \partial 8
    s8 | % 1
    c1*1/4 }

PartPNineVoiceOne =  {
    \clef "bass" \key f \major \numericTimeSignature\time 2/2 \partial 8
    f,8 }

PartPNineVoiceNone =  {
    \clef "bass" \key f \major \numericTimeSignature\time 2/2 \partial 8
    s8 | % 1
    c1*1/4 }


% The score definition
\score {
    <<
        \new StaffGroup \with { \consists "Instrument_name_engraver" }
        <<
            \set StaffGroup.instrumentName = \markup { \center-column { \line {""} \line {"			"} } }
            \set StaffGroup.shortInstrumentName = \markup { \center-column { \line {""} \line {"			"} } }
            \new Staff <<
                \set Staff.instrumentName = "Tromba."
                \context Staff << 
                    \context Voice = "PartPOneVoiceOne" { \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceNone" { \voiceTwo \PartPOneVoiceNone }
                    >>
                >>
            \new Staff <<
                \set Staff.instrumentName = \markup { \center-column { \line {"Flauto."} \line {"(Flûte à bec)"} } }
                \context Staff << 
                    \context Voice = "PartPTwoVoiceOne" { \voiceOne \PartPTwoVoiceOne }
                    \context Voice = "PartPTwoVoiceNone" { \voiceTwo \PartPTwoVoiceNone }
                    >>
                >>
            \new Staff <<
                \set Staff.instrumentName = "Oboe."
                \context Staff << 
                    \context Voice = "PartPThreeVoiceOne" { \voiceOne \PartPThreeVoiceOne }
                    \context Voice = "PartPThreeVoiceNone" { \voiceTwo \PartPThreeVoiceNone }
                    >>
                >>
            \new Staff <<
                \set Staff.instrumentName = "Violino."
                \context Staff << 
                    \context Voice = "PartPFourVoiceOne" { \voiceOne \PartPFourVoiceOne }
                    \context Voice = "PartPFourVoiceNone" { \voiceTwo \PartPFourVoiceNone }
                    >>
                >>
            
            >>
        \new StaffGroup \with { \consists "Instrument_name_engraver" }
        <<
            \set StaffGroup.instrumentName = \markup { \center-column { \line {""} \line {"			"} } }
            \set StaffGroup.shortInstrumentName = \markup { \center-column { \line {""} \line {"			"} } }
            \new StaffGroup \with { systemStartDelimiter =
                #'SystemStartBrace } <<
                \new Staff <<
                    \set Staff.instrumentName = \markup { \center-column { \line {"Violino 1."} \line {"di ripieno."} } }
                    \context Staff << 
                        \context Voice = "PartPFiveVoiceOne" { \voiceOne \PartPFiveVoiceOne }
                        \context Voice = "PartPFiveVoiceNone" { \voiceTwo \PartPFiveVoiceNone }
                        >>
                    >>
                \new Staff <<
                    \set Staff.instrumentName = \markup { \center-column { \line {"Violino 2."} \line {"di ripieno."} } }
                    \context Staff << 
                        \context Voice = "PartPSixVoiceOne" { \voiceOne \PartPSixVoiceOne }
                        \context Voice = "PartPSixVoiceNone" { \voiceTwo \PartPSixVoiceNone }
                        >>
                    >>
                
                >>
            \new Staff <<
                \set Staff.instrumentName = \markup { \center-column { \line {"Viola"} \line {"di ripieno."} } }
                \context Staff << 
                    \context Voice = "PartPSevenVoiceOne" { \voiceOne \PartPSevenVoiceOne }
                    \context Voice = "PartPSevenVoiceNone" { \voiceTwo \PartPSevenVoiceNone }
                    >>
                >>
            \new Staff <<
                \set Staff.instrumentName = \markup { \center-column { \line {"Violone"} \line {"di ripieno."} } }
                \context Staff << 
                    \context Voice = "PartPEightVoiceOne" { \voiceOne \PartPEightVoiceOne }
                    \context Voice = "PartPEightVoiceNone" { \voiceTwo \PartPEightVoiceNone }
                    >>
                >>
            \new Staff <<
                \set Staff.instrumentName = \markup { \center-column { \line {"Violoncello"} \line {"e Cembalo"} \line {"all' unisono."} } }
                \context Staff << 
                    \context Voice = "PartPNineVoiceOne" { \voiceOne \PartPNineVoiceOne }
                    \context Voice = "PartPNineVoiceNone" { \voiceTwo \PartPNineVoiceNone }
                    >>
                >>
            
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

