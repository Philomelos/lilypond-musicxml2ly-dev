
\version "2.15.14"
% automatically converted by musicxml2ly from editorial-accidental.xml

\header {
    texidoc = "Editorische Versetzungszeichen sollen darauf hinweisen, dass der Komponist möglicherweise einen anderen Ton gemeint haben könnte. Die Versetzungszeichen stehen mit oder ohne Fragezeichen über der entsprechenden Note."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key g \major \time 4/4 gis'4 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

