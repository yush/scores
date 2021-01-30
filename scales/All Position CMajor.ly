\version "2.20.0"

% Source: https://www.jazzguitarlessons.net/blog/definitive-guide-scale-positions-jazz-guitar

% Helper function to invert first elements of scales
#(define (inverted num mod)
   (if (zero? (modulo num mod))
       (list '1 'inverted)
       (list (1+ (modulo num mod)))))

% Expand the (string fret) pairs to valid lilypond syntax
#(define (fret-from-list l1 l2 n1)
   (if  (null? l1)
        l2
        (fret-from-list (cdr l1) (append l2 (list (append '(place-fret) (car l1) (inverted (length l2) n1)))) n1)))

% arg1 is the list of (string fret) pairs making up the scale
% arg2 is the number of unique tones in the scale (i.e. 7 for major scale, 5 for pentatonic)
% arg3 is a scale factor used to enlarge the fret diagram
#(define-markup-command (scale-diagramm layout props arg1 arg2 arg3) (list? integer? number?)
   (interpret-markup layout props
     (markup
      (#:override (cons 'size arg3 )
        (#:override '(fret-diagram-details
                      . (
                          (finger-code . in-dot)
                          (number-type . arabic)
                          (label-dir   . -1)
                          (orientation . landscape)
                          (dot-radius  . 0.4)
                          (fret-count  . 8)
                          (top-fret-thickness . 7)))
          #:fret-diagram-verbose
          (fret-from-list arg1 '() arg2))))))


cmajor_posSixFour=\markup\scale-diagramm #'((6 8) (5 5) (5 7) (5 8) (4 5) (4 7) (4 9)
                                             (3 5) (3 7) (2 5) (2 6) (2 8) (1 5) (1 7) (1 8)) #7 #2.0

cmajor_posFiveFour=\markup\scale-diagramm #'((6 15) (5 12) (5 14) (5 15) (4 12) (4 14) (3 12)
                                              (3 14) (2 12) (2 13) (2 15) (1 12) (1 13) (1 15)) #7 #2.0

cmajor_posSixTwo=\markup\scale-diagramm #'((6 8) (6 10) (5 7) (5 8) (5 10) (4 7) (4 9)
                                              (4 10) (3 7) (3 9) (3 10) (2 8) (2 10) (1 7) (1 8) ) #7 #2.0

cmajor_posFiveTwo=\markup\scale-diagramm #'((5 3) (5 5) (4 2) (4 3) (4 5)
                                              (3 2) (3 4) (3 5) (2 3) (2 5) (2 6) (1 3) (1 5) (1 7)) #7 #2.0

cmajor_posSixOne=\markup\scale-diagramm #'((6 8) (6 10) (6 12) (5 8) (5 10) (5 12) (4 9)
                                              (4 10) (4 12) (3 9) (3 10) (2 8) (2 10) (2 12) (1 8) ) #7 #2.0

cmajor_posFiveOne=\markup\scale-diagramm #'((5 3) (5 5) (5 7) (4 3) (4 5) (4 7) (3 4)
                                              (3 5) (2 3) (2 5) (2 6) (1 3) (1 5) (1 7) ) #7 #2.0

cmajor_posFourOne=\markup\scale-diagramm #'((4 10) (4 12)
                                              (4 14) (3 10) (3 12) (2 10) (2 12) (2 13) (1 10) (1 12) (1 13)) #7 #2.0

global = {
  \key c \major
  \time 4/4
}

\header {
  title = "Positions de C Majeur"
}

\book { 
  \score {
    <<
      \new TabStaff \relative {c \mark "6-4" d e f g a b c d e f g a b c2}
      \set TabStaff.minimumFret = 5
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posSixFour d e f g a b c d e f-1 g a b c r}

    >>
  }


  \score {
    <<
      \new TabStaff \relative { c'4\5 \mark "5-4" d\4 e f g a b c d e f g r1}
      \set TabStaff.minimumFret = 12
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posFiveFour d e f g a b c d e f-1 g a b c r}
    >>
    \layout { }
  }
  
  \score {
    <<
      \new TabStaff \relative { c4 \mark "6-2" d e f g a b c d e f g a b c2 }
      \set TabStaff.minimumFret = 7
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posSixTwo d e f g a b c d e f-1 g a b c r}
    >>
    \layout { }
  }
  
  
  \score {
    <<
      \new TabStaff \relative { c4 \mark "5-2" d e f g a b c d e f g a b r2 }
      \set TabStaff.minimumFret = 2
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posFiveTwo d e f g a b c d e f-1 g a b c r}
    >>
    \layout { }
  }
  
  \score {
    <<
      \new TabStaff \relative { c4 \mark "6-1" d e f g a b c d e f g a b c2 }
      \set TabStaff.minimumFret = 8	
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posSixOne d e f g a b c d e f-1 g a b c r}
    >>
    \layout { }
  }
  
  \score {
    <<
      \new TabStaff \relative { c4 \mark "5-1" d e f g a b c d\mark "D a voir" e f g a b c2 }
      \set TabStaff.minimumFret = 3
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posFiveOne d e f g a b c d e f-1 g a b c r}
    >>
    \layout { }
  }

  \score {
    <<
      \new TabStaff \relative { c'4 \mark "4-1" d e f g a b c d e f2 }
      \set TabStaff.minimumFret = 10
      \set TabStaff.restrainOpenStrings = ##t
      \relative {c'4^\cmajor_posFourOne d e f g a b c d e f-1 g a b c r}
    >>
    \layout { }
  }
}

