\version "2.17.29"
% automatically converted by musicxml2ly from 13c-KeySignatures-NonTraditional.xml

\header {
    miscellaneous = "Non-traditional key signatures,
          where each alteration is separately given. Here we have (f sharp, 
          a flat, b flat) and (c flatflat, g sharp sharp, d flat, b sharp, f 
          natural), where in the second case an explicit octave is given for 
          each alteration."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \clef "treble" \set Staff.keySignature = #`(( 3 . ,SHARP ) ( 5 .
    ,FLAT ) ( 6 . ,FLAT )) \time 2/4 c2 | % 2
    \set Staff.keySignature = #`((( -2 . 0 ) . ,DOUBLE-FLAT ) (( -1 . 4 ) . ,DOUBLE-SHARP ) (( 0 . 1 ) . ,FLAT ) (( 1 . 6 ) . ,SHARP ) (( 2 . 3 ) . ,NATURAL ))
    c2 \bar "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

