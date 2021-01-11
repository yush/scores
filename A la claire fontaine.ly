\version "2.20.0"
data = \new Staff{
    \relative {
    \time 4/4
    \repeat volta 2 {c' c8 e e d e d }
    %{r4 e4 e8 d c e g e }
    %{g4 g8 e c e d}
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