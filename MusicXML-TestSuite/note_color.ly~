
\version "2.15.24"
% automatically converted by musicxml2ly from note_color.xml

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 g'4 a'8 [ b'8 ] r2 | % 2
    c''4 d''4 e''4 ^. \once \override NoteHead #'style = #'cross f''4
    \bar "|."
    }


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
    %  \midi {\tempo 4 = 100}
    }

