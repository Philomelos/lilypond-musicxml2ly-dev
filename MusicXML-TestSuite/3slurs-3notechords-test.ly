
\version "2.15.24"
% automatically converted by musicxml2ly from 3slurs-3notechords-test.xml

\header {
    encodingsoftware = "Finale NotePad 2012 for Mac"
    encodingdate = "2012-05-22"
    composer = pls
    copyright = "©"
    title = "slurs-chords"
    }

#(set-global-staff-size 20.5767485433)
\paper {
    paper-width = 20.99\cm
    paper-height = 29.71\cm
    top-margin = 1.27\cm
    bottom-margin = 1.27\cm
    left-margin = 1.9\cm
    right-margin = 1.27\cm
    between-system-space = 2.19\cm
    page-top-space = 1.27\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \transposition c \clef "treble" \key c \major
    \numericTimeSignature\time 4/4 <c' g' c''>2 ( <d' a' d''>2 ) \bar
    "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \set Staff.instrumentName = "Guitar"
                    \set Staff.shortInstrumentName = "Gtr."
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

