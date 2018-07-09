;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |38|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;; String -> String
;; produces a string like the given one with the last character removed.
;; Examples:
;;     "hello world!" -> "hello world"
;;     "0123456789" -> "012345678"
;;     "julio" -> "juli"
(define (string-remove-last str)
  (substring str
             0
             (sub1 (string-length str))))


(string-remove-last "hello world!")
(string-remove-last "0123456789")
(string-remove-last "julio")