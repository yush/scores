\include "color.ly"

%%%% USAGE EXAMPLE %%%%

song =
\relative c' {
  f4 f8 f d4 d8 d 
  g8 g4 c, c8 d e
  f e f e d4. g8~g8 
  a g f e
  c d e
}

\markup\italic "Un éléphant qui se balançait"
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

\score {
  \unfoldRepeats \song
  \midi {
    \tempo 4=80
  }
}

%%% LSR workaround
\markup\vspace #0.5

