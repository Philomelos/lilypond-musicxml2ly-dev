
\version "2.18.0"
% automatically converted by musicxml2ly from breath-marks_and_manual_beams.xml

\header {
    texidoc = "A breath mark is not an expressive
                mark but a music event of its own.  No expressive marks attached to
                the preceding note may be placed after it, including closing 
                square brackets, slurs, etc.  Breath marks within square brackets cause 
                fatal errors during compilation if breathe is not followed by at least 
                one note. Temporary workaround: use musicxml2ly 
                command line option --nb or --no-beaming."
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \clef "treble" \key c \major \time 4/4 c8 [ e8 \breathe \p ] c8 [ }


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

