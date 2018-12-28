#lang info
(define collection "wiringpi")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/wiringpi.scrbl" ())))
(define pkg-desc "A Racket interface to the Wiringpi library")
(define version "0.1")
(define pkg-authors '(stevel))
