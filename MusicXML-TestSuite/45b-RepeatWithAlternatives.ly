
\version "2.15.24"
% automatically converted by musicxml2ly from 45b-RepeatWithAlternatives.xml

\header {
    texidoc = "A simple repeat with two 
          alternative endings (volta brackets)."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \repeat volta 2 {
        \clef "treble" \key c \major \time 4/4 c''1 }
    \alternative { {
            | % 2
            c''1 }
        {
            | % 3
            c''1 }
        } }


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
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

