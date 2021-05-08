\version "2.22.0"
\include "articulate.ly"

global = {
  \key c \major
  \time 4/4
}

bassLine = \relative c {
  \global
  % En avant la musique !
    \time 4/4
    {g4 g8~g16 g16 g8 g4 g8}
    {g4~g8~g16 g16 g8 g8~g4}  
    {b4 b8~b16 b16 b8 b4 b8}
    {b4~b8~b16 b16 b8 b8~b4} 
    {c4 c8~c16 c16 c8 c4 c8}
    {c4~c8~c16 c16 c8 c8~c4}
    {c4 c8~c16 c16 c8 c4 c8}
    {c4 d ees f}    
}

intro  = {\bassLine}
verse = {\repeat volta 2 {\bassLine}}

song = {\intro \verse}

\score {
  \new Staff \with {
    midiInstrument = "electric bass (finger)"
    instrumentName = "Basse électrique"
  } { \clef "bass_8" \song }
  \layout { }
}
\score {
  \unfoldRepeats \song
  \midi {
    \tempo 4=80
  }
}


