\version "2.17.6"
% automatically converted by musicxml2ly from incomplete-measures.xml

\header {
    encodingsoftware = "MuseScore 1.2"
    title = "incomplete measures "
    copyright = "rien à branler"
    encodingdate = "2013-02-15"
    }

#(set-global-staff-size 20.0762645669)
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 1.0\cm
    bottom-margin = 2.0\cm
    left-margin = 1.0\cm
    right-margin = 1.0\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 \partial
    4 \stemUp g4 \repeat volta 2 {
        | % 1
        \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4 }
    \alternative { {
            | % 2
            \stemDown b4 \stemDown b4 \stemDown b4 \stemDown b4 }
        {
            | % 3
            \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4 }
        } | % 4
    \stemDown e4 \stemDown f4 \stemDown e4 \break \stemUp g,4 | % 5
    \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4 | % 6
    \stemDown b4 \stemDown b4 \stemDown b4 \stemDown b4 | % 7
    \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4 | % 8
    c1 | % 9
    c1 | \barNumberCheck #10
    c1 | % 11
    c1 | % 12
    c1 | % 13
    c1 | % 14
    c1 | % 15
    c1 | % 16
    c1 | % 17
    c1 | % 18
    c1 | % 19
    c1 \break | \barNumberCheck #20
    c1 | % 21
    c1 | % 22
    c1 | % 23
    c1 | % 24
    c1 \bar "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

