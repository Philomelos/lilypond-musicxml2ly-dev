
\version "2.15.23"
% automatically converted by musicxml2ly from accidentals.xml

\header {
    texidoc = "Akzidentien / Versetzungszeichen"
    title = accidentals
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative cis'' {
    \clef "treble" \key g \major \time 4/4 cis1 | % 2
    f1 | % 3
    ces1 | % 4
    cisis1 | % 5
    cisis1 | % 6
    ceses1 | % 7
    \key es \major ais1 | % 8
    \key a \major ges'1 | % 9
    \key c \major ceh,1 | \barNumberCheck #10
    cih1 | % 11
    ceseh1 | % 12
    cisih1 }

PartPOneVoiceOneLyricsOne =  \lyricmode { sharp natural flat
    "double-sharp" "sharp-sharp" "flat-flat" "natural-sharp"
    "natural-flat" "quarter-flat" "quarter-sharp" "three-quarters-flat"
    "three-quarters-sharp" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

