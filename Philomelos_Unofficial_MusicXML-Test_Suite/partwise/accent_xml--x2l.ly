\version "2.17.97"
% automatically converted by musicxml2ly from accent.xml

\header {
    miscellaneous = "The accent element indicates a regular horizontal accent mark."
    title = Accent
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

