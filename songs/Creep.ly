\version "2.20.0"
data = \new Staff{
    \relative {
    \time 4/4
    {g8 d' g d g b4 g8 }
    {d' b g b4 d8 b4}
    {b8 ges' ees' b ges ees'4 ees8}
    {e4}
  }
}
\score {  
  \data
  \layout {}
}
\score {
  \unfoldRepeats \data
  \midi {}
}