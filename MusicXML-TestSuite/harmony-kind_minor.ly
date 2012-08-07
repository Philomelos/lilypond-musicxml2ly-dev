
\version "2.15.24"
% automatically converted by musicxml2ly from harmony-kind_minor.xml

\header {
    title = "harmony kind: minor"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    c''1 }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    c1:m5 }

PartPOneVoiceOneLyricsOne =  \lyricmode { minor }

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
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

