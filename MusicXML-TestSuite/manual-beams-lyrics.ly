
\version "2.15.14"
% automatically converted by musicxml2ly from manual-beams-lyrics.xml

\header {
    texidoc = "Bei manuell gesetzten Balken verschwinden im Liedtext Silben."
    title = "manual beams and lyrics"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 c'8. [ c'16 ] c'2. }

PartPOneVoiceOneLyricsOne =  \lyricmode { Syl -- ble }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

