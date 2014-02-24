
\version "2.15.14"
% automatically converted by musicxml2ly from ornaments.xml

\header {
    texidoc = Verzierungen
    title = ornaments
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    c4 \trill c4 \turn c4 c4 \reverseturn | % 2
    c4 c4 \startTrillSpan c4 \stopTrillSpan \startTrillSpan c4
    \stopTrillSpan | % 3
    c4 \mordent c4 \prall c4 c4 :32 | % 4
    c4 \turn -\markup { \natural } c4 \turn ^\markup { \sharp } ^\markup
    { \sesquiflat } r2 \bar "||"
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { tr. turn del.turn inv.turn
    shake wavy -- wavy -- line mord. inv.mord. schl. trem. "turn+acc."
    "turn+acc.(ab.+bel./rel to turn)" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

