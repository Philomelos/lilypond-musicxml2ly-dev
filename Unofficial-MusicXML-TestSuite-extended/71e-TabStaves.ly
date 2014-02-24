
\version "2.15.24"
% automatically converted by musicxml2ly from 71e-TabStaves.xml

\header {
    texidoc = "Some tablature staves, with
          explicit fingering information and different string tunings given
          in the MusicXML file."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #6
    \startStaff \key c \major g4 \4 e''4 \2 c'4 \2 e4 \4 | % 2
    <gis, fis g>4 \6 \4 \3 d4 \5 gis4 \3 e'4 \1 \bar "|."
    }

PartPTwoVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #6
    \startStaff \key c \major dis'4 \2 gis4 \3 c4 \5 r4 | % 2
    fis'4 \1 g4 \3 g4 \4 fis,4 \6 \bar "|."
    }

PartPThreeVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #6
    \startStaff \key c \major ais4 \2 b,8 \5 a8 \3 s2 | % 2
    gis'4 \1 d'4 \2 gis,4 \6 d4 \4 \bar "|."
    }

PartPFourVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #6
    \startStaff \key c \major b8 \3 <d d, g, a, a,>8 \5 \6 \6 \5 \5 s2.
    | % 2
    d'4 \1 d4 \4 a,4 \5 d,4 \6 \bar "|."
    }

PartPFiveVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #4
    \startStaff \key c \major g,4 \1 e,,4 \4 d,4 \2 ais,4 \2 | % 2
    a,,4 \3 a,,4 \3 a,,4 \3 a,,4 \3 \bar "|."
    }

PartPSixVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #5
    \startStaff \key c \major dis'4 \2 d4 \4 d'4 \1 r4 | % 2
    g4 \3 g'4 \5 g'4 \5 g'4 \5 \bar "|."
    }

PartPSevenVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #6
    \startStaff \key c \major cis'4 \3 cis4 \5 a'4 \1 e'4 \3 | % 2
    d'4 \2 f4 \4 g,4 \6 c4 \5 \bar "|."
    }

PartPEightVoiceOne =  {
    \clef "tab" \stopStaff \override Staff.StaffSymbol #'line-count = #4
    \startStaff \key c \major e'''4 \3 b'4 \1 c'4 \2 e'4 \3 | % 2
    c'4 \2 c'4 \2 c'4 \2 c'4 \2 \bar "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new StaffGroup <<
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 2 0) ,(ly:make-pitch -1 6
                            0) ,(ly:make-pitch -1 4 0) ,(ly:make-pitch
                            -1 1 0) ,(ly:make-pitch -2 5 0)
                            ,(ly:make-pitch -2 2 0) ) } <<
                            \set TabStaff.instrumentName = "Guitar"
                            \set TabStaff.shortInstrumentName = "Gtr."
                            \context TabStaff << 
                                \context TabVoice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 2 0) ,(ly:make-pitch -1 6
                            0) ,(ly:make-pitch -1 4 0) ,(ly:make-pitch
                            -1 1 0) ,(ly:make-pitch -2 5 0)
                            ,(ly:make-pitch -2 2 0) ) } <<
                            \set TabStaff.instrumentName = "Guitar"
                            \set TabStaff.shortInstrumentName = "Gtr."
                            \context TabStaff << 
                                \context TabVoice = "PartPTwoVoiceOne" { \PartPTwoVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 2 0) ,(ly:make-pitch -1 5
                            0) ,(ly:make-pitch -1 3 1) ,(ly:make-pitch
                            -1 1 0) ,(ly:make-pitch -2 5 0)
                            ,(ly:make-pitch -2 1 0) ) } <<
                            \set TabStaff.instrumentName = "Guitar"
                            \set TabStaff.shortInstrumentName = "Gtr."
                            \context TabStaff << 
                                \context TabVoice = "PartPThreeVoiceOne" { \PartPThreeVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 1 0) ,(ly:make-pitch -1 6
                            0) ,(ly:make-pitch -1 4 0) ,(ly:make-pitch
                            -1 1 0) ,(ly:make-pitch -2 5 0)
                            ,(ly:make-pitch -2 1 0) ) } <<
                            \set TabStaff.instrumentName = "Guitar"
                            \set TabStaff.shortInstrumentName = "Gtr."
                            \context TabStaff << 
                                \context TabVoice = "PartPFourVoiceOne" { \PartPFourVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch -2 4 0) ,(ly:make-pitch -2 1
                            0) ,(ly:make-pitch -3 5 0) ,(ly:make-pitch
                            -3 2 0) ) } <<
                            \set TabStaff.instrumentName = "Bass Guitar"
                            \set TabStaff.shortInstrumentName = "Bass"
                            \context TabStaff << 
                                \context TabVoice = "PartPFiveVoiceOne" { \PartPFiveVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 1 0) ,(ly:make-pitch 0 0
                            0) ,(ly:make-pitch -1 4 0) ,(ly:make-pitch
                            -1 1 0) ,(ly:make-pitch 0 4 0) ) } <<
                            \set TabStaff.instrumentName = "Banjo"
                            \set TabStaff.shortInstrumentName = "Bjo."
                            \context TabStaff << 
                                \context TabVoice = "PartPSixVoiceOne" { \PartPSixVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 4 0) ,(ly:make-pitch 0 1
                            0) ,(ly:make-pitch -1 5 0) ,(ly:make-pitch
                            -1 3 0) ,(ly:make-pitch -1 0 0)
                            ,(ly:make-pitch -2 4 0) ) } <<
                            \set TabStaff.instrumentName = "Lute"
                            \set TabStaff.shortInstrumentName = "L."
                            \context TabStaff << 
                                \context TabVoice = "PartPSevenVoiceOne" { \PartPSevenVoiceOne }
                                >>
                            >>
                        >>
                    <<
 \new TabStaff \with { stringTunings = #`(
                            ,(ly:make-pitch 0 4 0) ,(ly:make-pitch 0 0
                            0) ,(ly:make-pitch 0 2 0) ,(ly:make-pitch 0
                            5 0) ) } <<
                            \set TabStaff.instrumentName = "Ukulele"
                            \set TabStaff.shortInstrumentName = "Uk."
                            \context TabStaff << 
                                \context TabVoice = "PartPEightVoiceOne" { \PartPEightVoiceOne }
                                >>
                            >>
                        >>
                    
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

