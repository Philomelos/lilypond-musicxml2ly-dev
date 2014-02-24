
\version "2.15.29"
% automatically converted by musicxml2ly from multi-lined-headers.xml

\header {
    poet = "German: Friedrich Heinrich Ranke (1798–1876)
Latin: John Francis Wade (1711–1786)"
    poet = \markup { 
      \column { 
        \line {"German: Friedrich Heinrich Ranke (1798–1876)"} 
        \line {"Latin: John Francis Wade (1711–1786)"} 
      } 
    }
    texidoc = "header elements containing several lines of text including line breaks are converted as single lines of text without line breaks leading to text collisions."
    composer = "John Francis Wade (1711–1786)"
    title = "multi-lined headers collide"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

