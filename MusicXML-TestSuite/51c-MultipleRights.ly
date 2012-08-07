
\version "2.15.29"
% automatically converted by musicxml2ly from 51c-MultipleRights.xml

\header {
    texidoc = "There can be multiple 
        <rights> tags in the identification element of the score. The 
        conversion shall still work, ideally using both of 
        them."
    copyright = "Copyright © XXXX by Y. ZZZZ.
Released To The Public Domain."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    r1 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

