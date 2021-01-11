\version "2.20.0"
data = \new Staff{
    \relative {
    \time 4/4
    {c' c8 e e d e d }
    {c4 c8 e e d e4 }
    {e4 e8 d c e g e }
    {g4 g8 e c e d4}
    {c c8 e e d16 c e8 c}
    {e4 e8 d16 c e8 d c4}
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