
\version "2.15.27"
% automatically converted by musicxml2ly from articulations.xml

\header {
    texidoc = Artikulationszeichen
    title = Articulations
    }

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  {
    \clef "treble" \key c \major c''4 -> c''4 -^ c''4 -. c''4 -- | % 2
    c''4 -_ c''4 -| c''4 c''4 | % 3
    c''4 c''4 -\bendAfter #4 c''4 -\bendAfter #-4 c''4 \breathe | % 4
    c''4 ^\markup { \musicglyph #"scripts.caesura.straight" } c''4 c''4
    r4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { acc. "str.-acc." stacc. ten.
    "det.-leg." stacc.ss spicc. scoop plop doit falloff breath caes.
    stress unstr. }

% The score definition
\new Staff <<
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

