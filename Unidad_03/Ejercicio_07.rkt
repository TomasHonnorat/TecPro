#lang racket

; Ejercicio 07

(define (mascorta x y)
  (if (> (length x) (length y)) y
      x))

(mascorta '(a b) '(c d e))
(mascorta '(a b) '(c d))
(mascorta '(a b) '(c))

; (comparadorBool valor1 valor2)
; (if (funcBool) valorTrue valorFalse)