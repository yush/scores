\version "2.20.0"
\header {
  title = "Creep"
}
<<<<<<< HEAD

verse = \new Staff{
    \tempo 4 = 90 
    \relative {
=======
verseGuitar = \new Staff{
  \relative {
>>>>>>> f469b903552b55e769a1a6adcbf5466c7f98aaf2
    \time 4/4
    {g8 d' g d g b4 g8 }
    {d' b g b4 d8 b4  }
    {b8 ges' ees' b ges ees' b ges }
    {e'4~e8  ees4 b8 ees4 }
    {c,8 g' e' c g e' c g }
    {f'4~f8  e4 c8 e4 }
    {c,8 ees' c      g ees' c g c}
    {c,8 ees' c g ees' c g c}
  }
}

<<<<<<< HEAD
song = \repeat volta 3 { \verse }
\score {  
  \song
=======
verseBass = \new Staff{
  \relative {
    \time 4/4
    {g4 g8~g16 g16 g8 g4 g8}
    {g4~g8~g16 g16 g8 g8~g4} 
  }
}

songGuitar = \repeat volta 2 { \verseGuitar }
songBass = { \verseBass }

\score {
  \songBass
>>>>>>> f469b903552b55e769a1a6adcbf5466c7f98aaf2
  \layout {}
}

\score {
<<<<<<< HEAD
  \unfoldRepeats \song 
=======
  \unfoldRepeats \songBass
>>>>>>> f469b903552b55e769a1a6adcbf5466c7f98aaf2
  \midi {}
}