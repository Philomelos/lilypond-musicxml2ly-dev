
\version "2.15.24"
% automatically converted by musicxml2ly from harmony-kind_major.xml

\header {
    texidoc = "harmony kind: major "
    title = "chord type major"
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
    c1:5 }

PartPOneVoiceOneLyricsOne =  \lyricmode { major }

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

