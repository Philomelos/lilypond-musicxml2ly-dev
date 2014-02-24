\version "2.17.28"


%   Define the alterations as fraction of the equal-tempered whole tone.
  % We use an alteration of 0.2 rather than 0.25 of a tone, so that the 
  % raised natural is a slightly different pitch than the lowered sharp.
#(define-public DOUBLE-SHARP  10/10)
#(define-public SHARP-RAISE    7/10)
#(define-public SHARP          5/10)
#(define-public SHARP-LOWER    3/10)
#(define-public NATURAL-RAISE  2/10)
#(define-public NATURAL-LOWER -2/10)
#(define-public FLAT-RAISE    -3/10)
#(define-public FLAT          -5/10)
#(define-public FLAT-LOWER    -7/10)
#(define-public DOUBLE-FLAT  -10/10)
#(define-public TRIPLE-FLAT -15/10)

  % Note names can now be defined to represent these pitches in our
  % Lilypond input.  We extend the list of Dutch note names:
arrowedPitchNames =  #`(
       (ceseses . ,(ly:make-pitch -1 0 TRIPLE-FLAT))
       (ceses . ,(ly:make-pitch -1 0 DOUBLE-FLAT))
       (ceseh . ,(ly:make-pitch -1 0 FLAT-LOWER))
       (ces   . ,(ly:make-pitch -1 0 FLAT))
       (cesih . ,(ly:make-pitch -1 0 FLAT-RAISE))
       (ceh   . ,(ly:make-pitch -1 0 NATURAL-LOWER))
       (c     . ,(ly:make-pitch -1 0 NATURAL))
       (cih   . ,(ly:make-pitch -1 0 NATURAL-RAISE))
       (ciseh . ,(ly:make-pitch -1 0 SHARP-LOWER))
       (cis   . ,(ly:make-pitch -1 0 SHARP))
       (cisih . ,(ly:make-pitch -1 0 SHARP-RAISE))
       (cisis . ,(ly:make-pitch -1 0 DOUBLE-SHARP))

       (deses . ,(ly:make-pitch -1 1 DOUBLE-FLAT))
       (deseh . ,(ly:make-pitch -1 1 FLAT-LOWER))
       (des   . ,(ly:make-pitch -1 1 FLAT))
       (desih . ,(ly:make-pitch -1 1 FLAT-RAISE))
       (deh   . ,(ly:make-pitch -1 1 NATURAL-LOWER))
       (d     . ,(ly:make-pitch -1 1 NATURAL))
       (dih   . ,(ly:make-pitch -1 1 NATURAL-RAISE))
       (diseh . ,(ly:make-pitch -1 1 SHARP-LOWER))
       (dis   . ,(ly:make-pitch -1 1 SHARP))
       (disih . ,(ly:make-pitch -1 1 SHARP-RAISE))
       (disis . ,(ly:make-pitch -1 1 DOUBLE-SHARP))

       (eeses . ,(ly:make-pitch -1 2 DOUBLE-FLAT))
       (eses  . ,(ly:make-pitch -1 2 DOUBLE-FLAT))
       (eeseh . ,(ly:make-pitch -1 2 FLAT-LOWER))
       (eseh  . ,(ly:make-pitch -1 2 FLAT-LOWER))
       (ees   . ,(ly:make-pitch -1 2 FLAT))
       (es    . ,(ly:make-pitch -1 2 FLAT))
       (eesih . ,(ly:make-pitch -1 2 FLAT-RAISE))
       (esih  . ,(ly:make-pitch -1 2 FLAT-RAISE))
       (eeh   . ,(ly:make-pitch -1 2 NATURAL-LOWER))
       (e     . ,(ly:make-pitch -1 2 NATURAL))
       (eih   . ,(ly:make-pitch -1 2 NATURAL-RAISE))
       (eiseh . ,(ly:make-pitch -1 2 SHARP-LOWER))
       (eis   . ,(ly:make-pitch -1 2 SHARP))
       (eisih . ,(ly:make-pitch -1 2 SHARP-RAISE))
       (eisis . ,(ly:make-pitch -1 2 DOUBLE-SHARP))

       (feses . ,(ly:make-pitch -1 3 DOUBLE-FLAT))
       (feseh . ,(ly:make-pitch -1 3 FLAT-LOWER))
       (fes   . ,(ly:make-pitch -1 3 FLAT))
       (fesih . ,(ly:make-pitch -1 3 FLAT-RAISE))
       (feh   . ,(ly:make-pitch -1 3 NATURAL-LOWER))
       (f     . ,(ly:make-pitch -1 3 NATURAL))
       (fih   . ,(ly:make-pitch -1 3 NATURAL-RAISE))
       (fiseh . ,(ly:make-pitch -1 3 SHARP-LOWER))
       (fis   . ,(ly:make-pitch -1 3 SHARP))
       (fisih . ,(ly:make-pitch -1 3 SHARP-RAISE))
       (fisis . ,(ly:make-pitch -1 3 DOUBLE-SHARP))

       (geses . ,(ly:make-pitch -1 4 DOUBLE-FLAT))
       (geseh . ,(ly:make-pitch -1 4 FLAT-LOWER))
       (ges   . ,(ly:make-pitch -1 4 FLAT))
       (gesih . ,(ly:make-pitch -1 4 FLAT-RAISE))
       (geh   . ,(ly:make-pitch -1 4 NATURAL-LOWER))
       (g     . ,(ly:make-pitch -1 4 NATURAL))
       (gih   . ,(ly:make-pitch -1 4 NATURAL-RAISE))
       (giseh . ,(ly:make-pitch -1 4 SHARP-LOWER))
       (gis   . ,(ly:make-pitch -1 4 SHARP))
       (gisih . ,(ly:make-pitch -1 4 SHARP-RAISE))
       (gisis . ,(ly:make-pitch -1 4 DOUBLE-SHARP))

       (aeses . ,(ly:make-pitch -1 5 DOUBLE-FLAT))
       (ases  . ,(ly:make-pitch -1 5 DOUBLE-FLAT))
       (aeseh . ,(ly:make-pitch -1 5 FLAT-LOWER))
       (aseh  . ,(ly:make-pitch -1 5 FLAT-LOWER))
       (aes   . ,(ly:make-pitch -1 5 FLAT))
       (as    . ,(ly:make-pitch -1 5 FLAT))
       (aesih . ,(ly:make-pitch -1 5 FLAT-RAISE))
       (asih  . ,(ly:make-pitch -1 5 FLAT-RAISE))
       (aeh   . ,(ly:make-pitch -1 5 NATURAL-LOWER))
       (a     . ,(ly:make-pitch -1 5 NATURAL))
       (aih   . ,(ly:make-pitch -1 5 NATURAL-RAISE))
       (aiseh . ,(ly:make-pitch -1 5 SHARP-LOWER))
       (ais   . ,(ly:make-pitch -1 5 SHARP))
       (aisih . ,(ly:make-pitch -1 5 SHARP-RAISE))
       (aisis . ,(ly:make-pitch -1 5 DOUBLE-SHARP))

       (beses . ,(ly:make-pitch -1 6 DOUBLE-FLAT))
       (beseh . ,(ly:make-pitch -1 6 FLAT-LOWER))
       (bes   . ,(ly:make-pitch -1 6 FLAT))
       (besih . ,(ly:make-pitch -1 6 FLAT-RAISE))
       (beh   . ,(ly:make-pitch -1 6 NATURAL-LOWER))
       (b     . ,(ly:make-pitch -1 6 NATURAL))
       (bih   . ,(ly:make-pitch -1 6 NATURAL-RAISE))
       (biseh . ,(ly:make-pitch -1 6 SHARP-LOWER))
       (bis   . ,(ly:make-pitch -1 6 SHARP))
       (bisih . ,(ly:make-pitch -1 6 SHARP-RAISE))
       (bisis . ,(ly:make-pitch -1 6 DOUBLE-SHARP))
       )
pitchnames = \arrowedPitchNames
#(ly:parser-set-note-names parser pitchnames)

  % The symbols for each alteration
arrowGlyphs = #`(
        (,DOUBLE-SHARP . "accidentals.doublesharp")
        (,(+ SHARP SHARP-LOWER) . "accidentals.sharp.arrowup")
        (,SHARP-RAISE  . "accidentals.sharp.arrowup")
        (,SHARP        . "accidentals.sharp")
        (,SHARP-LOWER  . "accidentals.sharp.arrowdown")
        (,NATURAL-RAISE . "accidentals.natural.arrowup")
        (  0            . "accidentals.natural")
        (,NATURAL-LOWER . "accidentals.natural.arrowdown")
        (,FLAT-RAISE   . "accidentals.flat.arrowup")
        (,FLAT         . "accidentals.flat")
        (,FLAT-LOWER   . "accidentals.flat.arrowdown")
        (,(+ FLAT FLAT-RAISE) . "accidentals.flat.arrowdown")
        (,DOUBLE-FLAT  . "accidentals.flatflat")
        (,TRIPLE-FLAT . "accidentals.flatflat")
)
  % Transposition could generate pitches with alterations
  %  double-sharp-lower (8/10) or double-flat-raise (-8/10)
  %  but there are no such symbols in the font, so we substituted
  %  the most appropriate symbols.
  % If some pitch in your score has no symbol, LilyPond gives a warning.

  % The glyph-list needs to be loaded into each object that
  %  draws accidentals.
\layout {
  \context {
    \Score
    \override KeySignature #'glyph-name-alist = \arrowGlyphs
    \override Accidental #'glyph-name-alist = \arrowGlyphs
    \override AccidentalCautionary #'glyph-name-alist = \arrowGlyphs
    \override TrillPitchAccidental #'glyph-name-alist = \arrowGlyphs
    \override AmbitusAccidental #'glyph-name-alist = \arrowGlyphs
  }
}
  % MIDI implements microtones as a pitch bend, with one bend per channel.
  % These lines below assign one channel to each Voice, in case there are
  % multiple voices on a staff, so that each voice can have its correct
  % pitch bend.
\midi {
  \context {
    \Staff
    \remove "Staff_performer"
  }
  \context {
    \Voice
    \consists "Staff_performer"
  }
}

flatflatflat = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.flat"
      \musicglyph #"accidentals.flatflat"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}



{
  \flatflatflat
  ceseses'
}

