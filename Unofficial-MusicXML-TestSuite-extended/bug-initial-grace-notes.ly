
\version "2.15.14"
% automatically converted by musicxml2ly from bug-initial-grace-notes.xml

\header {
    texidoc = "initial grace notes lead to strange mistakes: missing instrument names, missing system start braces and system start squares, wrong bar lines, clef repetitions... "
    title = "bug: initial grace notes"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative b' {
    \clef "treble" \key c \major \time 6/8 \grace { b16 [ d16 ] } c2. }

PartPTwoVoiceOne =  \relative c {
    \clef "bass" \key g \major \time 6/8 c2. }


% The score definition
\new StaffGroup \with { \consists "Instrument_name_engraver" } <<
    \set StaffGroup.instrumentName = \markup { \center-column { \line {""} \line {"	    "} } }
    \set StaffGroup.shortInstrumentName = \markup { \center-column { \line {""} \line {"	    "} } }
    \new Staff <<
        \set Staff.instrumentName = "I"
        \context Staff << 
            \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
            >>
        >>
    \new Staff <<
        \set Staff.instrumentName = "II"
        \context Staff << 
            \context Voice = "PartPTwoVoiceOne" { \PartPTwoVoiceOne }
            >>
        >>
    
    >>

