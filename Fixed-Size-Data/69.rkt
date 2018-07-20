;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |69|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


(define-struct movie [title producer year])
(define-struct person [name hair eyes phone])
(define-struct pet [name number])
(define-struct CD [artist title price])
(define-struct sweater [material size producer])


; | movie |
; ---------
; | title | producer      | year |
; --------------------------------
; | "GOT" | "Michael Bay" | 2018 |


; | person |
; ----------
; | name    | hair    | eyes    | phone        |
; ----------------------------------------------
; | "Julio" | "kinky" | "brown" | "00000-0000" |


; | pet |
; -------
; | name   | number |
; -------------------
; | "Auau" | 10     |


; | CD |
; ------
; | artist       | title      | price       |
; -------------------------------------------
; | "pink floyd" | "the wall" | 10000000.99 |


; | sweater |
; -----------
; | material    | size | producer  |
; ----------------------------------
; | "something" | "M"  | "someone" |

