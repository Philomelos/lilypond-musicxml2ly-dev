
\version "2.15.37"
% automatically converted by musicxml2ly from first-fret.xml

\header {
    texidoc = "If the fret definition within the frame-note element is faulty than the first-fret symbol does not show up."
    title = "first-fret symbol"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    <e'' b' g' c'>1 ^\markup { \fret-diagram #"5-3;4-5;3-4;2-5;" } \bar
    "|."
    }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    c1:maj7 \bar "|."
    }


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

