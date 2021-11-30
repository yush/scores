\include "color.ly"

%%%% USAGE EXAMPLE %%%%

song =
\relative f' {
  c4 c8 e e d e c
  c4 c8 e e d e4
  e4 e8 d c e g e
  g4 g8 e c e d4
  c4 c8 e e d c e 
  c e e d c e d c
}

\markup\italic "A la claire fontaine"
\new Staff
\with {
  \override NoteHead.layer = #2
  \override NoteHead.font-size = #noteSize
  \override NoteHead.before-line-breaking = #(coloredNoteHeads #f headContourSize)
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

