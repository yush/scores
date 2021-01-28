\version "2.20.0"
data = \new Staff{
    \relative {
    \time 4/4
    \tempo 130
    {gis8 gis gis fis4 gis16 a gis}
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