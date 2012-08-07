
\version "2.15.14"
% automatically converted by musicxml2ly from accent.xml

\header {
    texidoc = Akzent
    title = accent
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 c''1 -> }

PartPOneVoiceOneLyricsOne =  \lyricmode { accent }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

