\version "2.20"
\paper{
  paper-width = 21\cm
  paper-height = 24\cm
  system-system-spacing = #'((basic-distance . 0.5) (padding . 10))
}
\layout {
  indent = 0.0
  \context {
    \TabStaff
    \remove "Time_signature_engraver"
  }
}


\new TabStaff 
{
  \time 4/4
  \set TabStaff.minimumFret = #5
  \set TabStaff.restrainOpenStrings = ##t
  \tabFullNotation
  \relative c {
  a8 \mark "araignée base" ais b c
  d dis e f
  g gis a ais
  bis cis d dis
  e eis fis g
  a ais b c
  }
  \break
  \relative c {
  a8 \mark "extension index" b c cis 
  d e f fis
  g  a ais b
  c d dis e\3
  e fis g gis
  a b c cis
  }
  \break
  \relative c {
  a8 \mark "extension auriculaire" ais b cis
  d dis e fis
  g gis  a b
  c cis d e\3
  e eis fis gis
  a ais b cis
  }
  
  \break
  \relative c {
    a8 ais b c cis
  d dis e f fis
  g gis  a ais b
  c cis d dis e\3
  e eis fis g gis
  a ais b c cis
  }

}