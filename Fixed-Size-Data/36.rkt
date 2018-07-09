;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |36|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;; Image -> Number
;; counts the number of pixels in a image
;; Examples:
;;     (square 10 "solid" "red") -> 100
;;     (rectangle 5 10 "solid" "red") -> 50
(define (image-area img)
  (* (image-width img) (image-height img)))


(image-area (square 10 "solid" "red"))
(image-area (rectangle 5 10 "solid" "red"))