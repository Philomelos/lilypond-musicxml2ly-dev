
\version "2.15.24"
% automatically converted by musicxml2ly from direction-sound_tempo.xml

\header {
    texidoc = "All different modes: major, 
        minor, ionian, dorian, phrygian, lydian, mixolydian, aeolian, and 
        locrian; All modes are given with 2 sharps."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    c''4 _"" c''4 c''4 c''4 }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
