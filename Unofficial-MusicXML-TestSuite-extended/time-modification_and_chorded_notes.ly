
\version "2.17.3"
% automatically converted by musicxml2ly from time-modification_and_chorded_notes.xml

\header {
    texidoc = "
                Sibelius 7.0.0 exports wrong duration values
                for chorded notes in tuplets.  The exported value in this example is 256 instead of 170. 
                170 is not an optimal value for a quarter note in a triplet of eighths as there 
                is a rounding difference (256*2/3=170.6666...).  The same holds for an eighth note in a 
                triplet of eighths (128*2/3=85.3333... instead of 86 used here).   musicxml2ly does not
                like rounding errors.  The resulting LilyPond-Code contains wild scaling durations
                and a superfluous spacer rest:
                \times 2/3 { <c'' a'>4*255/256 s512*43 r8*129/128 } r4 r2 }.
                Sometimes music applications export suboptimal/false values for divisions and durations.
                A solution: musicxml2ly should recalculate all durations on the basis of a divisions value of 6720.
                This figure is divisible without remainder by e.g. 2, 3, 4, 5, 6, 7, 8, 16, 32, 64 and 
                therefore can provide for note durations up to 256th.  A quarter note (6720) in a triplet of eighths
                would have a value of 4480 (6720*2/3); An eighth note (6720/2=3360) in a triplet of eighths would have 
                a value of 2240 (3360*2/3).  (half note: 6720*2 = 13440.)
            "
title = "wrong durations in chorded notes with time-modifications"
}

\layout {
\context { \Score
    autoBeaming = ##f
    }
}
PartPOneVoiceOne =  {
\clef "treble" \key c \major \numericTimeSignature\time 4/4 \times 2/3 {
    <c'' a'>4*255/256 s512*43 r8*129/128 }
r4 r2 }


% The score definition
\score {
<<
    \new Staff <<
        \context Staff << 
            \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
            >>
        >>
    
    >>
\layout {}
% To create MIDI output, uncomment the following line:
%  \midi {}
}

