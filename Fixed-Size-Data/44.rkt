;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |44|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))



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
; CAR 
(define WHELL-RADIUS 5)
(define WHELL (circle WHELL-RADIUS "solid" "black"))
(define WHELL-COLOR "black")
(define CAR-BOTTOM-WIDTH (* 8 WHELL-RADIUS))
(define CAR-BOTTOM-HEIGHT (* 2.5 WHELL-RADIUS))
(define CAR-TOP-WIDTH (/ CAR-BOTTOM-WIDTH 2))
(define CAR-TOP-HEIGHT (* CAR-BOTTOM-HEIGHT 0.8))
(define CAR-SPEED 3)
(define (CAR-anchor-point-right point) (- point (/ CAR-BOTTOM-WIDTH 2)))
(define (CAR-anchor-point-bottom point)
  (- point
     (/ (+ CAR-BOTTOM-HEIGHT
           CAR-TOP-HEIGHT
           (* WHELL-RADIUS 2))
        2)))
(define CAR-COLOR "red")


; ROAD
(define ROAD-WIDTH 500)
(define ROAD-HEIGHT (* 16 WHELL-RADIUS))
(define X-CAR-ROAD-POSITION-INIT (CAR-anchor-point-right 0))
(define Y-CAR-ROAD-POSITION (CAR-anchor-point-bottom ROAD-HEIGHT))


; TREE
(define (TREE-anchor-point-bottom point) (- point 17.5))
(define Y-TREE-in-ground (TREE-anchor-point-bottom ROAD-HEIGHT))
(define X-TREE-in-BACKGROUND (* 0.4 ROAD-WIDTH))


; Graphical constants
(define ROAD
  (empty-scene ROAD-WIDTH ROAD-HEIGHT))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND
  (place-image TREE X-TREE-in-BACKGROUND Y-TREE-in-ground ROAD))


(define CAR-BOTTOM
  (rectangle CAR-BOTTOM-WIDTH
             CAR-BOTTOM-HEIGHT
             "solid"
             CAR-COLOR))

(define CAR-TOP
  (rectangle CAR-TOP-WIDTH
             CAR-TOP-HEIGHT
             "solid"
             CAR-COLOR))

(define WHELLS
  (overlay/xy WHELL (+ CAR-TOP-WIDTH WHELL-RADIUS) 0 WHELL))


(define CAR
  (above CAR-TOP CAR-BOTTOM WHELLS))


(place-image CAR
             X-CAR-ROAD-POSITION-INIT
             Y-CAR-ROAD-POSITION
             BACKGROUND)


;; functions


; AnimationState -> AnimationState
; add one to the numbers of clock ticks
; since the animation started
(check-expect (tock 0) 1)
(check-expect (tock 9) 10)
(define (tock as)
  (add1 as))


; AnimationState -> WorldState
; determines the position of the car,
; given the time passed since the animation started
(check-expect (position 10) (+ (* 10 CAR-SPEED) X-CAR-ROAD-POSITION-INIT))
(check-expect (position 1) (+ CAR-SPEED X-CAR-ROAD-POSITION-INIT))
(check-expect (position 0) X-CAR-ROAD-POSITION-INIT)
(define (position as)
  (+ (* as CAR-SPEED) X-CAR-ROAD-POSITION-INIT))


; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down"
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 0)
(check-expect (hyper 42 10 20 "move") 42)
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) 0];(CAR-anchor-point-right x-mouse)]
    [else x-position-of-car]))


; AnimationState -> Image
; produces a image of a car in a road,
; given the clock ticks passed since the animation started
(check-expect
 (render 0)
 (place-image CAR
              X-CAR-ROAD-POSITION-INIT
              Y-CAR-ROAD-POSITION
              BACKGROUND))
(check-expect
 (render 10)
 (place-image CAR
              (position 10)
              Y-CAR-ROAD-POSITION
              BACKGROUND))
(define (render as)
  (place-image CAR
               (position as)
               Y-CAR-ROAD-POSITION
               BACKGROUND))


(define (main as)
  (big-bang as
    [to-draw render]
    [on-mouse hyper]
    [on-tick tock]))


(main 0)