
\version "2.15.23"
% automatically converted by musicxml2ly from accidental-marks.xml

\header {
    texidoc = "Akzidentien für Verzierungen (Doppelschläge (turns) und Triller (trills) und Textanweisungen."
    title = "accidental-marks"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 c1 ^\markup { \sharp } | % 2
    c1 ^\markup { \flat } | % 3
    c1 ^\markup { \natural } | % 4
    c1 ^\markup { \sharp\sharp } | % 5
    c1 ^\markup { \doublesharp } | % 6
    c1 ^\markup { \doubleflat } | % 7
    c1 ^\markup { \natural\sharp } | % 8
    c1 ^\markup { \natural\flat } | % 9
    c1 ^\markup { \semiflat } | \barNumberCheck #10
    c1 ^\markup { \semisharp } | % 11
    c1 ^\markup { \sesquisharp } | % 12
    c1 ^\markup { \sesquiflat } | % 13
    cis1 ^\turn ^\markup { \natural } | % 14
    c1 ^\trill ^\markup { \sharp } }

PartPOneVoiceOneLyricsOne =  \lyricmode { sharp flat natural
    "sharp-sharp" "double-sharp" "flat-flat" "natural-sharp"
    "natural-flat" "quarter-flat" "quarter-sharp" "three-quarters-sharp"
    "three-quarters-flat" "turn & natural" "trill-mark & sharp" }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

