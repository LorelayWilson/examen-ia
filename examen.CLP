(deffacts numeros
	(meta 21)
	(numeros 5 3 8 14 7)
	(actual 0))


(defrule suma
?f1 <- (numeros $?ini ?x ?y $?fin)
	(meta ?num)
?f2 <- (actual ?act)
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (+ ?x ?y) $?fin))
(assert(actual (+ ?num (+ ?x ?y))))
(retract ?f1)
(retract ?f2)
)
	
(defrule multi
?f1 <- (numeros $?ini ?x ?y $?fin)
	(meta ?num)
?f2 <- (actual ?act)
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (* ?x ?y) $?fin))
(assert(actual (* ?num (* ?x ?y))))
(retract ?f1)
(retract ?f2)
)
	
(defrule resta
?f1 <- (numeros $?ini ?x ?y $?fin)
	(meta ?num)
?f2 <- (actual ?act)
	(test (<> ?num ?act))

=>

(assert (numeros $?ini (- ?x ?y) $?fin))
(assert(actual (- ?num (- ?x ?y))))
(retract ?f1)
(retract ?f2)
)