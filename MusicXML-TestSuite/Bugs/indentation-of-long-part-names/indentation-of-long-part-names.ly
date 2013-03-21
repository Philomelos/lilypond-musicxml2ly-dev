\relative c'' {
  <<
    \new StaffGroup <<  
      \new Staff \with {
        instrumentName = #"Alto Flute in G"
        shortInstrumentName = #"Flt."
      }
      {
        \repeat unfold 24 {f1}
      }
      \new Staff \with {
        instrumentName = #"Clarinet"
        shortInstrumentName = #"Clar."
      }
      {
        \repeat unfold 24 {c1}
      }
    >>  
  >>
}

%\layout {
%  indent = 3.0\cm
%  short-indent = 1.5\cm
%}