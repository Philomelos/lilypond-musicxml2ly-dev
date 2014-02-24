
\version "2.17.3"
% automatically converted by musicxml2ly from unwanted_voices.xml

\header {
    texidoc = "if a <note> element contains a <chord/> element but no <voice> element musicxml2ly puts the chorded note without a <voice>-element in an own voice (PartPOneVoiceNone) instead of placing the notes in a chord construct (< a' c''>1) in the same voice."
    title = "missing voice element in chords bug"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 <b' c''>32
    r8.. r4 r2 }


% The score definition
\score {
    <<
        \new Staff <<
            \context Staff << 
                \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

