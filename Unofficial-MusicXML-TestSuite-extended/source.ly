
\version "2.15.13"
% automatically converted from source.xml

\header {
    source = "John Doe Publishing Office, 2011"
    texidoc = "The source-element usually contains publishing information. These contents should be saved in a custom variable named \"source\" in the header of the .ly file."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
  r1 c1(~c1 d1) }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

