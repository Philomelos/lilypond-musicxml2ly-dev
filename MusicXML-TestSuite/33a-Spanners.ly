
\version "2.15.38"
% automatically converted by musicxml2ly from 33a-Spanners.xml

\header {
    texidoc = "Several spanners defined in
           MusicXML: tuplet, slur (solid, dashed), tie,  wedge (cresc, dim),
           tr + wavy-line, single-note trill spanner, octave-shift (8va,15mb),
           bracket (solid down/down, dashed down/down, solid none/down,
           dashed none/up, solid none/none), dashes, glissando (wavy),
           bend-alter, slide (solid), grouping, two-note tremolo, hammer-on,
           pull-off, pedal (down, change, up)."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 3/4 \times 2/3 {
        b'4 b'4 b'4 }
    r4 | % 2
    b'4 ( b'4 b'4 ) | % 3
    \slurDashed b'4 ( \slurSolid b'4 b'4 ) | % 4
    b'4 \< b'4 b'4 \! | % 5
    b'4 \> b'4 b'4 \! | % 6
    b'4 \startTrillSpan b'4 b'4 \stopTrillSpan | % 7
    b'4 \startTrillSpan r2 \stopTrillSpan | % 8
    \ottava #1 | % 8
    b''4 b''4 b''4 \ottava #0 | % 9
    \ottava #-2 | % 9
    b,4 b,4 b,4 \ottava #0 | \barNumberCheck #10
    \[ b'4 b'4 b'4 \] | % 11
    \[ b'4 b'4 b'4 \] | % 12
    \[ b'4 b'4 b'4 \] | % 13
    \[ b'4 b'4 b'4 \] | % 14
    \[ b'4 b'4 b'4 \] | % 15
    b'4 \startTextSpan b'4 b'4 \stopTextSpan | % 16
    \once \override Glissando #'style = #'zigzag b'4 \glissando f''4 r4
    | % 17
    b'4 -\bendAfter #6 c''4 -\bendAfter #0 r4 | % 18
    b'4 \glissando c'4 r4 | % 19
    b'4 b'4 b'4 | \barNumberCheck #20
    b'4 :16 b'4 :16 r4 | % 21
    b'4 b'4 r4 | % 22
    b'4 b'4 r4 | % 23
    b'4 \sustainOn b'4 \sustainOff\sustainOn b'4 \sustainOff \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

