
\version "2.15.24"
% automatically converted by musicxml2ly from single-words-with-punctuation-marks-in-score-header.xml

\header {
    texidoc = "Compilation with LilyPond v2.15.14 fails when an element of the score header of a converted MusicXML-file contained a single word directly followed by a punctuation mark (I tested it with '.', '!', ','. There is no problem with question marks.). Solution: musicxml2ly should automatically enclose all titles and headers in quotation marks. (Currently only the ones containing white spaces and/or question marks are enclosed in quotation marks.)"
    title = "Period:"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  \relative c'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

