#lang racket/base
(require "../wiringpi.rkt")

;; pin definitions
;; these refer to physical pin numbers on the GPIO header

(define LED1 7) 
(define LED2 11)
(define LED3 12)
(define LED4 13)
(define LED5 15)
(define LED6 16)
(define LED7 18)
(define LED8 22)
(define LED9 8)

(define LEDS '(7 11 12 13 15
	16 18 22 8))
(define GREEN-LEDS '(12 13))
(define RED-LEDS '(7 22))
(define YELLOW-LEDS '(11 15))
(define WHITE-LEDS '(16 8))
(define BLUE-LED 18)

(define RED-BUTTON 21)
(define GREEN-BUTTON 19)
(define YELLOW-BUTTON 24)
(define BLUE-BUTTON 26)

(define BUTTONS '(21 19 24 26))

(define (setup-pi-die)
	(wiringPiSetupPhys)	
	(map (lambda (led) (pinMode led OUTPUT)) LEDS)
	(map (lambda (button) 
	     (pinMode button INPUT)
	     (pullUpDnControl button PUD_UP)) BUTTONS))


(define (flash-LED led)
	(digitalWrite led LOW)
	(sleep 0.5)
	(digitalWrite led HIGH)
	(sleep 0.5))

			
(define (test-LEDs)
	(map (lambda (led) (flash-LED led)) LEDS) ; flash each in turn 
	(map (lambda (led) (digitalWrite led HIGH)) LEDS)) ; turn them all off


(define (button-pressed? button)
	(= 0 (digitalRead button)))

(define (test-buttons)
	(cond 
	      [(button-pressed? RED-BUTTON)
	      	(map (lambda (led) (flash-LED led)) RED-LEDS)]
	      [(button-pressed? BLUE-BUTTON)	
		(flash-LED BLUE-LED)]
	      [(button-pressed? GREEN-BUTTON)
	        (map (lambda (led) (flash-LED led)) GREEN-LEDS)]
	      [(button-pressed? YELLOW-BUTTON)
	        (map (lambda (led) (flash-LED led)) YELLOW-LEDS)]	      
	      [else (map (lambda (led) (digitalWrite led HIGH)) LEDS)]) ; turn them all off
	      (test-buttons))

;; and run
(setup-pi-die)
(test-LEDs)
(test-buttons)	

