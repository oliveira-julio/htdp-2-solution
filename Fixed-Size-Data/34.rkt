;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |34|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;; String -> String
;; extracts the first caracter from a non-empty string
;; Examples:
;;     "hello world!" -> "h"
;;     "0123456789" -> "0"
;;     "julio" -> "j"
(define (string-first str)
  (substring str 0 1))

(string-first "hello world!")
(string-first "0123456789")
(string-first "julio")