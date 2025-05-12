#lang racket

; Ejercicio 04

; '(a b c . x) es una lista impropia?
(cdr (cdr (cdr '(a b c . x))))
(cdddr '(a b c . x)) ; Forma abreviada

; '(a b c x) es una lista propia?
(last '(a b c x))

; '((a . x) b)
(cdr (car '((a . x) b)))

; '(x . a)
(car '(x . a))

; '(a . x)
(cdr '(a . x))