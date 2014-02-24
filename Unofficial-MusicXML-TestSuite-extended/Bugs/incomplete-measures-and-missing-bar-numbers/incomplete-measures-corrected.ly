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
\set Score.barNumberVisibility = #all-bar-numbers-visible
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
    \stemDown e4 \stemDown f4 \stemDown e4 \bar "" \break 
%\set Timing.measurePosition = #(ly:make-moment -1 4)
\stemUp g,4 | % 5
%\set Score.currentBarNumber = #5
    \stemDown c4 \stemDown c4 \stemDown c4 \stemDown c4 | % 6
    \stemDown b4 \stemDown b4 \stemDown b4 \stemDown b4 | % 7
    \stemDown d4 \stemDown d4 \stemDown d4 \stemDown d4 | % 8
    c1 c1 c1 c1 c1 c1 c1 c1 c1 c1 c1 c1 c1\bar "|."
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

