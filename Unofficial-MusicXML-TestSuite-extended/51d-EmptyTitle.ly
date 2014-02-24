
\version "2.15.13"
% automatically converted with musicxml2ly from 51d-EmptyTitle.xml

\header {
    texidoc = "A piece with an empty (but
            existing) work-title, but a non-empty movement-title. In this case
            the movement-title should be chosen, even though the work-title
            exists."
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

