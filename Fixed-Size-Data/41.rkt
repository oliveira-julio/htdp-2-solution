;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |41|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


; Physical constants
(define WHELL-RADIUS 5)
(define WHELL (circle WHELL-RADIUS "solid" "black"))

(define BODY-SIDE-BOTTOM-WIDTH (* 8 WHELL-RADIUS))
(define BODY-SIDE-BOTTOM-HEIGHT (* 2.5 WHELL-RADIUS))

(define BODY-SIDE-TOP-WIDTH (* 4 WHELL-RADIUS))
(define BODY-SIDE-TOP-HEIGHT (* 2 WHELL-RADIUS))


(define ROAD-WIDTH 500)
(define ROAD-HEIGHT (* 6 WHELL-RADIUS))

(define Y-CAR (* 3 WHELL-RADIUS))
(define Y-TREE (- ROAD-HEIGHT 17.5))

; Graphical constants
(define ROAD
  (empty-scene ROAD-WIDTH ROAD-HEIGHT))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND
  (place-image TREE (* 0.4 ROAD-WIDTH) Y-TREE ROAD))

(define BODY-SIDE-BOTTOM
  (rectangle BODY-SIDE-BOTTOM-WIDTH
             BODY-SIDE-BOTTOM-HEIGHT
             "solid"
             "red"))

(define BODY-SIDE-TOP
  (rectangle BODY-SIDE-TOP-WIDTH
             BODY-SIDE-TOP-HEIGHT
             "solid"
             "red"))

(define BODY-SIDE-FULL
  (overlay/xy BODY-SIDE-BOTTOM
              (* BODY-SIDE-TOP-WIDTH 0.7) (- BODY-SIDE-TOP-HEIGHT)
              BODY-SIDE-TOP))

(define CAR
  (underlay/xy
   (underlay/xy BODY-SIDE-FULL
                (* 0.6 BODY-SIDE-BOTTOM-WIDTH) (+ BODY-SIDE-BOTTOM-HEIGHT WHELL-RADIUS)
                WHELL)
   (* 0.1 BODY-SIDE-BOTTOM-WIDTH) (+ BODY-SIDE-BOTTOM-HEIGHT WHELL-RADIUS)
   WHELL))



; functions

; WorldState -> Image
; places the car in background image, given the WorldState(position)
(check-expect (render 0) (place-image CAR 0 Y-CAR BACKGROUND))
(check-expect (render 100) (place-image CAR 100 Y-CAR BACKGROUND))
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))


; WorldState -> Boolean
; determines if the car has disappared on the right side
(check-expect (end? 520) (>= 520 (+ ROAD-WIDTH (* 4 WHELL-RADIUS))))
(check-expect (end? 500) #false)
(define (end? ws)
  (>= ws (+ ROAD-WIDTH (* 4 WHELL-RADIUS))))


(define (tock ws)
  (+ ws 3))

(big-bang 20
  [to-draw render]
  [stop-when end?]
  [on-tick tock])