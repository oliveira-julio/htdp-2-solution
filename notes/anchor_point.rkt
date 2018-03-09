;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname anchor_point) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;; image have a implicit anchor point.
;; anchor point is a point to orient the image.
;; the anchor point is the point in middle of image.

;; when we call a function like overlay, we dealing with the anchor point, and not with the attr of image

;; Example:
;; we a have a rectangle red, and a small blue
(define r-rectangle (rectangle 100 100 "solid" "red"))
(define b-rectangle (rectangle 50 50 "solid" "blue"))


;; so if we overlay
(overlay b-rectangle r-rectangle)
;; the anchor points of the two overlaps



;; we can overlay the images with modifiers, moving the anchor point
;; we can move using pixels
(overlay/xy b-rectangle 50 50 r-rectangle)


;; or using strings positions
(overlay/align "right" "top" b-rectangle r-rectangle)