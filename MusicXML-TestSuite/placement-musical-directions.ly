
\version "2.15.24"
% automatically converted by musicxml2ly from placement-musical-directions.xml

\header {
    texidoc = "Platzierung der Inhalte der Elemente words, dynamics, wedge, segno, coda, rehearsal, dashes, pedal, metronome und octave-shift. "
    title = "placement of musical directions"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 | % 1
    c1 ^\markup{ \italic {Bli} } | % 2
    c1 _\markup{ \italic {Bla} } | % 3
    c1 ^\p | % 4
    c1 _\f | % 5
    c2 ^\< c2 -\! | % 6
    c2 _\< c2 -\! | % 7
    \mark \markup { \box { A } } | % 7
    c1 | % 8
    \mark \markup { \box { B } } | % 8
    c1 | % 9
    \mark \markup { A } | % 9
    c1 | \barNumberCheck #10
    \mark \markup { B } | \barNumberCheck #10
    c1 | % 11
    \mark \markup { \musicglyph #"scripts.segno" } | % 11
    c1 | % 12
    \mark \markup { \musicglyph #"scripts.segno" } | % 12
    c1 | % 13
    \mark \markup { \musicglyph #"scripts.coda" } | % 13
    c1 | % 14
    \mark \markup { \musicglyph #"scripts.coda" } | % 14
    c1 | % 15
    \textSpannerUp c2 \startTextSpan c2 \stopTextSpan | % 16
    \textSpannerDown c2 \startTextSpan c2 \stopTextSpan | % 17
    \once \override LigatureBracket #' direction = #UP \[ c2 c2 \] | % 18
    \once \override LigatureBracket #' direction = #DOWN \[ c2 c2 \] | % 19
    \ottava #-1 | % 19
    c2 \ottava #0 c2 | \barNumberCheck #20
    \ottava #-1 | \barNumberCheck #20
    c2 c2 \ottava #0 | % 21
    \ottava #1 | % 21
    c2 \ottava #0 c2 | % 22
    \ottava #1 | % 22
    c2 c2 \ottava #0 | % 23
    c4 \sustainOn c4 \sustainOff\sustainOn c4 c4 \sustainOff | % 24
    c4 \sustainOn c4 \sustainOff\sustainOn c4 c4 \sustainOff | % 25
    \tempo 4=60 | % 25
    c1 | % 26
    \tempo 4=60 | % 26
    c1 }

PartPOneVoiceOneLyricsOne =  \lyricmode { "(above)" "(below)" "(above)"
    "(below)" "(above)" \skip4 "(below)" \skip4 "(above)" "(below)"
    "(above)" "(below)" "(above)" "(below)" "(above)" "(below)"
    "(above)" \skip4 "(below)" \skip4 "(above)" \skip4 "(below)" \skip4
    "(above)" \skip4 "(below)" \skip4 "(above)" \skip4 "(below)" \skip4
    above \skip4 \skip4 \skip4 below \skip4 \skip4 \skip4 "(above)"
    "(below)" }

% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                        % \new Lyrics \lyricsto "PartPOneVoiceOne"
                        \PartPOneVoiceOneLyricsOne
                        >>
                    >>
                >>
            
            >>
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

