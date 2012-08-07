
\version "2.15.14"
% automatically converted by musicxml2ly from ornaments-turn.xml

\header {
    texidoc = Doppelschlag
    title = turn
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 \turn }

PartPOneVoiceOneLyricsOne =  \lyricmode { turn }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

