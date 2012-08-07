
\version "2.15.20"
% automatically converted by musicxml2ly from 31c-MetronomeMarks.xml

\header {
    texidoc = "Tempo Markings: note=bpm, 
          text (note=bpm), note=note, (note=note), (note=bpm)"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 | % 1
    \tempo 4.=100 c4 c4 \tempo \longa=100 c4 -"Adagio" c4 | % 2
    \mark\markup { \fontsize #-2 \line {  \general-align #Y #DOWN \smaller \note #"4." #UP = \general-align #Y #DOWN \smaller \note #"2." #UP  } }
    | % 2
    c4 c4 \mark\markup { \fontsize #-2 \line { \general-align #Y #DOWN
            \smaller \note #"longa" #UP = \general-align #Y #DOWN
            \smaller \note #"32." #UP } } c4 c4 | % 3
    \mark\markup { \fontsize #-2 \line { "(" \general-align #Y #DOWN \smaller \note #"4." #UP = \general-align #Y #DOWN \smaller \note #"2." #UP ")" } }
    | % 3
    c4 c4 \tempo "" 4.=77 c4 c4 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

