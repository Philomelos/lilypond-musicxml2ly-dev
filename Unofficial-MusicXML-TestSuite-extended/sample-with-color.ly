\version "2.17.97"
% automatically converted by musicxml2ly from /Users/pls/Desktop/sample-with-color.xml

\header {
    encodingsoftware = 
    "MuseScore 1.3" title =
    "op. 109 Lied ohne Worte " composer =
    "Mendelssohn, Felix" encodingdate =
    "2013-07-22" }

#(set-global-staff-size 20.0750126457)
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 1.0\cm
    bottom-margin = 2.0\cm
    left-margin = 1.0\cm
    right-margin = 1.0\cm
    indent = 1.74166666667\cm
    short-indent = 0.633333333333\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative a {
    \clef "bass" \key f \major \time 4/4 r8 \stemDown a16 [ \stemDown a16
    ] \stemDown bes8 ( [ \grace { \once \override NoteHead.color =
        #(rgb-color 1.0 0.0 0.0) \stemUp \once \override Stem.color =
        #(rgb-color 1.0 0.0 0.0) cis16 [ \stemUp bes16 ] } \stemDown a16
    \stemDown bes16 ) ] \stemDown d8 ( [ \stemDown cis16 \stemDown bes16
    ) ] \stemDown a4 ( | % 2
    \stemDown a8 ) [ \stemDown g8 ( \stemDown f8 \stemDown g8 ) ]
    \stemDown f4 ( \stemDown e4 ) \break | % 3
    r8 \stemDown a16 [ \stemDown a16 ] \stemDown bes8 ( [ \grace { \once
        \override NoteHead.color = #(rgb-color 0.0 0.0 1.0) \stemUp
        \once \override Stem.color = #(rgb-color 0.0 0.0 1.0) c16 [
        \stemUp bes16 ] } \stemDown a16 \stemDown bes16 ) ] \stemDown d8
    ( [ \stemDown c16 \stemDown bes16 ) ] \stemDown a4 ( | % 4
    \stemDown a8 ) [ \stemDown g8 ( \stemDown f8 \stemDown g8 ) ]
    \stemDown f4 ( \stemDown e4 ) \bar "|."
    }


% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \set Staff.instrumentName = "Violoncello"
                    \set Staff.shortInstrumentName = "Vlc."
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

