
\version "2.15.37"
% automatically converted by musicxml2ly from wavy-line.xml

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \once \override TextSpanner #'style =
    #'trill c''1 \startTextSpan | % 2
    c''1 | % 3
    c''1 \stopTextSpan }

PartPOneVoiceOneLyricsOne =  \lyricmode { "wavy-line" "\"continue\""
    "\"stop\"" }

% The score definition
\score {
    <<

        <<
 \new Staff
            \context Staff << 
                \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
                >>
            >>
        >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100}
    }

