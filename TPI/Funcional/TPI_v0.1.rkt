#lang racket

#| -------------------------------------------------------------------- |#
                             #| Datos |#
#| -------------------------------------------------------------------- |#
(define localidades 
  '("Córdoba Capital"
    "Carlos Paz"
    "Bialet Massé"
    "Valle Hermoso"
    "La Falda"
    "Huerta Grande"
    "La Cumbre"
    "Capilla Del Monte")) 
 
(define costos
  '(1500 1500 1000 1200 1000 1200 1600))

(define horarios
  '(((07 00) (10 00) (12 00))      ; Córdoba Capital
    ((07 30) (10 30) (12 30))      ; Carlos Paz
    ((07 45) (10 45) (12 45))      ; Bialet Massé
    ((08 15) (11 15) (13 15))      ; Valle Hermoso
    ((08 30) (11 30) (13 30))      ; La Falda
    ((08 45) (11 45) (13 45))      ; Huerta Grande
    ((09 30) (12 30) (14 30))      ; La Cumbre
    ((10 00) (13 00) (15 00))))    ; Capilla Del Monte

#| -------------------------------------------------------------------- |#
                     #| Funciones Auxiliares |#
#| -------------------------------------------------------------------- |#

#| Retorna el indice del elemento buscado en la lista |# 
(define (obtener-indx elem l i)
    (cond
      [(empty? l) #f] ; No encontrado
      [(equal? (car l) elem) i]
      [else (obtener-indx elem (cdr l) (+ i 1))]))

#| Retorna si las localidades de origen y destino son validas |# 
(define (valid-loc? loc-o loc-d l)
  (let ([indx-o (obtener-indx loc-o l 0)]
        [indx-d (obtener-indx loc-d l 0)])
    (cond                                 ; retorna: 
      [(or (not indx-o) (not indx-d)) #f] ;  si alguno no está
      [(< indx-o indx-d) #t]              ;  si origen esta antes que destino
      [else #f])))                        ;  si no esta antes que destino

#| Retorna si la hora1 es menor o igual que la hora2 |#
(define (h<=? h1 h2)
  (cond [(< (first h1) (first h2)) #t]
        [(and (equal? (first h1) (first h2))
              (<= (second h1) (second h2))) #t]
        [else #f]))

#| Dado un Horario y una lista de Horarios, retorna los más proximo |#
(define (obtener-horarios h-actual h-list)
  (cond [(empty? h-list) '()] ;
        [(not (h<=? h-actual (last h-list))) '()]
        [(h<=? h-actual (car h-list)) h-list]
        [else (obtener-horarios h-actual (cdr h-list))]))

#| Obtener una sublista dado los indices |#
(define (sublista l inicio fin)
  (take (drop l inicio) (- fin inicio)))

#| Obtener el costo |#
(define (obtener-costo loc-o loc-d)
  (let [(indx-o (obtener-indx loc-o localidades 0))
        (indx-d (obtener-indx loc-d localidades 0))]
    (apply + (sublista costos indx-o indx-d))))

#| -------------------------------------------------------------------- |#
                         #| Funcion Principal |#
#| -------------------------------------------------------------------- |#

(define (ArgentinaTur consulta)
  (let* ([origen (first consulta)]
         [destino (second consulta)]
         [hora (third consulta)])
    (cond
      [(not (= (length consulta) 3))
       "ERROR! - Ingrese una lista de 3 argumentos!"]
      [(not (valid-loc? origen destino localidades))
       "ERROR! - Localidades no válidas!"]
      [else
       (let* ([i-origen (obtener-indx origen localidades 0)]
              [hs (obtener-horarios hora (list-ref horarios i-origen))])
         (if (empty? hs)
             (list (list origen destino) 0 "NO HAY HORARIOS DE SALIDA DISPONIBLES")
             (list (list origen destino)
                   (obtener-costo origen destino)
                   hs)))])))

#| -------------------------------------------------------------------- |#
                       #| Ejemplos de Uso |#
#| -------------------------------------------------------------------- |#

(ArgentinaTur '("Córdoba Capital" "La Falda" (10 30)))
(ArgentinaTur '("Valle Hermoso" "La Cumbre" (09 00)))
(ArgentinaTur '("Córdoba Capital" "La Falda" (16 00)))
(ArgentinaTur '("La Falda" "Córdoba Capital" 0 (10 00)))












