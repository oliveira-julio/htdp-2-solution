;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |35|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;; String -> String
;; extracts the last caracter from a non-empty string
;; Examples:
;;     "hello world!" -> "!"
;;     "0123456789" -> "9"
;;     "julio" -> "o"
(define (string-last str)
  (substring str
             (sub1 (string-length str))))



(string-last "hello world!")
(string-last "0123456789")
(string-last "julio")