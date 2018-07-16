;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |47|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


; HappinessGaugeState is a number
; inter. the level of happy used in a gauge
; in %


; constants
(define MAX-GAUGE-% 1)
(define MIN-GAUGE-% 0)
(define DECREASE-PER-TICK-% -0.01)

(define UP-ARROW-INCREASE-% (* MAX-GAUGE-% 1/3))
(define DOWN-ARROW-INCREASE-% (* MAX-GAUGE-% 1/5))

(define BAR-GAUGE-HEIGHT 100)
(define BAR-GAUGE-WIDTH 20)
(define BAR-GAUGE-BORDER-COLOR "red")
(define BAR-GAUGE-WITHIN-COLOR "white")
(define BAR-GAUGE-FULL-COLOR "blue")

(define BAR-GAUGE-BORDER
  (rectangle (+ BAR-GAUGE-WIDTH 5)
             (+ BAR-GAUGE-HEIGHT 10)
             "solid"
             BAR-GAUGE-BORDER-COLOR))

(define BAR-GAUGE-WITHIN
  (rectangle BAR-GAUGE-WIDTH
             BAR-GAUGE-HEIGHT
             "solid"
             BAR-GAUGE-WITHIN-COLOR))


; functions


; HappinessGaugeState  Number -> HapinnessGaugeState
; control if hgs is between 0 and 100
(check-expect (control-gauge-level 1 0.1) 1)
(check-expect (control-gauge-level 0 -0.1) 0)
(check-expect (control-gauge-level 0.5 0.1) 0.6)
(define (control-gauge-level hgs number)
  (cond [(<= (+ hgs number) 0) 0]
        [(>= (+ hgs number) 1) 1]
        [else (+ hgs number)]))

; HappinessGaugeState -> Image
; produces a rectangle which is the part full
; of the Bar Gauge
(check-expect (bar-gauge-full 0) (empty-scene BAR-GAUGE-WIDTH 0))
(check-expect (bar-gauge-full 0.5)
              (rectangle BAR-GAUGE-WIDTH
                         (/ BAR-GAUGE-HEIGHT 2)
                         "solid"
                         BAR-GAUGE-FULL-COLOR))
(check-expect (bar-gauge-full 1)
              (rectangle BAR-GAUGE-WIDTH
                         BAR-GAUGE-HEIGHT
                         "solid"
                         BAR-GAUGE-FULL-COLOR))
(define (bar-gauge-full hgs)
  (rectangle BAR-GAUGE-WIDTH
             (* BAR-GAUGE-HEIGHT hgs)
             "solid"
             BAR-GAUGE-FULL-COLOR))

; HappinessGaugeState -> Image
; produces the Bar Gauge with the full part
(check-expect (bar-gauge 0) (underlay BAR-GAUGE-BORDER BAR-GAUGE-WITHIN))
(check-expect (bar-gauge 0.5)
              (underlay BAR-GAUGE-BORDER
                       (underlay/align "middle" "bottom"
                                      BAR-GAUGE-WITHIN
                                      (bar-gauge-full 0.5))))
(define (bar-gauge hgs)
  (underlay BAR-GAUGE-BORDER
                       (underlay/align "middle" "bottom"
                                      BAR-GAUGE-WITHIN
                                      (bar-gauge-full hgs))))


; HappinessGaugeState -> HappinessGaugeState
; decreases the happiness gauge % for each clock tick
(check-expect (tock 0) 0)
(check-expect (tock 0.05) (control-gauge-level 0.05 DECREASE-PER-TICK-%))
(define (tock hgs)
  (control-gauge-level hgs DECREASE-PER-TICK-%))


; HappinessGaugeState Key -> HappinessGaugeState
; increases the happiness gauge based on key pressed
(check-expect (key-control 0.5 "up") (+ 0.5 UP-ARROW-INCREASE-%))
(check-expect (key-control 0.5 "down") (+ 0.5 DOWN-ARROW-INCREASE-%))
(check-expect (key-control 0.5 "left") 0.5)
(define (key-control hgs key)
  (cond [(string=? key "up") (control-gauge-level hgs UP-ARROW-INCREASE-%)]
        [(string=? key "down") (control-gauge-level hgs DOWN-ARROW-INCREASE-%)]
        [else hgs]))


(define (main hgs)
  (big-bang hgs
    [to-draw bar-gauge]
    [on-tick tock]
    [on-key key-control]))

(main MAX-GAUGE-%)