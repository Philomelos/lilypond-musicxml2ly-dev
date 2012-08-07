
\version "2.15.24"
% automatically converted by musicxml2ly from trill-mark-wavy-line-bug.xml

\header {
    title = "trill mark - wavy line bug"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major c1 \startTrillSpan | % 2
    c1 \stopTrillSpan }

PartPOneVoiceOneLyricsOne =  \lyricmode { "trill-mark & wavy-line"
    \skip4 }

% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

