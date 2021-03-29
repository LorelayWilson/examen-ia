(deffacts numeros
	(meta 21)
	(numeros 5 3 8 14 7 saltos-realizados 0)
	(actual 0))


(defrule suma
?f1 <- (numeros $?ini ?x ?y $?fin saltos-realizados 0)
	(meta ?num)
?f2 <- (actual ?act)
	(test (< ?n 10))
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (+ ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
(assert(actual (+ ?num (+ ?x ?y))))
)
	
(defrule multi
?f1 <- (numeros $?ini ?x ?y $?fin  saltos-realizados 0)
	(meta ?num)
?f2 <- (actual ?act)
	(test (< ?n 10))
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (* ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
(assert(actual (* ?num (* ?x ?y))))

)
	
(defrule resta
?f1 <- (numeros $?ini ?x ?y $?fin  saltos-realizados 0)
	(meta ?num)
?f2 <- (actual ?act)
	(test (<> ?num ?act))
	(test (> ?x ?y))
	(test (< ?n 10))

=>

(assert (numeros $?ini (- ?x ?y) $?fin  saltos-realizados (+ 1 ?n)))
(assert(actual (- ?num (- ?x ?y))))
)


(defrule fin
	(salience 1000)
	(actual ?num $?n)
	(meta ?num)
	(test (< ?n 10))
	(numeros nil)
=>

(printout t "Se ha encontrado la solucion" crlf)
(halt)
)