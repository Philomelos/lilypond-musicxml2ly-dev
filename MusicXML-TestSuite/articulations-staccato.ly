
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-staccato.xml

\header {
    texidoc = "Artikulationszeichen staccato"
    title = "Articulations staccato"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''1 -. }

PartPOneVoiceOneLyricsOne =  \lyricmode { staccato }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

