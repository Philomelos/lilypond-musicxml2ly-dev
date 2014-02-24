
\version "2.15.20"
% automatically converted by musicxml2ly from chordnames-placement-bug.xml

PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \time 4/4 | % 1
    c1 }

PartPOneVoiceOneChords =  \chordmode {
    | % 1
    c1:5 }


% The score definition
\score {
  <<
    \new ChordNames = "PartPOneVoiceOneChords" \PartPOneVoiceOneChords
    \new Staff <<
      \new Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne } 
    >>
  >>
}

