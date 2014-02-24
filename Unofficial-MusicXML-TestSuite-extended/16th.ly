
\version "2.15.14"
% automatically converted by musicxml2ly from 16th.xml

\header {
    texidoc = Sechzehntelnote
    title = "16th"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  {
    c''16 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

