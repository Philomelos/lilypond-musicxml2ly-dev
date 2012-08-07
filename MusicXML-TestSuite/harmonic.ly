
\version "2.15.27"
% automatically converted by musicxml2ly from harmonic.xml

\header {
    texidoc = "Künstliche Flageoletts"
    title = "Artificial Harmonics"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    c''1 \flageolet | % 2
    c''1 \flageolet | % 3
    c''1 \flageolet | % 4
    c''1 \flageolet | % 5
    c''1 \flageolet | % 6
    c''1 \flageolet | % 7
    c''1 \flageolet }

PartPOneVoiceOneLyricsOne =  \lyricmode { harmonic "natural harmonic"
    "artificial harmonic" "natural base-pitch harmonic" "natural
    touching-pitch harmonic" "natural sounding-pitch harmonic"
    "artificial sounding-pitch harmonic" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

