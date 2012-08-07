
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-strong-accent.xml

\header {
    texidoc = "Artikulationszeichen strong accent"
    title = "Articulations strong accent"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 -^ }

PartPOneVoiceOneLyricsOne =  \lyricmode { "strong accent" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

