\version "2.17.28"


%   Define the alterations as fraction of the equal-tempered whole tone.
  % We use an alteration of 0.2 rather than 0.25 of a tone, so that the 
  % raised natural is a slightly different pitch than the lowered sharp.
#(define-public TRIPLE-SHARP 300/200)		%15/10
#(define-public DOUBLE-SHARP  200/200)		%10/10
#(define-public SHARP-SHARP 200/200)
#(define-public SLASH-SHARP 178/200) %makam
#(define-public THREE-QUARTERS-SHARP 150/200)
#(define-public SHARP-UP 150/200)
#(define-public SHARP-RAISE    125/200)		%7/10
#(define-public SLASH-QUARTER-SHARP 111/200) %makam
#(define-public SHARP          100/200)			%5/10
#(define-public NATURAL-SHARP 100/200)
#(define-public MAKAM-SHARP 88/200)
#(define-public SHARP-LOWER    75/200)		%3/10
#(define-public SORI 50/200)
#(define-public QUARTER-SHARP 50/200)
#(define-public SHARP-DOWN 50/200)
#(define-public NATURAL-UP 50/200)
#(define-public NATURAL-RAISE  25/200)		%2/10
#(define-public MAKAM-QUARTER-SHARP 22/200)
#(define-public NATURAL 0/200)
#(define-public NATURAL-LOWER -25/200)		%-2/10
#(define-public MAKAM-QUARTER-FLAT -22/200)
#(define-public NATURAL-DOWN -50/200)
#(define-public QUARTER-FLAT -50/200)
#(define-public FLAT-UP -50/200)
#(define-public KORON -50/200)
#(define-public FLAT-RAISE    -75/200)			%-3/10
#(define-public SLASH-FLAT -88/200) %makam
#(define-public NATURAL-FLAT -100/200)
#(define-public FLAT          -100/200)			%-5/10
#(define-public MAKAM-FLAT -111/200)
#(define-public FLAT-LOWER    -125/200)		%-7/10
#(define-public FLAT-DOWN -150/200)
#(define-public THREE-QUARTERS-FLAT -150/200)
#(define-public DOUBLE-SLASH-FLAT -178/200) %makam
#(define-public FLAT-FLAT  -200/200)		%-10/10
#(define-public TRIPLE-FLAT -300/200)			%-15/10

  % Note names can now be defined to represent these pitches in our
  % Lilypond input.  We extend the list of Dutch note names:
extendedPitchNames =  #`(
       (cisisis . ,(ly:make-pitch -1 0 TRIPLE-SHARP))
       (cisis . ,(ly:make-pitch -1 0 DOUBLE-SHARP))
       (cbm . ,(ly:make-pitch -1 0 SLASH-SHARP))
       (cisih . ,(ly:make-pitch -1 0 THREE-QUARTERS-SHARP))
       (cisi . ,(ly:make-pitch -1 0 SHARP-UP))
       (cck . ,(ly:make-pitch -1 0 SLASH-QUARTER-SHARP))
       (cis . ,(ly:make-pitch -1 0 SHARP))
       (cb . ,(ly:make-pitch -1 0 MAKAM-SHARP))
       (cih . ,(ly:make-pitch -1 0 QUARTER-SHARP))
       (cise . ,(ly:make-pitch -1 0 SHARP-DOWN))
       (ci . ,(ly:make-pitch -1 0 NATURAL-UP))
       (cc . ,(ly:make-pitch -1 0 MAKAM-QUARTER-SHARP))
       (c . ,(ly:make-pitch -1 0 NATURAL))
       (cfc . ,(ly:make-pitch -1 0 MAKAM-QUARTER-FLAT))
       (ce . ,(ly:make-pitch -1 0 NATURAL-DOWN))
       (ceh  . ,(ly:make-pitch -1 0 QUARTER-FLAT))
       (cesi . ,(ly:make-pitch -1 0 FLAT-UP)) 
       (cfb . ,(ly:make-pitch -1 0 SLASH-FLAT))    
       (ces . ,(ly:make-pitch -1 0 FLAT))
       (cfk   . ,(ly:make-pitch -1 0 MAKAM-FLAT))
       (cese . ,(ly:make-pitch -1 0 FLAT-DOWN))
       (ceseh . ,(ly:make-pitch -1 0 THREE-QUARTERS-FLAT))
       (cfbm . ,(ly:make-pitch -1 0 DOUBLE-SLASH-FLAT)) 
       (ceses  . ,(ly:make-pitch -1 0 FLAT-FLAT))         
       (ceseses . ,(ly:make-pitch -1 0 TRIPLE-FLAT)) 

       (disisis . ,(ly:make-pitch -1 1 TRIPLE-SHARP))
       (disis . ,(ly:make-pitch -1 1 DOUBLE-SHARP))
       (dbm . ,(ly:make-pitch -1 1 SLASH-SHARP))
       (disih . ,(ly:make-pitch -1 1 THREE-QUARTERS-SHARP))
       (disi . ,(ly:make-pitch -1 1 SHARP-UP))
       (dck . ,(ly:make-pitch -1 1 SLASH-QUARTER-SHARP))
       (dis . ,(ly:make-pitch -1 1 SHARP))
       (db . ,(ly:make-pitch -1 1 MAKAM-SHARP))
       (dih . ,(ly:make-pitch -1 1 QUARTER-SHARP))
       (dise . ,(ly:make-pitch -1 1 SHARP-DOWN))
       (di . ,(ly:make-pitch -1 1 NATURAL-UP))
       (dc . ,(ly:make-pitch -1 1 MAKAM-QUARTER-SHARP))
       (d . ,(ly:make-pitch -1 1 NATURAL))
       (dfc . ,(ly:make-pitch -1 1 MAKAM-QUARTER-FLAT))
       (de . ,(ly:make-pitch -1 1 NATURAL-DOWN))
       (deh  . ,(ly:make-pitch -1 1 QUARTER-FLAT))
       (desi . ,(ly:make-pitch -1 1 FLAT-UP)) 
       (dfb . ,(ly:make-pitch -1 1 SLASH-FLAT))    
       (des . ,(ly:make-pitch -1 1 FLAT))
       (dfk   . ,(ly:make-pitch -1 1 MAKAM-FLAT))
       (dese . ,(ly:make-pitch -1 1 FLAT-DOWN))
       (deseh . ,(ly:make-pitch -1 1 THREE-QUARTERS-FLAT))
       (dfbm . ,(ly:make-pitch -1 1 DOUBLE-SLASH-FLAT)) 
       (deses  . ,(ly:make-pitch -1 1 FLAT-FLAT))         
       (deseses . ,(ly:make-pitch -1 1 TRIPLE-FLAT)) 

       (eisisis . ,(ly:make-pitch -1 2 TRIPLE-SHARP))
       (eisis . ,(ly:make-pitch -1 2 DOUBLE-SHARP))
       (ebm . ,(ly:make-pitch -1 2 SLASH-SHARP))
       (eisih . ,(ly:make-pitch -1 2 THREE-QUARTERS-SHARP))
       (eisi . ,(ly:make-pitch -1 2 SHARP-UP))
       (eck . ,(ly:make-pitch -1 2 SLASH-QUARTER-SHARP))
       (eis . ,(ly:make-pitch -1 2 SHARP))
       (eb . ,(ly:make-pitch -1 2 MAKAM-SHARP))
       (eih . ,(ly:make-pitch -1 2 QUARTER-SHARP))
       (eise . ,(ly:make-pitch -1 2 SHARP-DOWN))
       (ei . ,(ly:make-pitch -1 2 NATURAL-UP))
       (ec . ,(ly:make-pitch -1 2 MAKAM-QUARTER-SHARP))
       (e . ,(ly:make-pitch -1 2 NATURAL))
       (efc . ,(ly:make-pitch -1 2 MAKAM-QUARTER-FLAT))
       (ee . ,(ly:make-pitch -1 2 NATURAL-DOWN))
       (eeh  . ,(ly:make-pitch -1 2 QUARTER-FLAT))
       (eh  . ,(ly:make-pitch -1 2 QUARTER-FLAT))
       (eesi . ,(ly:make-pitch -1 2 FLAT-UP)) 
       (esi . ,(ly:make-pitch -1 2 FLAT-UP)) 
       (efb . ,(ly:make-pitch -1 2 SLASH-FLAT))    
       (ees . ,(ly:make-pitch -1 2 FLAT))
       (es . ,(ly:make-pitch -1 2 FLAT))
       (efk   . ,(ly:make-pitch -1 2 MAKAM-FLAT))
       (eese . ,(ly:make-pitch -1 2 FLAT-DOWN))
       (ese . ,(ly:make-pitch -1 2 FLAT-DOWN))
       (eeseh . ,(ly:make-pitch -1 2 THREE-QUARTERS-FLAT))
       (eseh . ,(ly:make-pitch -1 2 THREE-QUARTERS-FLAT))
       (efbm . ,(ly:make-pitch -1 2 DOUBLE-SLASH-FLAT)) 
       (eeses  . ,(ly:make-pitch -1 2 FLAT-FLAT))    
       (eses  . ,(ly:make-pitch -1 2 FLAT-FLAT)) 
       (eeseses . ,(ly:make-pitch -1 2 TRIPLE-FLAT)) 
       (eseses . ,(ly:make-pitch -1 2 TRIPLE-FLAT)) 

       (fisisis . ,(ly:make-pitch -1 3 TRIPLE-SHARP))
       (fisis . ,(ly:make-pitch -1 3 DOUBLE-SHARP))
       (fbm . ,(ly:make-pitch -1 3 SLASH-SHARP))
       (fisih . ,(ly:make-pitch -1 3 THREE-QUARTERS-SHARP))
       (fisi . ,(ly:make-pitch -1 3 SHARP-UP))
       (fck . ,(ly:make-pitch -1 3 SLASH-QUARTER-SHARP))
       (fis . ,(ly:make-pitch -1 3 SHARP))
       (fb . ,(ly:make-pitch -1 3 MAKAM-SHARP))
       (fih . ,(ly:make-pitch -1 3 QUARTER-SHARP))
       (fise . ,(ly:make-pitch -1 3 SHARP-DOWN))
       (fi . ,(ly:make-pitch -1 3 NATURAL-UP))
       (fc . ,(ly:make-pitch -1 3 MAKAM-QUARTER-SHARP))
       (f . ,(ly:make-pitch -1 3 NATURAL))
       (ffc . ,(ly:make-pitch -1 3 MAKAM-QUARTER-FLAT))
       (fe . ,(ly:make-pitch -1 3 NATURAL-DOWN))
       (feh  . ,(ly:make-pitch -1 3 QUARTER-FLAT))
       (fesi . ,(ly:make-pitch -1 3 FLAT-UP)) 
       (ffb . ,(ly:make-pitch -1 3 SLASH-FLAT))    
       (fes . ,(ly:make-pitch -1 3 FLAT))
       (ffk   . ,(ly:make-pitch -1 3 MAKAM-FLAT))
       (fese . ,(ly:make-pitch -1 3 FLAT-DOWN))
       (feseh . ,(ly:make-pitch -1 3 THREE-QUARTERS-FLAT))
       (ffbm . ,(ly:make-pitch -1 3 DOUBLE-SLASH-FLAT)) 
       (feses  . ,(ly:make-pitch -1 3 FLAT-FLAT))         
       (feseses . ,(ly:make-pitch -1 3 TRIPLE-FLAT)) 

       (gisisis . ,(ly:make-pitch -1 4 TRIPLE-SHARP))
       (gisis . ,(ly:make-pitch -1 4 DOUBLE-SHARP))
       (gbm . ,(ly:make-pitch -1 4 SLASH-SHARP))
       (gisih . ,(ly:make-pitch -1 4 THREE-QUARTERS-SHARP))
       (gisi . ,(ly:make-pitch -1 4 SHARP-UP))
       (gck . ,(ly:make-pitch -1 4 SLASH-QUARTER-SHARP))
       (gis . ,(ly:make-pitch -1 4 SHARP))
       (gb . ,(ly:make-pitch -1 4 MAKAM-SHARP))
       (gih . ,(ly:make-pitch -1 4 QUARTER-SHARP))
       (gise . ,(ly:make-pitch -1 4 SHARP-DOWN))
       (gi . ,(ly:make-pitch -1 4 NATURAL-UP))
       (gc . ,(ly:make-pitch -1 4 MAKAM-QUARTER-SHARP))
       (g . ,(ly:make-pitch -1 4 NATURAL))
       (gfc . ,(ly:make-pitch -1 4 MAKAM-QUARTER-FLAT))
       (ge . ,(ly:make-pitch -1 4 NATURAL-DOWN))
       (geh  . ,(ly:make-pitch -1 4 QUARTER-FLAT))
       (gesi . ,(ly:make-pitch -1 4 FLAT-UP)) 
       (gfb . ,(ly:make-pitch -1 4 SLASH-FLAT))    
       (ges . ,(ly:make-pitch -1 4 FLAT))
       (gfk   . ,(ly:make-pitch -1 4 MAKAM-FLAT))
       (gese . ,(ly:make-pitch -1 4 FLAT-DOWN))
       (geseh . ,(ly:make-pitch -1 4 THREE-QUARTERS-FLAT))
       (gfbm . ,(ly:make-pitch -1 4 DOUBLE-SLASH-FLAT)) 
       (geses  . ,(ly:make-pitch -1 4 FLAT-FLAT))         
       (geseses . ,(ly:make-pitch -1 4 TRIPLE-FLAT)) 

       (aisisis . ,(ly:make-pitch -1 5 TRIPLE-SHARP))
       (aisis . ,(ly:make-pitch -1 5 DOUBLE-SHARP))
       (abm . ,(ly:make-pitch -1 5 SLASH-SHARP))
       (aisih . ,(ly:make-pitch -1 5 THREE-QUARTERS-SHARP))
       (aisi . ,(ly:make-pitch -1 5 SHARP-UP))
       (ack . ,(ly:make-pitch -1 5 SLASH-QUARTER-SHARP))
       (ais . ,(ly:make-pitch -1 5 SHARP))
       (ab . ,(ly:make-pitch -1 5 MAKAM-SHARP))
       (aih . ,(ly:make-pitch -1 5 QUARTER-SHARP))
       (aise . ,(ly:make-pitch -1 5 SHARP-DOWN))
       (ai . ,(ly:make-pitch -1 5 NATURAL-UP))
       (ac . ,(ly:make-pitch -1 5 MAKAM-QUARTER-SHARP))
       (a . ,(ly:make-pitch -1 5 NATURAL))
       (afc . ,(ly:make-pitch -1 5 MAKAM-QUARTER-FLAT))
       (ae . ,(ly:make-pitch -1 5 NATURAL-DOWN))
       (aeh  . ,(ly:make-pitch -1 5 QUARTER-FLAT))
       (aesi . ,(ly:make-pitch -1 5 FLAT-UP)) 
       (asi . ,(ly:make-pitch -1 5 FLAT-UP)) 
       (afb . ,(ly:make-pitch -1 5 SLASH-FLAT))    
       (aes . ,(ly:make-pitch -1 5 FLAT))
       (as . ,(ly:make-pitch -1 5 FLAT))
       (afk   . ,(ly:make-pitch -1 5 MAKAM-FLAT))
       (aese . ,(ly:make-pitch -1 5 FLAT-DOWN))
       (ase . ,(ly:make-pitch -1 5 FLAT-DOWN))
       (aeseh . ,(ly:make-pitch -1 5 THREE-QUARTERS-FLAT))
       (aseh . ,(ly:make-pitch -1 5 THREE-QUARTERS-FLAT))
       (afbm . ,(ly:make-pitch -1 5 DOUBLE-SLASH-FLAT)) 
       (aeses  . ,(ly:make-pitch -1 5 FLAT-FLAT))   
       (ases  . ,(ly:make-pitch -1 5 FLAT-FLAT))
       (aeseses . ,(ly:make-pitch -1 5 TRIPLE-FLAT)) 
       (aseses . ,(ly:make-pitch -1 5 TRIPLE-FLAT)) 

       (bisisis . ,(ly:make-pitch -1 6 TRIPLE-SHARP))
       (bisis . ,(ly:make-pitch -1 6 DOUBLE-SHARP))
       (bbm . ,(ly:make-pitch -1 6 SLASH-SHARP))
       (bisih . ,(ly:make-pitch -1 6 THREE-QUARTERS-SHARP))
       (bisi . ,(ly:make-pitch -1 6 SHARP-UP))
       (bck . ,(ly:make-pitch -1 6 SLASH-QUARTER-SHARP))
       (bis . ,(ly:make-pitch -1 6 SHARP))
       (bb . ,(ly:make-pitch -1 6 MAKAM-SHARP))
       (bih . ,(ly:make-pitch -1 6 QUARTER-SHARP))
       (bise . ,(ly:make-pitch -1 6 SHARP-DOWN))
       (bi . ,(ly:make-pitch -1 6 NATURAL-UP))
       (bc . ,(ly:make-pitch -1 6 MAKAM-QUARTER-SHARP))
       (b . ,(ly:make-pitch -1 6 NATURAL))
       (bfc . ,(ly:make-pitch -1 6 MAKAM-QUARTER-FLAT))
       (be . ,(ly:make-pitch -1 6 NATURAL-DOWN))
       (beh  . ,(ly:make-pitch -1 6 QUARTER-FLAT))
       (besi . ,(ly:make-pitch -1 6 FLAT-UP)) 
       (bfb . ,(ly:make-pitch -1 6 SLASH-FLAT))    
       (bes . ,(ly:make-pitch -1 6 FLAT))
       (bfk   . ,(ly:make-pitch -1 6 MAKAM-FLAT))
       (bese . ,(ly:make-pitch -1 6 FLAT-DOWN))
       (beseh . ,(ly:make-pitch -1 6 THREE-QUARTERS-FLAT))
       (bfbm . ,(ly:make-pitch -1 6 DOUBLE-SLASH-FLAT)) 
       (beses  . ,(ly:make-pitch -1 6 FLAT-FLAT))         
       (beseses . ,(ly:make-pitch -1 6 TRIPLE-FLAT)) 
       )
pitchnames = \extendedPitchNames
#(ly:parser-set-note-names parser pitchnames)

  % The symbols for each alteration
accidentalGlyphs = #`(
        (,TRIPLE-SHARP . "accidentals.doublesharp")
        (,DOUBLE-SHARP . "accidentals.doublesharp")
        (,SLASH-SHARP . "accidentals.sharp.slashslashslash.stemstem")
        (,(+ SHARP SHARP-LOWER) . "accidentals.sharp.arrowup")
        (,SHARP-RAISE  . "accidentals.sharp.arrowup")
        (,THREE-QUARTERS-SHARP . "accidentals.sharp.slashslash.stemstemstem")
        (,SHARP-UP . "accidentals.sharp.arrowup")
        (,SLASH-QUARTER-SHARP . "accidentals.sharp.slashslashslash.stem")
        (,SHARP        . "accidentals.sharp")
        (,NATURAL-SHARP . "accidentals.sharp")
        (,MAKAM-SHARP . "accidentals.sharp")
        (,SHARP-LOWER  . "accidentals.sharp.arrowdown")
        (,NATURAL-RAISE . "accidentals.natural.arrowup")
        (,QUARTER-SHARP . "accidentals.sharp.slashslash.stem")
        (,SHARP-DOWN . "accidentals.sharp.arrowdown")
        (,NATURAL-UP . "accidentals.natural.arrowup")
        (,MAKAM-QUARTER-SHARP . "accidentals.sharp.slashslash.stem")
        (  0            . "accidentals.natural")
        (,NATURAL-LOWER . "accidentals.natural.arrowdown")
        (,FLAT-RAISE   . "accidentals.flat.arrowup")
        (,MAKAM-QUARTER-FLAT . "accidentals.mirroredflat")
        (,NATURAL-DOWN . "accidentals.natural.arrowdown")
        (,QUARTER-FLAT . "accidentals.mirroredflat")
        (,FLAT-UP . "accidentals.flat.arrowup")
        (,SLASH-FLAT . "accidentals.flat.slash")
        (,FLAT         . "accidentals.flat")
        (,MAKAM-FLAT . "accidentals.flat")
        (,FLAT-LOWER   . "accidentals.flat.arrowdown")
        (,FLAT-DOWN . "accidentals.flat.arrowdown")
        (,(+ FLAT FLAT-RAISE) . "accidentals.flat.arrowdown")
        (,THREE-QUARTERS-FLAT . "accidentals.mirroredflat.flat")
        (,DOUBLE-SLASH-FLAT . "accidentals.flat.slashslash")
        (,DOUBLE-FLAT  . "accidentals.flatflat")
        (,FLAT-FLAT  . "accidentals.flatflat")
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
    \override KeySignature #'glyph-name-alist = \accidentalGlyphs
    \override Accidental #'glyph-name-alist = \accidentalGlyphs
    \override AccidentalCautionary #'glyph-name-alist = \accidentalGlyphs
    \override TrillPitchAccidental #'glyph-name-alist = \accidentalGlyphs
    \override AmbitusAccidental #'glyph-name-alist = \accidentalGlyphs
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
      \musicglyph #"accidentals.flat"
      \musicglyph #"accidentals.flat"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

naturalsharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
   \natural\sharp
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.25
}

sharpsharp = {
  \once \override Accidental.stencil = #ly:text-interface::print
  \once \override Accidental.text = \markup {
    \concat {
      \musicglyph #"accidentals.sharp"\hspace #0.05
      \musicglyph #"accidentals.sharp"
    }
  }
  \once \override Staff.AccidentalPlacement #'right-padding = #1.2
}



{
  %\flatflatflat
  %ceseses'
 % \sharpsharp
  %cisis'
  %cfk
  cisis'
  ees'
  es'
}

