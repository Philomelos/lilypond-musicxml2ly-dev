
\version "2.15.14"
% automatically converted by musicxml2ly from slur-lyrics.xml

\header {
    texidoc = "Soll eine Silbe unter einer Note stehen, an der ein 
    Legatobogen endet bzw. die manuell mit der davor stehenden Note 
    verbalkt wurde, dann kann dies über zwei Lösungsansätze erreicht 
    werden:
    1. In der .ly-Datei muss in der entsprechenden Notenvariable direkt 
    vor der Note mit Liedtext, an der der Legatobogen beginnt, der Befehl 
    \set melismaBusyProperties = #'() stehen.
    (Setzt man den Befehl unmittelbar vor die Note mit Liedtext, auf der 
    der Phrasierungsbogen endet, dann werden die beiden zusammengerückt 
    und der Bindestrich geht verloren. Nicht erstrebenswert!). Zur 
    Auflösung des Befehls sollte nach der übergebundenen Note mit 
    Liedtext `\unset melismaBusyProperties` folgen.
    2.In der .ly-Datei muss in der entsprechenden Liedtextvariable im 
    \lyricmode direkt vor der Silbe, an der in den Noten der Legatobogen 
    beginnt, der Befehl \set ignoreMelismata = ##t gesetzt werden. Zur 
    Auflösung des Befehls sollte nach der Silbe auf der übergebundenen 
    Note \unset melisma gesetzt werden."
    }

PartPOneVoiceOne =  {
    \clef "treble" \key c \major \time 4/4 
        \set melismaBusyProperties = #'() 
    
        c''2 (

        b'2 ) |%1
        \unset melismaBusyProperties
        c''1 |%2
        \autoBeamOff
        \set melismaBusyProperties = #'()
        c''8[c''8] 
        \unset melismaBusyProperties
        c''2.
}

PartPOneVoiceOneLyricsOne =  \lyricmode { 
%\set ignoreMelismata = ##t
Syl -- la -- ble
%\unset ignoreMelismata
%\set ignoreMelismata = ##t
Syl -- la -- ble
%\unset ignoreMelismata
}

% The score definition
\new Staff <<
    \context Staff << 

        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

