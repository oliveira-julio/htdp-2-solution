;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |30|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))


(define PEOPLE-TICKET=$5 120)
(define COST-PER-PEOPLE 1.5)
(define 15-PEOPLE-FOR-EVERY-$0.1 (/ 15 0.1))

(define (attendees ticket-price)
  (- PEOPLE-TICKET=$5
     (* (- ticket-price 5.0)
        15-PEOPLE-FOR-EVERY-$0.1)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* COST-PER-PEOPLE (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 5)
(profit 4)
(profit 3)
(profit 2)
(profit 1)