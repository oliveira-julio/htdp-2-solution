;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |62|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")
; A DoorState is one of:
; – LOCKED
; – CLOSED
; – OPEN



; DoorState -> DoorState
; closes an open door over the period of one tick
(check-expect (door-closer LOCKED) LOCKED)
(check-expect (door-closer CLOSED) CLOSED)
(check-expect (door-closer OPEN) CLOSED)
(define (door-closer ds)
  (cond
    [(string=? OPEN ds) CLOSED]
    [else ds]))


; DoorState Key -> DoorState
; turns key event k into an action on state s
(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action OPEN "-") OPEN)
(define (door-action ds k)
  (cond
    [(and (string=? LOCKED ds) (string=? k "u")) CLOSED]
    [(and (string=? CLOSED ds) (string=? k " ")) OPEN]
    [(and (string=? CLOSED ds) (string=? k "l")) LOCKED]
    [else ds]))


; DoorState -> Image
; translates the state s into a large text image
(check-expect (door-render LOCKED) (text LOCKED 40 "red"))
(define (door-render ds)
  (text ds 40 "red"))


(define (door-simulation ds)
  (big-bang ds
    [to-draw door-render]
    [on-tick door-closer 3]
    [on-key door-action]))

(door-simulation LOCKED)