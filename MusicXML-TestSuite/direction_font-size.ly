
\version "2.15.24"
% automatically converted by musicxml2ly from direction_font-size.xml

\header {
    texidoc = "Changes in font sizes in text directions don't show any effect."
    title = "font-sizes in directions"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major | % 1
    c''1 ^"D.S. al Coda" }


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

