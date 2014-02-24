
\version "2.15.24"
% automatically converted by musicxml2ly from c1.xml

\header {
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \set Staff.instrumentName = "Music"
                    \context Staff << 
                        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    \midi {}
    }

