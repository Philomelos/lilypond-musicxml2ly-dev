
\version "2.15.29"
% automatically converted by musicxml2ly from harmonic-base-pitch.xml

\header {
    texidoc = "Flageolett-Töne Grundton"
    title = "Harmonics base-pitch"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    c''1 \flageolet }

PartPOneVoiceOneLyricsOne =  \lyricmode { "natural base-pitch harmonic"
    }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

