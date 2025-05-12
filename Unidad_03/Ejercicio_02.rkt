#lang racket

; Ejercicio 02

; quote evita que una expresion sea evaluda
; ' es la forma abreviada

(cons 'car '+) ; Par

(list 'esto '(es muy facil))

(cons 'pero '(se está complicando...))
(cons '(y ahora no se que) 'hizo)

(quote (+ 7 2))

(quote (cons (car (cdr (7 4)))))
(quote cons)
(car (quote (quote cons)))

(+ 2 3)

(+ '2 '3)

(+ (car '(2 3)) (car (cdr '(2 3))))

((car (list + - * /)) 2 3)