
\version "2.15.14"
% automatically converted by musicxml2ly from extend.xml

\header {
    texidoc = "
        Fülllinie
      "
    title = "
      extender line
    "
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    e''8 [ f''8 ] e''4 d''4 c''4 }

PartPOneVoiceOneLyricsOne =  \lyricmode { "La " __ \skip4 \skip4 \skip4
    }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

