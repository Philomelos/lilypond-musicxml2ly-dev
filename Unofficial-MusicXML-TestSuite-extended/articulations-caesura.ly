
\version "2.15.27"
% automatically converted by musicxml2ly from articulations-caesura.xml

\header {
    texidoc = "Artikulationszeichen Zäsur"
    title = "Articulations caesura"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    c''1 ^\markup { \musicglyph #"scripts.caesura.straight" } }

PartPOneVoiceOneLyricsOne =  \lyricmode { caesura }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

