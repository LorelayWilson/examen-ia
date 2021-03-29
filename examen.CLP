(deffacts numeros
	(meta 21)
	(numeros 5 3 8 14 7 saltos-realizados 0)
	(actual 0)
	(saltos-max 5))


(defrule suma
?f1 <- (numeros $?ini ?x ?y $?fin saltos-realizados ?n)
	(meta ?num)
?f2 <- (actual ?act)
	(saltos-max ?max)
	(test (< ?n ?max))
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (+ ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
(assert(actual (+ ?num (+ ?x ?y))))
(printout t "Aplico suma" crlf)
)
	
(defrule multi
?f1 <- (numeros $?ini ?x ?y $?fin saltos-realizados ?n)
	(meta ?num)
?f2 <- (actual ?act)
	(saltos-max ?max)
	(test (< ?n ?max))
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (* ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
(assert(actual (* ?num (* ?x ?y))))
(printout t "Aplico multiplicacion" crlf)

)

	
;(defrule div
;?f1 <- (numeros $?ini ?x ?y $?fin saltos-realizados ?n)
;	(meta ?num)
;?f2 <- (actual ?act)
;	(saltos-max ?max)
;	(test (< ?n ?max))
;	(test (<> ?num ?act))
;	(bind ?div (mod ?x ?y))
;	(test (eq ?div 0))
;
;=>
;
;(assert (numeros $?ini (/ ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
;(assert(actual (/ ?num (/ ?x ?y))))
;(printout t "Aplico multiplicacion" crlf)
;
;)
	
(defrule resta
?f1 <- (numeros $?ini ?x ?y $?fin  saltos-realizados ?n)
	(meta ?num)
?f2 <- (actual ?act)
	(saltos-max ?max)
	(test (<> ?num ?act))
	(test (> ?x ?y))
	(test (< ?n ?max))
	;(bind ?res (- ?x ?y))
	;(test (> ?num ?res))

=>

(assert (numeros $?ini (- ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
(assert(actual (- ?num (- ?x ?y))))
(printout t "Aplico resta" crlf)
)


(defrule fin
	(salience 1000)
	(actual ?num $?n)
	(meta ?num)
	(saltos-max ?max)
	(test (< ?n ?max))
	(numeros nil)
=>

(printout t "Se ha encontrado la solucion" crlf)
(halt)
)