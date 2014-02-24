
\version "2.15.14"
% automatically converted by musicxml2ly from eyeglasses.xml

%% additional definitions required by the score:


\header {
    texidoc = "Brillenzeichen, als Aufforderung zum Dirigenten zu schauen."
    title = eyeglasses
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceNone =  {
    c'2 \mark \markup { \eyeglasses } b2 }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceNone" { \PartPOneVoiceNone }
        >>
    >>

