#lang racket/base
(require "../wiringpi.rkt")

(define (test-LEDs)
	(wiringPiSetupPhys)
	(pinMode 7 OUTPUT)
	(digitalWrite 7 LOW))
	
(define (hello)
	"HELLO")

