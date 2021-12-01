\include "color.ly"

%%%% USAGE EXAMPLE %%%%

song =
\relative f' {
  e8 e e4 e8 e e4
  e8 g c, d e2
  f8 f f4 e8 e e4
  d8 d d e d4 g
}


\markup\italic "Vive le vent"
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

