\version "2.17.15"
% automatically converted by musicxml2ly from TieAndSlur_pls.xml

\header {
    copyright = "Copyright © JMI"
    encodingdate = "2013-04-08"
    encodingdescription = "Sibelius / MusicXML 3.0"
    title = "Tie and Slur"
    encoder = "Jacques Menu"
    poet = Oboe
    composer = "J. Menu"
    encodingsoftware = "Sibelius 7.1.3"
    }

#(set-global-staff-size 597.507874016)
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 1.49\cm
    bottom-margin = 1.49\cm
    left-margin = 1.49\cm
    right-margin = 1.49\cm
    between-system-space = 1.75\cm
    indent = 0.600666666667\cm
    short-indent = 0.4505\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative a' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4
    \pageBreak \stemUp a4 ~ \stemUp a4 ( \stemDown b4 ) \stemDown d4 | % 2
    \key c \major g1 \bar "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \set Staff.instrumentName = "Oboe"
                    \set Staff.shortInstrumentName = "Ob."
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

