
\version "2.15.14"
% automatically converted by musicxml2ly from trill-mark.xml

\header {
    texidoc = Triller
    title = "trill-mark"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 \trill | % 2
    \clef "treble" \key c \major c1 ^\trill | % 3
    \clef "treble" \key c \major c1 _\trill }

PartPOneVoiceOneLyricsOne =  \lyricmode { "trill-mark" "\"above\""
    "\"below\"" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

