;Cerinta b)
;b)Definiti o functie care obtine dintr-o lista data lista tuturor atomilor 
;care apar, pe orice nivel, dar in ordine inversa. 
;De exemplu:(((A B) C) (D E)) --> (E D C B A)

;invers_aux(L:lista, Col:lista)
;inverseaza lista L 
; L - lista care trebuie inversata
; Col - rezultatul listei inversate
(defun invers_aux(L Col)
	(cond
		((null L) Col)
		((listp (car L)) (invers_aux (cdr L) (invers_aux (car L) Col)))
		(t (invers_aux (cdr L) (cons (car L) Col)))
	)
)

;invers(L:lista)
;inverseaza lista L 
; L - lista care trebuie inversata
(defun invers(L)
	(invers_aux L ())
)