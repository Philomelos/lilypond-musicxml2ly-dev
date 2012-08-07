
\version "2.15.23"
% automatically converted by musicxml2ly from placement-musical-directions.xml

\header {
    texidoc = "Platzierung der Inhalte der Elemente words, dynamics, wedge, segno, coda, rehearsal, dashes, pedal, metronome und octave-shift. "
    title = "placement of musical directions"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 | % 1
    c''1 ^\markup{ \italic {Bli} } | % 2
    c''1 _\markup{ \italic {Bla} } | % 3
    c''1^\p | % 4
    c''1 \f | % 5
    c''2^\< c''2 \! | % 6
    c''2 \< c''2 \! | % 7
    \mark \markup { \box { A } } | % 7
    c''1 | % 8
    \mark \markup { \box { B } } | % 8
    c''1 | % 9
    \mark \markup { A } | % 9
    c''1 | \barNumberCheck #10
    \mark \markup { B } | \barNumberCheck #10
    c''1 | % 11
    \mark \markup { \musicglyph #"scripts.segno" } | % 11
    c''1 | % 12
    \mark \markup { \musicglyph #"scripts.segno" } | % 12
    c''1 | % 13
    \mark \markup { \musicglyph #"scripts.coda" } | % 13
    c''1 | % 14
    \mark \markup { \musicglyph #"scripts.coda" } | % 14
    c''1 | % 15
    \textSpannerUp
    c''2^\startTextSpan c''2 \stopTextSpan | % 16
    \textSpannerDown
    c''2_\startTextSpan c''2_\stopTextSpan | % 17
    \textSpannerNeutral
    \[ c''2 c''2 \] | % 18
    \override LigatureBracket #' direction = #DOWN
    \[ c''2 c''2 \] | % 19
    \ottava #-1 | % 19
    c''2 \ottava #0 c''2 | \barNumberCheck #20
    \ottava #-1 | \barNumberCheck #20
    c''2 c''2 \ottava #0 | % 21
    \ottava #1 | % 21
    c''2 \ottava #0 c''2 | % 22
    \ottava #1 | % 22
    c''2 c''2 \ottava #0 | % 23
    c''4 \sustainOn c''4 \sustainOff\sustainOn c''4 c''4 \sustainOff | % 24
    c''4 \sustainOn c''4 \sustainOff\sustainOn c''4 c''4 \sustainOff | % 25
    \tempo 4=60 | % 25
    c''1 | % 26
    \tempo 4=60 | % 26
    c''1 }

PartPOneVoiceOneLyricsOne =  \lyricmode { "(above)" "(below)" "(above)"
    "(below)" "(above)" \skip4 "(below)" \skip4 "(above)" "(below)"
    "(above)" "(below)" "(above)" "(below)" "(above)" "(below)"
    "(above)" \skip4 "(below)" \skip4 "(above)" \skip4 "(below)" \skip4
    "(above)" \skip4 "(below)" \skip4 "(above)" \skip4 "(below)" \skip4
    above \skip4 \skip4 \skip4 below \skip4 \skip4 \skip4 "(above)"
    "(below)" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

