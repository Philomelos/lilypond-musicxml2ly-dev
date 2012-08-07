
\version "2.15.24"
% automatically converted by musicxml2ly from voice-staff-part-bug.xml

\header {
    texidoc = "If one part contains more than one staff and the same voice value is used in more than one staff compilation fails with a python error."
    title = "voice staff part bug"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 <c' c>1
    \change Staff="2" }


% The score definition
\score {
    <<
 <<
            <<
 \new PianoStaff <<
                    \context Staff = "1" << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        >> \context Staff = "2" <<
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

