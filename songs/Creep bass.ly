\version "2.22.0"
\include "articulate.ly"

global = {
  \key c \major
  \time 4/4
}

basePattern = \relative c {
  {g4 g8~g16 g16 g8 g4 g8}
  {g4~g8~g16 g16 g8 g8~g4}
  {b4 b8~b16 b16 b8 b4 b8}
  {b4~b8~b16 b16 b8 b8~b4}
  {c4 c8~c16 c16 c8 c4 c8}
  {c4~c8~c16 c16 c8 c8~c4}
}

bassLine = {
  \global
  % En avant la musique !
  \time 4/4
  \basePattern
  {c4 c8~c16 c16 c8 c4 c8}  
  {c4 d ees f}
}

ChorusBassLineEndA = {
  \basePattern
  {c4 c8~c16 c16 c8 c4 c8}  
  {c1}
}

ChorusBassLineEndB = {
  \basePattern
  {c1}
  {c}
}

OutroBass = {
  {g2~g4~g8 g8 g1}
  {b2~b4~b8 b8 b1}
  {c2~c4~c8 c8 c1}
  {c2~c4~c8 c8 c1}
}

intro  = {\bassLine}
verse = {\repeat volta 2 {\bassLine}}
chorusA = {\ChorusBassLineEndA}
chorusB = {\bassLine \ChorusBassLineEndA \ChorusBassLineEndB}
outro = {\repeat volta 2 \OutroBass}

song = {
  \intro
  \verse
  \chorusA
  \verse
  \chorusB
  \outro
}

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


