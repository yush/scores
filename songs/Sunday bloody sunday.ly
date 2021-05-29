\version "2.22.0"
\header {
  title = "Sunday bloody sunday"
  composer = ""
}


global = {
  \key c \major
  \time 4/4
}

% BASS
bassLineIntro = \relative c {
  {aes1 ges aes ges ges}
}

bassLineChorus = \relative c {
  bes16 bes bes aes bes4
  des16 des des bes des4
  ees16 ees ees des ees4
  ees16 ees ees des ees4
}

% GUITAR
guitarIntroOnly = \relative c'' {
  bes8 des f des
  aes des f des
  ges, des' ees des
  ges, des' ees des
}

guitarIntroWithBass = \relative c'' {
  <aes des f>1
  <ges des' ees>
  <aes des f>
  <ges des' ees>
  <ges des' ees>
}

guitarChorus = \relative c {
  
}

guitarBridge = relateve c {
  des8 aes4. b8 ges4.
  aes8 des4. r2  
}

intro  = {\bassLineIntro}
chorus = {\guitarIntroWithBass}

song = {
  <<
    \new Staff \with {
      midiInstrument = "acoustic grand"
      instrumentName = "guitar"
    } 
    {
      \voiceOne
      \repeat volta 4 \guitarIntroOnly
      \chorus 
    }
    \new Staff \with {
      midiInstrument = "electric bass (pick)"
      instrumentName = "bass"
    } { 
      \clef "bass" 
      \voiceTwo
      \repeat volta 4 {r1 r}
      \bassLineIntro
      \bassLineChorus
    }
  >>

}

\score {
  \song
  
  \layout { }
}
\score {
  \unfoldRepeats \song
  \midi {
    \tempo 4=80
  }
}


