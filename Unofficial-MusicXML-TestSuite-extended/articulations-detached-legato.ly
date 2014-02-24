
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-detached-legato.xml

\header {
    texidoc = "Artikulationszeichen detached-legato"
    title = "Articulations detached-legato"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 -_ }

PartPOneVoiceOneLyricsOne =  \lyricmode { "detached-legato" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

