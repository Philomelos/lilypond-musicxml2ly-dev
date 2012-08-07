
\version "2.15.37"
% automatically converted by musicxml2ly from scale.xml

\header {
    encodingsoftware = TuxGuitar
    title = "
major scale
"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \key c \major \numericTimeSignature\time 4/4 | % 1
    c4 \5 d4 \5 e4 \4 f4 \4 | % 2
    g4 \4 a4 \3 b4 \3 c4 \3 }


% The score definition
\score {
    <<

        <<
 \new Staff
            \context Staff << 
                \context Voice = "PartPOneVoiceOne" {\transpose c g  \PartPOneVoiceOne }
                >>
            >>
        >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100}
    }

