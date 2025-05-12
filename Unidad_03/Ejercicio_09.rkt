#lang racket

; Ejercicio 09

; Distancia entre dos puntos
(define (distance2d x y)
  (sqrt (+ (expt (- (car x) (car y)) 2) (expt (- (cdr x) (cdr y)) 2))))

(distance2d '(1 . 1) '(2 . 2))