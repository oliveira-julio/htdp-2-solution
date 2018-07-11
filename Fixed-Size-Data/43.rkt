;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |43|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

; Data Definitions

; An WorldState is a number
; interpretation the number of pixels between the left margin
; and the right-most edge of the car.

; An AnimationState is a number
; interpertation the number of clock ticks
; since the animation started

; An Speed is a number
; interpretation the number of pixels of a car moves each tick


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

(define CAR-SPEED 3)
(define INIT-CAR-POSITION 0)
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


; WorldState Speed AnimationState -> WorldState
; determines the position of a car, given
; the initial position, speed and time
(check-expect (position 10 1 25) 35)
(check-expect (position 0 3 15) 45)
(define (position init speed time)
  (+ init (* speed time)))


; WorldState -> Number
; regulates the anchor point of car to right
(check-expect (CAR-anchor-point-right 0) (- 0 BODY-SIDE-TOP-WIDTH))
(check-expect (CAR-anchor-point-right 100) (- 100 BODY-SIDE-TOP-WIDTH))
(define (CAR-anchor-point-right ws)
  (- ws BODY-SIDE-TOP-WIDTH))


; AnimationState -> Image
; places the car in background image, given the WorldState(position)
(check-expect (render 0)
              (place-image CAR (position (CAR-anchor-point-right INIT-CAR-POSITION) CAR-SPEED 0) Y-CAR BACKGROUND))

(check-expect (render 100)
              (place-image CAR (position (CAR-anchor-point-right INIT-CAR-POSITION) CAR-SPEED 100) Y-CAR BACKGROUND))

(define (render as)
  (place-image CAR
               (position (CAR-anchor-point-right INIT-CAR-POSITION) CAR-SPEED as)
               Y-CAR
               BACKGROUND))


; WorldState -> Boolean
; determines if the car has disappared on the right side
; usign right side as anchor point
(check-expect (end? 540) (>= 540 (+ ROAD-WIDTH BODY-SIDE-BOTTOM-WIDTH)))
(check-expect (end? 500) #false)
(define (end? ws)
  (>= ws (+ ROAD-WIDTH BODY-SIDE-BOTTOM-WIDTH)))


; AnimationState -> AnimationState
; add 1 to the number of clocks ticks
; since the animation started
(check-expect (tock 0) 1)
(check-expect (tock 9) 10)
(define (tock as)
  (add1 as))


(animate render)