#lang racket/base

(provide (all-defined-out))

(require ffi/unsafe 
	 ffi/unsafe/define)
(define-ffi-definer define-wiringpi 
		    (ffi-lib "/home/pi/wiringPi/wiringPi/libwiringPi.so.2.0"))


(define-wiringpi wiringPiI2CSetup (_fun _int -> _int))
(define-wiringpi wiringPiI2CRead (_fun _int -> _int))
(define-wiringpi wiringPiI2CWrite (_fun _int _int -> _int))
(define-wiringpi wiringPiI2CWriteReg8 (_fun _int _int _int -> _int))
(define-wiringpi wiringPiI2CWriteReg16 (_fun _int _int _int -> _int))
(define-wiringpi wiringPiI2CReadReg8 (_fun _int _int -> _int))
(define-wiringpi wiringPiI2CReadReg16 (_fun _int _int -> _int))
(define-wiringpi wiringPiSetup (_fun -> _int))
(define-wiringpi pinMode (_fun _int _int -> _void))
(define-wiringpi digitalRead (_fun _int -> _int))
(define-wiringpi digitalWrite (_fun _int _int -> _void))

(define	INPUT       0)
(define	OUTPUT	    1)
(define	PWM_OUTPUT  2)
(define	GPIO_CLOCK  3)
(define	SOFT_PWM_OUTPUT	 4)

(define	LOW 0)
(define	HIGH 1)
