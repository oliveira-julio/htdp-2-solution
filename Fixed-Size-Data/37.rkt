;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |37|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;; String -> String
;; produces a string like the given one with the first character removed
;; Examples:
;;     "hello world!" -> "hello world!"
;;     "0123456789" -> "123456789"
;;     "julio" -> "ulio"
(define (string-rest str)
  (substring str 1))



(string-rest "hello world!")
(string-rest "0123456789")
(string-rest "julio")