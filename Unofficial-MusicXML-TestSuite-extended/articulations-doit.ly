
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-doit.xml

\header {
    texidoc = "Artikulationszeichen Glissando nach oben"
    title = "Articulations doit"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 -\bendAfter #4 }

PartPOneVoiceOneLyricsOne =  \lyricmode { doit }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

