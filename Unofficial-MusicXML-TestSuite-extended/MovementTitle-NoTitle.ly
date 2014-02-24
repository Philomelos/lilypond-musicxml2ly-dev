\version "2.17.29"
% automatically converted by musicxml2ly from MovementTitle-NoTitle.xml

\header {
    subtitle = bla
    miscellaneous = "A piece with a movement-title but no work-title. In this case
            the movement-title should become the title."
    title = bla
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    r1 }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

