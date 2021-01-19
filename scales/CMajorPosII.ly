%% http://lsr.di.unimi.it/LSR/Item?id=790
%% see also http://lilypond.org/doc/v2.18/Documentation/notation/common-notation-for-fretted-strings

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LSR workaround:
#(set! paper-alist (cons '("snippet" . (cons (* 200 mm) (* 100 mm))) paper-alist))
\paper {
  #(set-paper-size "snippet")
  tagline = ##f
}

\markup\vspace #.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%here starts the snippet:

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


cmajor_posII=\markup\scale-diagramm #'((5 3) (5 5) (4 2) (4 3) (4 5) (3 2) (3 4) 
                                 (3 5) (2 3) (2 5) (2 6) (1 3) (1 5) (1 7) (1 8)) #7 #2.0


\layout {
  indent = 0
}

\relative c' {
  c-2   d^\cmajor_posII e f g^"c Ionic pos II"      a b c d e f-1 g a b c r
}
