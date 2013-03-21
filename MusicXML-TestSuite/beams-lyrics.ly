\version "2.17.6"
% automatically converted by musicxml2ly from beams-lyrics.xml

\header {
    miscellaneous = "Under some circumstances syllables aligned to notes 
      with manual beams are swallowed by musicxml2ly."
    title = "beams and lyrics"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c' {
    \clef "treble" \key c \major \time 4/4 \stemDown c8. [ c16 ] c2. }

PartPOneVoiceOneLyricsOne =  \lyricmode { Syl-_la- -- ble }

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

