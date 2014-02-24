
\version "2.14.2"
% automatically converted from 12a-Clefs.xml

\header {
    texidoc = "Various clefs: G, C, F, percussion, 
          TAB and none; some are also possible with octavation and  on other 
          staff lines than their default (e.g. soprano/alto/tenor/bariton C 
          clefs); Each measure shows a different clef (measure 17 has the \"none\" 
          clef), only measure 18 has the same treble clef as measure 
          1."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \clef "treble" \key c \major \time 4/4 c1 | % 2
    \clef "alto" c1 | % 3
    \clef "tenor" c1 | % 4
    \clef "bass" c1 | % 5
    \clef "percussion" c1 | % 6
    \clef "treble_8" c1 | % 7
    \clef "bass_8" c1 | % 8
    \clef "varbaritone" c1 | % 9
    \clef "french" c1 | \barNumberCheck #10
    \clef "baritone" c1 | % 11
    \clef "mezzosoprano" c1 | % 12
    \clef "soprano" c1 | % 13
    \clef "percussion" c1 | % 14
    \clef "treble^8" c1 | % 15
    \clef "bass^8" c1 | % 16
    \clef "tab" c1 | % 17
    \clef "None" c1 | % 18
    \clef "treble" c1 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

