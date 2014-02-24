
\version "2.15.37"
% automatically converted by musicxml2ly from sound.xml

\header {
    miscellaneous = "tempo of midi output."
    title = "sound tempo"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    c'4 c'4 c'4 c'4 }


% The score definition
\score {
    <<

        <<
 \new Staff
            \context Staff << 
                \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                >>
            >>
        >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = }
    }

