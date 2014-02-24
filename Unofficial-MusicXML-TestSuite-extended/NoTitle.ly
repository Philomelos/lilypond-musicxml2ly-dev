
\version "2.15.37"
% automatically converted by musicxml2ly from NoTitle.xml

\header {
    opus = "K. 524"
    subtitle = bla
    miscellaneous = "<work> element without <work-title> AND no <movement-title> causes Python error"
    movementnumber = VZ
    title = bli
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c'1 }


% The score definition
\score {
    <<

        <<
 \new Staff
            \set Staff.instrumentName = "Music"
            \context Staff << 
                \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
                >>
            >>
        >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100}
    }

