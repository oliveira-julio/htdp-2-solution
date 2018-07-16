;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |51|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


; data definitions

; TrafficLight is of the following Strings:
; - "red"
; - "green"
; - "yellow"
; inter. the three string represent the three
; possible states that a traffic light may assume


; constants

(define TRAFFIC-LIGHT-CIRCLE-RADIUS 20)


; functions

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))


; TrafficLight -> Image
; render a circle with the color of TrafficLight
(check-expect (render "red") (circle TRAFFIC-LIGHT-CIRCLE-RADIUS "solid" "red"))
(define (render tl)
  (circle TRAFFIC-LIGHT-CIRCLE-RADIUS "solid" tl))


(define (main tl)
  (big-bang tl
    [to-draw render]
    [on-tick traffic-light-next 3]))


(main "red")