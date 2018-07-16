;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |58|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

; data definition

; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item


; constants

(define MAX-INEXPENSIVE-ITEM-PRICE 1000)
(define INEXPENSIVE-ITEM-TAX 0)
(define MIN-LUXURY-ITEM-PRICE 10000)
(define LUXURY-ITEM-TAX 0.08)
(define BETWEEN-INEXPENSIVE-LUXURY-ITEM-TAX 0.05)



;functions

; Price -> Number
; computes the amount of tax charged for p
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p MAX-INEXPENSIVE-ITEM-PRICE)) 0]
    [(and (<= MAX-INEXPENSIVE-ITEM-PRICE p)
          (< p MIN-LUXURY-ITEM-PRICE))
     (* BETWEEN-INEXPENSIVE-LUXURY-ITEM-TAX p)]
    [(>= p MIN-LUXURY-ITEM-PRICE) (* LUXURY-ITEM-TAX p)]))

