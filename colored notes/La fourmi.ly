\include "color.ly"

%%%% USAGE EXAMPLE %%%%

song =
\relative f' {
  c4 e g2 a8 b c a g2 
  f4 f e e d d e2
  c4 e g2 a8 b c a g2 
  f4 f e e8 e d4 g c,2
}

\markup\italic "La fourmi"
\new Staff
\with {
  \override NoteHead.layer = #2
  \override NoteHead.before-line-breaking = #(coloredNoteHeads #f headContourSize)
  \override NoteHead.font-size = #noteSize
}
{ \song }
\layout {
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/64)
  }
}

%%% LSR workaround
\markup\vspace #0.5

