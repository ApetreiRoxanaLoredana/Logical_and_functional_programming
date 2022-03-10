;Cerinta c)
;c)Definiti o functie care intoarce cel mai mare divizor comun al numerelor dintr-o lista neliniara.

;cmmdc(A:Integer, B:Integer)
;calculeaza cel mai mare divizor comun al numerelor A si B
; A - numar intreg
; B - numar intreg
(defun cmmdc(A B)
	(cond
		((equal B 0) A)
		((equal A 0) B)
		((not (equal (mod A B) 0)) (cmmdc B (mod A B)))
		(t B)
	)
)

;cmmdcLista(L:lista)
;calculeaza cel mai mare divizor comun al numerelor din lista L
; L - lista 
(defun cmmdcLista(L)
	(cond	
		((null L) 0)
		((and (null (cdr L)) (numberp (car L))) (car L))
		((and (null (cdr L)) (listp (car L))) (cmmdcLista (car L)))
		((null (cdr L)) 0)
		((numberp (car L)) (cmmdc (car L) (cmmdcLista (cdr L))))
		((listp (car L)) (cmmdc (cmmdcLista (car L)) (cmmdcLista (cdr L))))
		(t (cmmdcLista (cdr L)))
	)
)