
\version "2.15.38"
% automatically converted by musicxml2ly from wedges-chords.xml

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
    \clef "treble" \key c \major \time 2/4 | % 1
    <e'' g' e'>8 \> ( d''4 \! ) }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

