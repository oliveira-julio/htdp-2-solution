;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |39|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

; Physical constants
(define WHELL-RADIUS 20) ;; point of control
(define WHELL (circle WHELL-RADIUS "solid" "black"))

(define BODY-SIDE-BOTTOM-WIDTH (* 8 WHELL-RADIUS))
(define BODY-SIDE-BOTTOM-HEIGHT (* 2.5 WHELL-RADIUS))

(define BODY-SIDE-TOP-WIDTH (* 4 WHELL-RADIUS))
(define BODY-SIDE-TOP-HEIGHT (* 2 WHELL-RADIUS))


; Graphical constants
(define BODY-SIDE-BOTTOM (rectangle BODY-SIDE-BOTTOM-WIDTH
                                    BODY-SIDE-BOTTOM-HEIGHT
                                    "solid"
                                    "red"))


(define BODY-SIDE-TOP (rectangle BODY-SIDE-TOP-WIDTH
                                 BODY-SIDE-TOP-HEIGHT
                                 "solid"
                                 "red"))

(define BODY-SIDE-FULL (overlay/xy BODY-SIDE-BOTTOM
                                   (* BODY-SIDE-TOP-WIDTH 0.7) (- BODY-SIDE-TOP-HEIGHT)
                                   BODY-SIDE-TOP))


(define CAR (underlay/xy (underlay/xy BODY-SIDE-FULL
                                      (* 0.6 BODY-SIDE-BOTTOM-WIDTH) (+ BODY-SIDE-BOTTOM-HEIGHT WHELL-RADIUS)
                                      WHELL)
                         (* 0.1 BODY-SIDE-BOTTOM-WIDTH) (+ BODY-SIDE-BOTTOM-HEIGHT WHELL-RADIUS)
                         WHELL))

CAR