#lang racket

; Ejercicio 10

(define (largo l)
  (if (empty? l) 0 (+ 1 (largo (cdr l)))))

(largo '())
(largo '(1 4 8 5 5 3 2 1 5 8))
(largo '(1 4 8))