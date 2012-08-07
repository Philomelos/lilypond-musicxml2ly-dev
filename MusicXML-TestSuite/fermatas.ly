
\version "2.15.14"
% automatically converted by musicxml2ly from fermatas.xml

\header {
    texidoc = "Eckige Fermate."
    title = "square fermata"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 ^\fermata \fermata | % 2
    c1 \fermata \fermata | % 3
    c1 \shortfermata | % 4
    c1 \longfermata | % 5
    c1 _\fermata \fermata }

PartPOneVoiceOneLyricsOne =  \lyricmode { upright normal angled square
    inverted }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

