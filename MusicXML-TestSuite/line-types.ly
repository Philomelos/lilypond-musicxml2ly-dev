
\version "2.15.18"
% automatically converted by musicxml2ly from line-types.xml

\header {
    texidoc = "demonstration of different kind of line-types in different? elements"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative f' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 f1 ( | % 2
    f1 ) | % 3
    \slurDashed f1 ( \slurSolid | % 4
    f1 ) | % 5
    \slurDotted f1 ( \slurSolid | % 6
    f1 ) | % 7
    f1 ( | % 8
    f1 ) }

PartPOneVoiceOneLyricsOne =  \lyricmode { solid dashed dotted wavy }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

