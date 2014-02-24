
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-breath-mark.xml

\header {
    texidoc = "Artikulationszeichen Atemzeichen"
    title = "Articulations breath-mark"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 \breathe }

PartPOneVoiceOneLyricsOne =  \lyricmode { "breath-mark" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

