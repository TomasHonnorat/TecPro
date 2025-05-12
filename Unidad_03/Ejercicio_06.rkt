#lang racket

; Ejercicio 06

(let ((x 9))
 (* x
  (let ((x (/ x 3)))
   (+ x x))))

; (* 9 (+ 9/3 9/3))