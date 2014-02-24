
\version "2.17.95"
% automatically converted by musicxml2ly from 13-1220-li-xuanyi-finale.xml

\header {
    encodingsoftware = "Finale 2010 for Windows"
    copyright = "?? ©"
    encodingdate = "2013-12-21"
    }

#(set-global-staff-size 19.9946051575)
\paper {
    paper-width = 20.99\cm
    paper-height = 29.69\cm
    top-margin = 1.26\cm
    bottom-margin = 1.26\cm
    left-margin = 1.26\cm
    right-margin = 1.26\cm
    between-system-space = 1.97\cm
    page-top-space = 1.48\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative dis'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 \tempo
    4=80 r8 ^\markup{ \bold {Andante} } dis8 ( e8 [ c8 ] s2 | % 1
    gis4 ) r8 a8 ( c4 ) r8 dis,8 ( | % 2
    e4 ) r8 e8 ( gis8 [ a8 c8 d8 ] \break | % 3
    e4 ) r8 cis8 dis4 r8 b8 ~ | % 4
    d4 d8 ( [ e8 ] cis2 ) | % 5
    c8 ( [ c8 b8 a8 ) ] c8 ( [ c8 b8 a8 ) ] \break | % 6
    e'2 r8 dis8 ( e8 [ c8 ] | % 7
    a4 ) r8 ais8 ( cis8 e4 ) f8 | % 8
    fisis,4 r8 gis8 <f b>4. d'8 ~ \break | % 9
    es4 d8 [ c8 ] e8 ( [ b8 e8 fis8 ] | \barNumberCheck #10
    g4 ) r8 e8 ( fis4 ) r8 d8 ( | % 11
    f4 ) ( f8 ) [ g8 ] e4. cis8 ( \pageBreak | % 12
    es8 [ es8 d8 c8 ) ] d8 ( [ c8 ] a4 | % 13
    a2 ) \arpeggio a'8 \rest dis,8 ( e8 [ c8 ] | % 14
    <c, e a>2 ) r8 a'8 ( ais8 [ b8 ] | % 15
    g'4 d4 ) a'8 \rest a,8 ( b8 [ dis8 ] \break | % 16
    e4 a,4 ) r8 f8 ( fis8 [ b8 ] | % 17
    <e, gis b>2 ) r4 \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        b'8 ( [ bis8 cis8 ] }
    | % 18
    a'4 e4 ) a4 \rest \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        d,8 ( [ e8 eis8 ) ] }
    \break | % 19
    fis8 [ b,8 ] d8 a'8 \rest a8 \rest d,8 ( b8 [ f'8 ] |
    \barNumberCheck #20
    e4 ) a4 \rest a4 \rest \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        dis,8 ( [ e8 gis8 ) ] }
    | % 21
    b2 a4 \rest \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        fis8 [ a8 cis8 ] }
    \break | % 22
    e4. d8 a8 \rest d,8 ( cis8 [ b8 ] | % 23
    b'4 fis4 ) fis,8 g4 cis8 | % 24
    a2 a'8 \rest es8 ( f8 [ c8 ] | % 25
    <ges as d>2. ) \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        d'8 ( [ dis8 e8 ] }
    \pageBreak | % 26
    a4 g4 ) a4 \rest \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        f8 ( [ g8 gis8 ] }
    | % 27
    b4 d,4 ) a'8 \rest ( b,8 c8 [ g'8 ] | % 28
    <g, c e>2. ) \once \override TupletBracket #'stencil = ##f
    \times 2/3  {
        d'8 ( [ dis8 e8 ] }
    | % 29
    b'4 fis4 ) a4 \rest e16 ( [ f16 fis16 g16 ] \break | \barNumberCheck
    #30
    gis8 [ cis,8 ] e8 ) a8 \rest a8 \rest e8 cis8 [ g'8 ] | % 31
    fis4 r4 r8 eis8 ( fis8 [ ais8 ] | % 32
    cis2 ) a8 \rest gis8 ( b8 [ dis8 ] \break | % 33
    fis4. e8 ) a,8 \rest s4. | % 34
    gis,4 r8 a8 ( c4 ) r8 dis,8 ( | % 35
    e4 ) r8 e8 ( gis8 [ a8 c8 d8 ] | % 36
    e4 ) r8 cis8 dis4 r8 b8 ~ \break | % 37
    d4 d8 ( [ e8 ] cis2 ) | % 38
    d8 ( [ c8 b8 a8 ) ] c8 ( [ c8 b8 a8 ] | % 39
    e'2 ) r8 dis8 ( e8 [ c8 ] | \barNumberCheck #40
    a4 ) r8 ais8 cis8 e4 f8 ( \pageBreak | % 41
    fisis,4 ) r8 gis8 ( <f b>4. ) d'8 ( | % 42
    es4 ) d8 [ c8 ] es8 ( [ b8 es8 fis8 ] | % 43
    g4 ) a8 \rest e8 fis4 a8 \rest d,8 ~ \break | % 44
    f4 f8 [ g8 ] e4. cis8 ( | % 45
    es8 [ es8 d8 c8 ) ] d8 [ c8 ] a4 | % 46
    <c, e a>1 \bar "|."
    }

PartPOneVoiceThree =  \relative c {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 r4 r4 s2 | % 1
    c8 ( [ e8 a8 c8 ) ] a,8 ( [ dis8 fis8 c'8 ) ] | % 2
    gis,8 ( [ b8 b'8 gis8 ) ] a,8 ( [ c8 f8 a8 ) ] \break | % 3
    g8 ( [ a8 cis8 e8 ) ] fis,8 ( [ a8 b8 dis8 ) ] | % 4
    f,8 ( [ a8 c8 d8 ) ] e,8 ( [ g8 a8 cis8 ) ] | % 5
    dis,8 ( [ fis8 a8 c8 ) ] e,8 ( [ a8 c8 e8 ) ] \break | % 6
    e,8 ( [ gis8 b8 d8 ] e2 ) | % 7
    cis,8 ( [ f8 ais8 cis8 ) ] ais,8 ( [ e'8 g8 cis8 ) ] | % 8
    gis,8 ( [ dis'8 fisis8 bis8 ) ] g,8 ( [ f'8 bis8 d8 ) ] \break | % 9
    f,8 ( [ a8 c8 es8 ) ] e,8 ( [ gis8 b8 d8 ) ] | \barNumberCheck #10
    bes8 ( [ c8 e8 g8 ) ] a,8 ( [ c8 d8 fis8 ) ] | % 11
    as,8 ( [ c8 d8 f8 ) ] g,8 ( [ cis8 ] e8 ) r8 \pageBreak | % 12
    f,8 ( [ c'8 f8 e8 ) ] e,8 ( [ b'8 d8 e8 ) ] | % 13
    a,,8 ( [ e'8 a8 c8 ] e2 ) | % 14
    c4 \rest b4 ~ <b f' ais>2 | % 15
    c8 \rest f,8 <g e'>8 [ c8 ] c8 \rest f,8 <g c e>4 \break | % 16
    c4 \rest e8 [ c8 ] c2 \rest | % 17
    c4 \rest cis2 ~ <cis e gis>4 | % 18
    c8 \rest g8 <a fis'>8 [ d8 ] c8 \rest g8 <a d fis>4 \break s2 <g b>4
    c4 \rest | \barNumberCheck #20
    a,8 [ <c e>8 b'8 a8 ] <gis b>2 | % 21
    <a cis>4 <e' g>4 <b d>2 \break | % 22
    d2 <b d>2 | % 23
    b4 d4 a2 | % 24
    <fis a>4. <e g>8 <c f a>2 | % 25
    r8 f8 b8 [ c8 ] e,2 \pageBreak | % 26
    c'8 \rest bes8 [ \change Staff="1" <c a'>8 f8 ] \change Staff="2" c8
    \rest bes8 \change Staff="1" <c f a>4 \change Staff="2" | % 27
    f,8 [ b8 ] d8 r8 <e, g b>8 r8 r4 | % 28
    r8 <f a>8 <a d>2 r4 | % 29
    c8 \rest a8 <b gis'>8 [ e8 ] c8 \rest a8 <b e gis>4 \break |
    \barNumberCheck #30
    r8 e,8 a4 ( fis4 ) ais,4 | % 31
    <a' d>4 c4 \rest c4 \rest \change Staff="1" <ais' cis>4 \change
    Staff="2" | % 32
    <b, dis>4 <fis' a>4 <cis e>2 \break | % 33
    e2 r2 | % 34
    c,8 ( [ e8 a8 c8 ) ] a,8 ( [ dis8 fis8 dis'8 ) ] | % 35
    g,,8 ( [ b8 b'8 gis8 ) ] a,8 ( [ c8 f8 a8 ) ] | % 36
    g8 ( [ a8 cis8 e8 ) ] fis,8 ( [ a8 b8 dis8 ) ] \break | % 37
    f,8 ( [ a8 c8 d8 ) ] e,8 ( [ g8 a8 cis8 ) ] | % 38
    es,8 ( [ g8 a8 ces8 ) ] e,8 ( [ a8 ces8 e8 ) ] | % 39
    e,8 ( [ gis8 b8 d8 ] e2 ) | \barNumberCheck #40
    cis,8 ( [ f8 ais8 cis8 ) ] ais,8 ( [ e'8 g8 cis8 ) ] \pageBreak | % 41
    gis,8 ( [ dis'8 fisis8 bis8 ) ] g,8 ( [ f'8 bis8 d8 ) ] | % 42
    f,8 ( [ a8 c8 es8 ) ] es,8 ( [ gis8 b8 d8 ) ] | % 43
    bes8 ( [ c8 e8 g8 ) ] a,8 ( [ c8 d8 fis8 ) ] \break | % 44
    as,8 ( [ c8 d8 f8 ) ] g,8 ( [ cis8 ] e8 ) r8 | % 45
    f,8 ( [ c'8 f8 e8 ) ] e,8 ( [ b'8 d8 e8 ) ] | % 46
    a,,8 ( [ e'8 a8 c8 ] e2 ) \bar "|."
    }

PartPOneVoiceTwo =  \relative c'' {
    \clef "treble" \key c \major \numericTimeSignature\time 4/4 \tempo
    4=80 s1*3 ^\markup{ \bold {Andante} } \break s1*3 \break s1*3 \break
    s1*2 | % 11
    c8 [ f,8 g8 a8 ] bes4. cis8 \pageBreak | % 12
    a4. f8 g4. c,8 \rest | % 13
    <c e>2 ~ e2 s1 | % 15
    <e c'>2 c2 \rest \break s1*2 | % 18
    <fis d'>2 c2 \rest \break | % 19
    c4 \rest fis8 [ e8 ] s4 e8 [ d8 ] s2 c4 \rest <gis' b>4 | % 21
    c,8 \rest b'8 ( cis8 [ e8 ] <d, d'>2 ) \break | % 22
    fis8 [ a8 ] cis4 fis,2 | % 23
    g4 b8 [ e,8 ~ ] e4 b4 | % 24
    d2 c2 \rest | % 25
    c4 \rest e2 ~ <e ges b>4 \pageBreak | % 26
    <a f'>2 c,4 \rest <c f a>4 | % 27
    c4 \rest a'8 [ f8 ] d2 s1 | % 29
    <gis e'>2 c,2 \rest \break | \barNumberCheck #30
    c4 \rest gis'8 [ fis8 ] \change Staff="2" <a, cis>4 \change
    Staff="1" fis'8 ( [ e8 ] s1 | % 32
    c8 \rest cis'8 dis8 [ fis8 ] <gis, e'>2 \break | % 33
    gis8 [ b8 ] dis4. dis8 [ e8 c8 ] s1*3 \break s1*4 \pageBreak s1*2 | % 43
    c,8 \rest a'8 bes4 c,8 \rest g'8 a4 \break | % 44
    c8 [ f,8 g8 a8 ] b4. cis8 s1*2 \bar "|."
    }

PartPOneVoiceFive =  \relative g {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 s1*3
    \break s1*3 \break s1*3 \break s1*3 \pageBreak s1*4 \break s1*3
    \break s1 | \barNumberCheck #20
    <g c>2 s1. \break s1*4 \pageBreak s1*4 \break s1*3 \break s1*4
    \break s1*4 \pageBreak s1*3 \break s1*3 \bar "|."
    }

PartPOneVoiceFour =  \relative e, {
    \clef "bass" \key c \major \numericTimeSignature\time 4/4 s1*3
    \break s1*3 \break s1*3 \break s1*3 \pageBreak s1*2 | % 14
    e8 \rest c'8 fis8 [ g8 ] b,2 | % 15
    b2 a2 \break | % 16
    a8 [ fis'8 ] a8 e,8 \rest <b' d fis a>4 e,4 \rest | % 17
    e8 \rest d'8 gis8 [ a8 ] cis,2 | % 18
    c2 b2 \break | % 19
    e,8 \rest d'8 g4 e4 gis,4 | \barNumberCheck #20
    e2 \rest s1. \break s1 | % 23
    e'4 g2. s1*2 \pageBreak | % 26
    es2 d2 s1*2 | % 29
    d2 cis2 \break s1 | % 31
    b8 [ <d fis>8 cis'8 b8 ] <ais cis>2 s1 \break s1*4 \break s1*4
    \pageBreak s1*3 \break s1*3 \bar "|."
    }


% The score definition
\score {
    <<
        \new PianoStaff <<
            \set PianoStaff.instrumentName = "Piano"
            \set PianoStaff.shortInstrumentName = "Pno."
            \context Staff = "1" << 
                \context Voice = "PartPOneVoiceOne" { \voiceOne \PartPOneVoiceOne }
                \context Voice = "PartPOneVoiceTwo" { \voiceTwo \PartPOneVoiceTwo }
                >> \context Staff = "2" <<
                \context Voice = "PartPOneVoiceThree" { \voiceOne \PartPOneVoiceThree }
                \context Voice = "PartPOneVoiceFive" { \voiceTwo \PartPOneVoiceFive }
                \context Voice = "PartPOneVoiceFour" { \voiceThree \PartPOneVoiceFour }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {}
    }

