\version "2.17.15"
% automatically converted by musicxml2ly from unwanted_staves.xml

\header {
    miscellaneous = "if an .xml file contains only <staff> elements with value \"1\" (i.e. <staff>1</staff>) AND no <voice> element in a chorded note musicxml2ly erroneously thinks that there are several staves."
    title = "staff-elements can cause an additional empty staff"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative f' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 s1 | % 2
    s1*1/35 \stemUp f4*4/105 }

PartPOneVoiceOneLyricsOne =  \lyricmode { And }
PartPOneVoiceNone =  \relative c' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 s1 | % 2
    r2.*4/105 }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff = "1" << 
                        \context Voice = "PartPOneVoiceOne" {  \voiceOne \PartPOneVoiceOne }
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
                        \context Voice = "PartPOneVoiceNone" {  \voiceTwo \PartPOneVoiceNone }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

