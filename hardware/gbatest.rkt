#lang racket/base
(require ffi/unsafe)
(require "../wiringpi/wiringpi.rkt")

;; wire GBA link cable SI to MOSI, SO to MISO, SC to SCLK, and SD to ground

(define SPICHANNEL 0)
(define CLOCKSPEED 100000)

(displayln "Looking for GBA")

(define spi-handle (wiringPiSPISetupMode SPICHANNEL CLOCKSPEED 3))

(define buf-type (_array _uint8 4))
(define buf (ptr-ref (malloc buf-type) buf-type 0))

(define (array-cpy! arr index data)
  (if (null? data) '()
    (begin
      (array-set! arr index (car data))
      (array-cpy! arr (+ index 1) (cdr data)))))

(define (array-cmp arr index data)
  (if (null? data) #t
    (if (eq? (array-ref arr index) (car data))
      (array-cmp arr (+ index 1) (cdr data))
      #f)))

(define (wait-for-gba)
  (array-cpy! buf 0 '(#x00 #x00 #x62 #x02))

  (wiringPiSPIDataRW SPICHANNEL (array-ptr buf) 4)
  (displayln (format 
    "got: 0x~x 0x~x 0x~x 0x~x"
    (array-ref buf 0)
    (array-ref buf 1)
    (array-ref buf 2)
    (array-ref buf 3)))

  (sleep .0001)

  (if (array-cmp buf 0 '(#x72 #x02 #x62 #x02))
    (displayln "Found GBA!")
    (wait-for-gba)))

(wait-for-gba)