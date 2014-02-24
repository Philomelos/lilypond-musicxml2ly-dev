\version "2.17.6"
% automatically converted by musicxml2ly from credit-elements_finalenotepad2012-musicxml2-0.xml

\header {
    subtitle = Subtitle
    copyright = Copyright
    encodingdate = "2013-01-24"
    title = Title
    poet = Lyricist
    composer = Composer
    encodingsoftware = "Finale NotePad 2012 for Mac"
    }

#(set-global-staff-size 20.5767485433)
\paper {
    paper-width = 21.59\cm
    paper-height = 27.93\cm
    top-margin = 1.27\cm
    bottom-margin = 1.27\cm
    left-margin = 1.9\cm
    right-margin = 1.27\cm
    between-system-space = 2.19\cm
    page-top-space = 1.27\cm
    indent = 0.7675\cm
    short-indent = 0.614\cm
    }
\layout {
    \context { \Score
        skipBars = ##t
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 R1 \bar
    "|."
    }

PartPOneVoiceTwo =  \relative c' {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 R1 \bar
    "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new PianoStaff <<
                    \set PianoStaff.instrumentName = "Piano"
                    \set PianoStaff.shortInstrumentName = "Pno."
                    \context Staff = "1" << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        >> \context Staff = "2" <<
                        \context Voice = "PartPOneVoiceTwo" {  \PartPOneVoiceTwo }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 120 }
    }

