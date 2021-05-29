\version "2.22.0"
\header {
  title = "Knockin on heaven door's"
  composer = ""
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}


global = {
  \key c \major
  \time 4/4
}

bassLine = \relative c {
  {ges2 f ees4~ees8. ees16 ees8 ees8  ees4}
}

intro  = {\bassLine}

song = {
  \intro
}

\score {
  <<
  \new Staff \with {
    midiInstrument = "electric bass (finger)"
    instrumentName = "Basse électrique"
  } { \clef "bass_8" \song }
      \new Staff { \clef "bass" c,,4 }
  >>
  
  \layout { }
}
\score {
  \unfoldRepeats \song
  \midi {
    \tempo 4=80
  }
}


