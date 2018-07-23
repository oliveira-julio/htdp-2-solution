;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |72|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


(define-struct phone# [area switch num])
; A phone# is a struct:
;   (make-phone# String String String)
; interpretation (make-phone# area switch num) means a phone
; area is ["000", "001", ..., "999"] means the area code,
; switch is ["000", "001", ..., "999"] means the code switch of your neighborhood,
; num is ["0000", "0001", ..., "9999"] means the phone in neighborhood.
