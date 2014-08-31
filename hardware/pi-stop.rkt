#lang racket/base
(require "../wiringpi/wiringpi.rkt")
(require racket/port)
(require racket/system)
(provide (all-defined-out))

(define RED 7) ; Broadcom GPIO port numbers
(define YELLOW 8)
(define GREEN 25)
(define LEDS '(7 8 25))

;; gpio-call string -> string
;; call a gpio command

(define (gpio-call command)
  (with-output-to-string
    (lambda ()
      (system (string-append "gpio " command)))))

;; setup-gpio
;; set up the hardware using gpio command
;; (means can run as user other than root)
(define (setup-gpio)
  (begin
    (gpio-call "export 7 out")
    (gpio-call "export 8 out")
    (gpio-call "export 25 out")))
    
;; setup-pi-stop
;; call to set up the hardware
;; -> true
(define (setup-pi-stop)
  (displayln "Setup pi-stop")
  (setup-gpio)
  (wiringPiSetupSys)	
  (map (lambda (led) (digitalWrite led LOW)) LEDS))

;; test-stop
;; flash each led in turn
(define (test-stop)
  (map (lambda (led)
	   (digitalWrite led LOW)) LEDS)
  (map (lambda (led)
	 (begin
	   (digitalWrite led HIGH)
	   (sleep 1)
	   (digitalWrite led LOW)
	   (sleep 1))) LEDS))

;; pi-stop-traffic : boolean boolean boolean ->
;; set the led states
(define (pi-stop-traffic r? y? g?)
  (if r? (digitalWrite RED HIGH) (digitalWrite RED LOW))
  (if y? (digitalWrite YELLOW HIGH) (digitalWrite YELLOW LOW))
  (if g? (digitalWrite GREEN HIGH) (digitalWrite GREEN LOW)))