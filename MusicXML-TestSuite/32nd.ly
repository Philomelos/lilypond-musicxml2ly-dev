
\version "2.15.14"
% automatically converted by musicxml2ly from 32nd.xml

\header {
    texidoc = Zweiunddreißigstelnote
    title = "32nd"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c'' {
    c32 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

