
\version "2.13.54"
% automatically converted from 01a-Pitches-Pitches.xml

\header {
    texidoc = "All pitches from G to c'''' in 
          ascending steps; First without accidentals, then with a sharp and then 
          with a flat accidental. Double alterations and cautionary accidentals 
          are tested at the end."
    title = "Pitches and accidentals"
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g, {
    \clef "treble" \key c \major \time 4/4 g4 a4 b4 c4 | % 2
    d4 e4 f4 g4 | % 3
    a4 b4 c4 d4 | % 4
    e4 f4 g4 a4 | % 5
    b4 c4 d4 e4 | % 6
    f4 g4 a4 b4 | % 7
    c4 d4 e4 f4 | % 8
    g4 a4 b4 c4 | % 9
    gis,,,,4 ais4 bis4 cis4 | \barNumberCheck #10
    dis4 eis4 fis4 gis4 | % 11
    ais4 bis4 cis4 dis4 | % 12
    eis4 fis4 gis4 ais4 | % 13
    bis4 cis4 dis4 eis4 | % 14
    fis4 gis4 ais4 bis4 | % 15
    cis4 dis4 eis4 fis4 | % 16
    gis4 ais4 bis4 cis4 | % 17
    ges,,,,4 as4 bes4 ces4 | % 18
    des4 es4 fes4 ges4 | % 19
    as4 bes4 ces4 des4 | \barNumberCheck #20
    es4 fes4 ges4 as4 | % 21
    bes4 ces4 des4 es4 | % 22
    fes4 ges4 as4 bes4 | % 23
    ces4 des4 es4 fes4 | % 24
    ges4 as4 bes4 ces4 | % 31
    cisis,,4 ceses4 cis4 cis4 | % 32
    cis4 cis4 \bar "|."
    }


% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        >>
    >>

