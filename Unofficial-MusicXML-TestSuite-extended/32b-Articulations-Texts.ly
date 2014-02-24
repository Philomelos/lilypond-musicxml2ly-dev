
\version "2.15.24"
% automatically converted by musicxml2ly from 32b-Articulations-Texts.xml

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 | % 1
    f'8*8 ^" Normal, Medium " | % 2
    g'1 _\markup{ \bold { Bold, Medium } } ^\markup{ \large { Normal,
            Large } } | % 3
    f'1 _\markup{ \bold\large { Bold, Large } } ^\markup{ \small {
            Normal, Small } } _\markup{ \bold\small {Bold, Small} }
    _\markup{ \small\with-color #(rgb-color 1.0 0.5 0.0) {Normal, Small,
            Colored, Below} } }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100}
    }

