
\version "2.15.24"
% automatically converted by musicxml2ly from tied_chords-lyrics.xml

\header {
    encodingsoftware = "MuseScore 1.2"
    encodingdate = "2012-06-13"
    }

#(set-global-staff-size 20.0750126457)
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 1.0\cm
    bottom-margin = 2.0\cm
    left-margin = 1.0\cm
    right-margin = 1.0\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 <c' e'
        g' c''>2 ~ ~ ~ ~ <c' e' g' c''>2 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { "vé" }

% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \set Staff.instrumentName = "Voice"
                    \set Staff.shortInstrumentName = "Vo."
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

