\version "2.17.6"
% automatically converted by musicxml2ly from automatic-stanzas.xml

\header {
    encodingsoftware = "MuseScore 1.2"
    title = "automatic stanzas"
    copyright = "rien \UTF{00E0} branler"
    encodingdate = "2013-02-14"
    }

#(set-global-staff-size 20.0762645669)
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
PartPOneVoiceOne =  \relative c'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 c1 \bar
    "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { \set stanza = #"1." "Bli" }
PartPOneVoiceOneLyricsTwo =  \lyricmode { \set stanza = #"2." "Bla" }
PartPOneVoiceOneLyricsThree =  \lyricmode { \set stanza = #"3." "Blub" }
PartPOneVoiceOneLyricsFour =  \lyricmode { \set stanza = #"4." "Blöd" }

% The score definition
\score {
    <<
 <<
            <<
 \new Staff <<
                    \context Staff << 
                        \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsTwo
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsThree
                        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsFour
                        >>
                    >> >>
            >> >> \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }

