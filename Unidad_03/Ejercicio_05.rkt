#lang racket

; Ejercicio 05

(define a 1.2)
(define b 2.1)
(define c 4.7)

; (let
;  ([varName1 expresion1] [varName2 expresion2])
;  (body use localvars)
; )


; (+ (/ (* 7 a) b) (/ (* 3 a) b) (/ (* 7 a) b))
(let ([t1 (* 7 a)]
      [t2 (* 3 a)])
  (+ (/ t1 b)
     (/ t2 b)
     (/ t1 b)))

; (cons (car (list a b c)) (cdr (list a b c)))
(let ([l (list a b c)])
  (cons (car l) (cdr l)))