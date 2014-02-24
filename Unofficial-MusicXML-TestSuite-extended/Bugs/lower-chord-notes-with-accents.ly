\version "2.17.15"
% automatically converted by musicxml2ly from lower-chord-notes-with-accents.xml

\header {
    miscellaneous = "lower chord notes with accents cause segmentation faults.
"
    title = "lower chord notes with accents"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative e' {
    \clef "treble" \key c \major \time 4/4 <e c'>16 _> }


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

