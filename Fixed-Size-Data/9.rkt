;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))


(define in #false)


(if (string? in) (string-length in)
    (if (image? in) (* (image-width in) (image-height in))
        (if (boolean? in)
            (if in 10 20)
            (if (<= in 0) (* -1 in) (- in 1)))))