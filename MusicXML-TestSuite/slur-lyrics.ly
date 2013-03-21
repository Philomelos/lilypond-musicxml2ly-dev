\version "2.17.6"
% automatically converted by musicxml2ly from slur-lyrics.xml

\header {
    miscellaneous = "middle syllables aligned to slurred notes are swallowed by musicxml2ly."
    title = "musicxml2ly swallows syllables"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 c2 ( b2 ) | % 2
    c1 }

PartPOneVoiceOneLyricsOne =  \lyricmode { \set ignoreMelismata = ##t Syl
    la -- \unset ignoreMelismata ble }

% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

