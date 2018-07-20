;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |66|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


(define-struct movie [title producer year])
(define-struct person [name hair eyes phone])
(define-struct pet [name number])
(define-struct CD [artist title price])
(define-struct sweater [material size producer])



(define a-quiet-place (make-movie "a quiet place" "Michael Bay" 2018))
(define julio (make-person "Julio Oliveira" "kinky" "brown" "00000-0000"))
(define dog (make-pet "costelinha" "0"))
(define the-dark-side-of-the-moon (make-CD "pink floyd" "The dark side of the moon" 100000000000))
(define sw (make-sweater "something" "M" "someone"))