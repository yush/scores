\version "2.20.0"
\header {
  title = "Creep"
}
verse = \new Staff{
    \relative {
    \time 4/4
    {g8 d' g d g b4 g8 }
    {d' b g b4. d8   }
    {b8 ges' ees' b ges ees' b ges }
    {e'4~e8  ees4 b8 ees4 }
    {c,8 g' e' c g e' c g }
    {f'4~f8  e4 c8 e4 }
    {c,8 ees' c      g ees' c g c}
    {c,8 ees' c g ees' c g c}
  }
}

song = \repeat volta 2 { \verse }
\score {  
  \song
  \layout {}
}
\score {
  \unfoldRepeats \song
  \midi {}
}