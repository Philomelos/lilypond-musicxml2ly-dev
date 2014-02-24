
\version "2.18.0"
% automatically converted by musicxml2ly from V:/Software/lilypond-musicxml2ly-dev/MusicXML-TestSuite/Bugs/expressive_marks_and_beams/expressive_marks_and_manual_beams.xml

\header {
  texidoc = "
                musicxml2ly places expressive marks such as breath marks, 
                dynamics, fermatas... within manual beam brackets which 
                all cause fatal errors during compilation.
                Temporary workaround: use musicxml2ly command line option 
                --nb or --no-beaming.
            "
}

\layout {
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartOneVoiceNone =  \relative c' {
  c2 [ e2 \arpeggio ]
}


% The score definition
\score {
  <<
    \new Staff <<
      \context Staff <<
        \context Voice = "PartOneVoiceNone" { \PartOneVoiceNone }
      >>
    >>

  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  %  \midi {}
}

