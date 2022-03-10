;substituieElement(x:List/Atom, e:Atom, l:List)
;returneaza o lista unde inlocuieste elementul e cu elementele listei l
; x - lista initiala din care se modifica elementul e
; e - elementul care trebuie modificat
; l - lista cu elementele cu care se va inlocui elementul e in lista initiala x
(defun substituieElement(x e l)
	(cond 
		((and (atom x) (equal x e)) l)
		((and (atom x) (not( equal x e))) (list x))
		(t (list (apply #' append (mapcar #' (lambda (lista) (substituieElement lista e l))x))))
	)
)

;substituie(x:List/Atom, e:Atom, l:List)
;returneaza primul element in urma apelarii functiei substituieElement
;returneaza o lista unde inlocuieste elementul e cu elementele listei l
(defun substituie(x e l)
	(car (substituieElement x e l))
)