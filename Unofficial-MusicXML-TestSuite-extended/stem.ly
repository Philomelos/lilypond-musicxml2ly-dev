
\version "2.15.41"
% automatically converted by musicxml2ly from stem.xml

\header {
    miscellaneous = "stem values up, down, double and none."
    title = "stem values"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  {
    \clef "treble" \key c \major \stemDown c'4 \stemUp c''4 b'4
    \stemNeutral b'4 }

PartPOneVoiceNoneLyricsOne =  \lyricmode { down up double none }

% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
                        \new Lyrics \lyricsto "PartPOneVoiceNone" \PartPOneVoiceNoneLyricsOne
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

