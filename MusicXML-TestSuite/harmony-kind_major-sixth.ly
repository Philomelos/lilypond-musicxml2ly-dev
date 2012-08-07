
\version "2.15.24"
% automatically converted by musicxml2ly from harmony-kind_major-sixth.xml

\header {
    title = "harmony kind: major-sixth"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 | % 1
    c1 }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    c1:6 }

PartPOneVoiceOneLyricsOne =  \lyricmode { "major-sixth" }

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

