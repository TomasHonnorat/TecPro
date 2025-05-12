#lang racket ; Utilizar racket

#|
   Lisp -> Scheme -> Racket (Deriva de los anteriores)

   Racket -> Hacer programas utilizando programacion funcional
   Se basa en expresiones simples o complejas
   Utilizando programacion funcional la cual se basa en definiciones

|#

; Ejemplos basicos:
(+ 3 5) ; esto es una lista
(* 3 5)
(+ (* 3 5) (* 2 5))
(sqrt 2)

; Ejemplo de definiciones constantes
(define numPi 3.141592)
(define nombre "Tomas")

; Ejemplo de definiciones de funciones
(define suma2y3 (+ 2 3))
; Funciones con parametros
(define (media a b)
  (/ (+ a b) 2))
; Algunas funciones tiene mas parametros
(define (sumar a b c)
  (+ a b c))

; Tipos de Datos

; True / False :
#t
#f
true
false
; Operador OR
(or #f #f #f)
(or true false false)
; Operador AND
(and #t #t #t)
(and #t #f)
; Operador NOT
(not #f)
; Operador NAND
(nand #t #t #f)
; Operador NOR
(nor #f #f)
; Operador XOR
(xor #f #t) ; Solo admite 2 parametros
; Retorna si es un booleano o no
(boolean? #t)

; if (if condicion siEsTrue siEsFalse)
(if #t "a" "b")
(if #f "a" "b")

; Para if anidados
; (cond [(string? x) "string"] [] [] ...)
(define (que-soy x) ; Retorna la primera verdadera
  (cond
    [(string? x) "string"]
    [(number? x) "numero"]
    [(boolean? x) "booleano"]
    [else "no se lo que soy"] ; si no se ejecuta ninguno
    ))

(= 5 5) ; Comparador igual
(> 4 1) ; Comparador mayor
(< 2 7) ; Comparador menor
(>= 1 0) ; Comparador Mayoy o igual
 
; Los Numeros se dividen en: Exactos e Inexactos
; Ejemplos Exactos:
5
-10
2/5
5+3i

(exact? -10) ; retorna True o False si es exacto

; Ejemplos Inexactos
5.5
+inf.0
-inf.0
2.5+3.0i
5.25e8
-2.86e-05

(inexact? -2+1.1i) ; retorna True o False si es Inexacto

(number? 34) ; Retorna True o False si es un numero o no
; Nota: No hay limite de bits para los numeros,
; pueden ser tan largo como queramos

; Caracteres:
#\e
#\E
#\a

(char? #\U) ; retorna True o False si es un caracter

;Cadena de caracteres
"Cadena de Caracteres"
(display "Hello World! \n")

(display " \" Comillas \" \n")

; Construir un par 
(cons 1 2)
'(1 . 2) ; Otra forma

(define par (cons 3 7)) ; Defino un par llamado "par"
; Acceder al primer elemento:
(car par)
; Acceder al segundo elemento:
(cdr par)

; Un par de par:
(cons (cons 1 2) 4)

; Lista
(define lista (cons 1
                    (cons 2
                          (cons 3
                                (cons 4 null)))))
lista ; '(1 2 3 4)
(car lista)
(cdr lista)
; Es un par con el primer elemento y la sublista que queda

;Una manera mas facil de crear una lista:
(list 1 2 3 4 6 7 8 9)

(pair? lista) ; Retorna si es un par o no
(list? lista) ; Retorna si es una lista o no

; List mas ejemplos:

; Definimos listas
(define lista1 (list 1 2 3 4 5 6 7 8 9 10 11))
(define lista2 (list 1 2 3))
(define lista3 (list 4 5 6))

#| Una forma de acceder es con "car" y "cdr"
   como se hace arriba al primer elemento y
   su sublista. Otra formas son:
|#

(first lista1) ; Primer elemento
(rest lista1)  ; El resto de elementos

; Del primero al decimo
(first lista1)  ; Primer elemento
(second lista1) ; Segundo elemento
(third lista1)
(fourth lista1)
; ...
(tenth lista1) ; Decimo elemento

; Obtener el ultimo elemento
(last lista1) 

; Obtener el elemento por indice:
(list-ref lista1 0) ; Primer elemento (Empieza en 0)
(list-ref lista1 7)

; Obtener la longitud de la lista:
(length lista1)

; Concatenar dos listas
(append lista2 lista3)

; Retorna si esta vacia o no
(empty? lista1)

; Invertir la lista
(reverse lista2)

; Comprueba si existe el elemento y devuelve la sublista
(member 5 lista1)
(member 5 lista2)

; FUNCIONES ITERATIVAS:

#|
  (map func lista) retorna una lista con los valores
  devueltos por la funcion evaluando cada elemento
  de la lista

  func debe aceptar tantos parametros como listas
  le pasemos (listas de igual longitud)
|#
(add1 5) ; Suma o añade 1 al elemento = (+ n 1)
; A cada elemento de la lista le suma 1 y lo retorna
(map add1 lista2)

; Suma elemento a elemento
(map + lista2 lista3)

#|
  (andmap funcBOOL lista)
  (ormap funcBool lista)
  
  andmap y ormap trabajan con funciones de tipo
  booleano(es decir que retornan un booleano)
  y retornan si se cumple para todos los elementos
  (en el caso de andmap) o retorna si se cumple para
  al menos un elemento (en el caso de ormap)
|#

(andmap boolean? (list #f #t #f #t)) ; Son todos Booleanos?

(ormap boolean? (list 34 #t "a" #t)) ; Hay algun Booleano?
#|
  (filter funcBOOL lista)
  me va a retornar una lista de los valores que SI
  cumplen la funcion booleana
|#

; Son Strings? entonces retornalos
(filter string? (list "Hola" #f "Pepe" 45 #t)) 


; RECURSIÓN

(define (factorial x)
  (if (= x 0) 1
      (* x (factorial (- x 1)))))

(define (sumarlista l)
  (if (empty? l) 0
      (+ (car l) (sumarlista (cdr l)))))

 #| FUNCIONES |#

;(define (funcName param1 param2) (body))

(define (sumar-lista l)
  (if (empty? l)
      0
      (+ (car l) (sumar-lista (cdr l)))))

(define (medialist l)
  (/ (sumar-lista l) (length l)))

; Llama a la funcion "funcName" con
; cada elemento de la lista

; (apply funcName list)
(apply + (list 1 2 3 4 5 6 7))

(define (medialist2 l)
  (/ (apply + l) (length l)))

(medialist2 (list 1 2 3 4 5))

; Multiples parametros:

(define (funcion . l) l)

(define (medialist3 . l)
  (/ (apply + l) (length l)))

(medialist3 1 2 3 4 5)

; Se puede retornar otra definiciones
(define (sumamos-o-restamos boo a b)
  ((if boo + -) a b))

(sumamos-o-restamos #t 1 3)
(sumamos-o-restamos #f 1 3)

#| FUNCIONES LAMBDA |#

; Queremos usar una funcion una vez
; y no guardar un identificador

; Nota: las funciones deberian hacer una sola cosa

; (lambda lista-par body)
; (lambda (param1 param2) retorno)
(lambda (x) x)

((lambda (x) x) 5)
((lambda (x y) (+ x y)) 5 4)

; Retornar un procedimiento
(define (construir-saludo saludo)
  (lambda (nom)
    (string-append saludo ", " nom)))

((construir-saludo "Hola") "Pepe")


#| Variables Locales |#

(let [(x 5)
      (y 4)]
  (+ x y))

#|
(let [(id expre)
      (id expre)]
  (body))
|#

; let* me permite usar asignaciones dentro de otras
(let* [(x 5)
       (y (+ 4 x))]
  (display y))

; drop ignora los primeros elementos de una lista
(drop '(a b c d e) 2) ; => '(c d e)
; take retorna una nueva lista con los primeros n elementos
(take '(a b c d e) 3) ; => '(a b c)

























