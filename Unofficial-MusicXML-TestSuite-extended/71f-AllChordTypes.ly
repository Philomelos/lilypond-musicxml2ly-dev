
\version "2.15.24"
% automatically converted by musicxml2ly from 71f-AllChordTypes.xml

\header {
    texidoc = "All chord types defined in 
          MusicXML. The staff will only contain one c' note (NO chord) for 
          all of them, but the chord names should be properly 
          printed."
    title = "All MusicXML chord names/types with <root>"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    c'4 c'4 c'4 c'4 | % 2
    c'4 c'4 c'4 c'4 | % 3
    c'4 c'4 c'4 c'4 | % 4
    c'4 c'4 c'4 c'4 | % 5
    c'4 c'4 c'4 c'4 | % 6
    c'4 c'4 c'4 c'4 | % 7
    c'4 c'4 c'4 c'4 | % 8
    c'4 c'4 c'4 c'4 | % 9
    c'2 c'8 c'8 r4 | \barNumberCheck #10
    c'4 c'4 \bar "|."
    }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    c4:5 c4:m5 c4:aug5 c4:dim5 | % 2
    c4:7 c4:maj7 c4:m7 c4:dim7 | % 3
    c4:aug7 c4:dim5m7 c4:maj7m5 c4:6 | % 4
    c4:m6 c4:9 c4:maj9 c4:m9 | % 5
    c4:11 c4:maj11 c4:m11 c4:13.11 | % 6
    c4:maj13.11 c4:m13 c4:sus2 c4:sus4 | % 7
    s4 s4 s4 s4 | % 8
    s4 c4:5^3 s4 c4:1 | % 9
    fis2:5 feses8:5/+c gis8:5/+dis c4:5 | \barNumberCheck #10
    c4:5.5-^3 c4:5.6-^1 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { major minor augmented
    diminished dominant "major-seventh" "minor-seventh"
    "diminished-seventh" "augmented-seventh" "half-diminished"
    "major-minor" "major-sixth" "minor-sixth" "dominant-ninth"
    "major-ninth" "minor-ninth" "dominant-11th" "major-11th"
    "minor-11th" "dominant-13th" "major-13th" "minor-13th"
    "suspended-second" "suspended-fourth" Neapolitan Italians French
    German pedal power Tristan other Inversion "Fbb/C" "G#/D#" "C-3+5b"
    "C-1+6b" }

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

