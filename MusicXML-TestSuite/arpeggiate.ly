
\version "2.15.27"
% automatically converted by musicxml2ly from arpeggiate.xml

\header {
    texidoc = "Arpeggierte Noten"
    title = arpeggiate
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major <c'' e'' g''>4 \arpeggio \arpeggio
    \arpeggio }

PartPOneVoiceOneLyricsOne =  \lyricmode { arp. }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

