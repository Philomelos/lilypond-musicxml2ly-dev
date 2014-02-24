
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-staccatissimo.xml

\header {
    texidoc = "Artikulationszeichen staccatissimo"
    title = "Articulations staccatissimo"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 -| }

PartPOneVoiceOneLyricsOne =  \lyricmode { staccatissimo }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

