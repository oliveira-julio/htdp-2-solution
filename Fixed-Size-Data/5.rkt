;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


(define image-scale 50)

(define green-circle (circle image-scale "solid" "green"))


(define union-two-circles
  (overlay/xy green-circle
              image-scale
              0
              green-circle))


(define veen
  (overlay/xy union-two-circles
              (/ image-scale 2)
              (- image-scale)
              green-circle))


(define brown-rectangle (rectangle (/ image-scale 5) (* 2 image-scale) "solid" "brown"))


(define tree
  (overlay/xy veen
              (* 1.39 image-scale)
              (* 2.75 image-scale)
              brown-rectangle))

tree