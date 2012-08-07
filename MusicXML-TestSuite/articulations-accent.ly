
\version "2.15.23"
% automatically converted by musicxml2ly from articulations-accent.xml

\header {
    texidoc = "Das Markup fan=\"accel\" scheint sich nicht auszuwirken, wird eventuell von LilyPond 2.15.23 noch nicht unterstützt oder aber das Minimalbeispiel ist so nicht richtig."
    title = "Feathered Beams"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    c1 -> }

PartPOneVoiceOneLyricsOne =  \lyricmode { accent }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

