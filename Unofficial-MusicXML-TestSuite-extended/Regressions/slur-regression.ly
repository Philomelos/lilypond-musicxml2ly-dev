
\version "2.17.15"
% automatically converted by musicxml2ly from slur-regression.xml

\header {
    composer = pls
    title = "Slur regression"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative a' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 a4 ( a4
    ) ( b4 ) d4 | % 2
    \key c \major g1 \bar "|."
    }


% The score definition
\score {
    <<
        \new Staff <<
            \set Staff.instrumentName = "Oboe"
            \context Staff << 
                \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

