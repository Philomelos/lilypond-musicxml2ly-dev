
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-falloff.xml

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
    \clef "treble" \key c \major c''1 -\bendAfter #-4 }

PartPOneVoiceOneLyricsOne =  \lyricmode { falloff }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

