\version "2.20.0"
data = \new Staff{
    \relative {
    \time 4/4
    {g'4 g8 e c4 g}
    {d'8 e f g e4 c}
    {d g, d' g,}
    {d'8 e f g e4 c}
    {g'4 g8 e c4 g}
    {d'8 e f g e4 c} 
    {f8 f f f e4 e8 e}
    {g f e d c2 }
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