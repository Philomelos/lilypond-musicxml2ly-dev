
\version "2.15.95"
% automatically converted by musicxml2ly from no-stem-direction_mscz.xml

\header {
    encodingsoftware = "MuseScore 1.2"
    encodingdate = "2013-01-23"
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
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4
    \stemDown c8 [ \stemDown b8 \stemDown b8 \stemDown a8 ] \stemUp a8 [
    \stemUp g8 \stemUp g8 \stemUp f8 ] \bar "|."
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

