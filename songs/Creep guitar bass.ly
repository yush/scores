\version "2.20.0"
\header {
  title = "Creep"
}

verse = 
    \relative {
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
  
bassVerse = \relative {
  {e4 e8. e16 e8 e r4}
  {e4 e8. e16 e8 e r4}
  
}

song = \repeat volta 3 { \verse }
\score {  
  <<
    \new StaffGroup <<
      \new Staff = "guitar" \with { instrumentName = "Guitar" midiInstrument = "electric grand" }
      \verse
      \new Staff = "bass" \with { instrumentName = "Bass" midiInstrument = "electric bass (finger)" }
      \bassVerse
    >>
  >>
  \layout {}
  \midi {}
}