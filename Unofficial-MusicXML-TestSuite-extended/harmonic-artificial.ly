
\version "2.15.27"
% automatically converted by musicxml2ly from artificial.xml

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
    c''1 \flageolet }

PartPOneVoiceOneLyricsOne =  \lyricmode { "artificial harmonics" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

