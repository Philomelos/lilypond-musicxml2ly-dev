\version "2.17.97"
% automatically converted by musicxml2ly from accent.xml

\header {
    encodingsoftware = "Finale 2014 for Mac"
    encodingdate = "2014-03-01"
    copyright = Partitur
    title = Accent
    }

#(set-global-staff-size 20.5767485433)
\paper {
    paper-width = 20.99\cm
    paper-height = 29.71\cm
    top-margin = 1.27\cm
    bottom-margin = 1.27\cm
    left-margin = 2.53\cm
    right-margin = 1.27\cm
    between-system-space = 2.13\cm
    page-top-space = 1.21\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 ^> | % 2
    c,1 _> | % 3
    d1 _> \bar "|."
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
    %  \midi {\tempo 4 = 120 }
    }

