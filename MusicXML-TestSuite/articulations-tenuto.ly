
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-tenuto.xml

\header {
    texidoc = "Artikulationszeichen tenuto"
    title = "Articulations tenuto"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 -- }

PartPOneVoiceOneLyricsOne =  \lyricmode { tenuto }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

