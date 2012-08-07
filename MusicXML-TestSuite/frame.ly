
\version "2.15.24"
% automatically converted by musicxml2ly from frame.xml

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    a'1 ^\markup { \fret-diagram #"6-o;5-3;4-2;3-o;2-1;1-o;" } }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    c1:5 }


% The score definition
\score {
    <<
 <<
            <<
 \context ChordNames = "PartPOneVoiceOneChords"
                \PartPOneVoiceOneChords
                \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100}
    }

