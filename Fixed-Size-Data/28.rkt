;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

;; good
(define average-attendees-$5 120)
(define fixed-cost 180)
(define cost-per-attend 0.04)
(define attendees-deviante-per-$0.1 15)

(define (attendees ticket-price)
  (- average-attendees-$5
     (* (- ticket-price 5.0)
        (/ attendees-deviante-per-$0.1 0.1))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* cost-per-attend (attendees ticket-price))))

(define (profit-good ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))


;; bad
(define (profit-bad price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))


(profit-good 5)
(profit-bad 5)

(profit-good 4)
(profit-bad 4)

(profit-good 3)
(profit-bad 3)

(profit-good 2)
(profit-bad 2)

(profit-good 1)
(profit-bad 1)

;; max ticket = 3