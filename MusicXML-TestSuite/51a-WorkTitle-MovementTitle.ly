
\version "2.14.2"
% automatically converted with musicxml2ly from 51a-WorkTitle-MovementTitle.xml

\header {
    subtitle = Bla
    miscellaneous = "A piece with a work-title and a movement-title. The work-title should be typeset as a title, the movement-title as a subtitle."
    title = Bli
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    r1 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

