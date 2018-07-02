;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))


(define (string-delete str i)
  (string-append (substring str 0 i)
                 (substring str (add1 i))))


(string-delete "julio" 0)
(string-delete "julio" 1)
(string-delete "julio" 2)
(string-delete "julio" 3)
(string-delete "julio" 4)