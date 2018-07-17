;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |61|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


(define RED 0)
(define GREEN 1)
(define YELLOW 2)
 
; An S-TrafficLight is one of:
; – RED
; – GREEN
; – YELLOW


; S-TrafficLight -> S-TrafficLight
; yields the next state, given current state cs
; (check-expect (tl-next- ... RED) YELLOW)
; (check-expect (tl-next- ... YELLOW) GREEN)

; (define (tl-next-numeric cs)
;   (modulo (+ cs 1) 3))
	
; (define (tl-next-symbolic cs)
;   (cond
;     [(equal? cs RED) GREEN]
;     [(equal? cs GREEN) YELLOW]
;     [(equal? cs YELLOW) RED]))


; Which of the two is properly designed using the recipe for itemization?
; tl-next-symbolic

;  Which of the two continues to work if you change the constants to the following?
;    (define RED "red")
;    (define GREEN "green")
;    (define YELLOW "yellow")
; tl-next-symbolic