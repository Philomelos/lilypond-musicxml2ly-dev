\version "2.17.95"
koron = \markup {\override #'(thickness . 1.75)
  \draw-line #'(0 . 2.25)
 \hspace #-1.18 \raise #1.3  \rotate #30 \magnify #0.5 { \override #'(thickness . 0.15)\triangle ##f}
}

sori = \markup {
  \override #'(thickness . 1.75)
  \draw-line #'(0 . 2.5)\hspace #-0.25
  \override #'(thickness . 1.75)
  \raise #0.2 \draw-line #'(0 . 2.5)
  \hspace #-1.8 \raise #0.4 \fontsize #3 >
}

\markup { 
  \koron
  \sori
}

