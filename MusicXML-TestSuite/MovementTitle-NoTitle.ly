
\version "2.15.13"
% automatically converted from MovementTitle-NoTitle.xml

\header {
    texidoc = "A piece with a movement-title but no work-title. In this case
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
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

