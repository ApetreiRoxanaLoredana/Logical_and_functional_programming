;st_dr_aux(L:List, nv:Integer, nm:Integer, Col:List) 
;returneaza o lista de forma ((subarbore_stang)(subarbore_drept))
; L - lista aborelui
; nv - numarul de varfuri
; nm - numarul de muchii
; Col - lista colectoare care colecteaza subarborele stang
(defun st_dr_aux(L nv nm Col)
	(cond
		((or (= nv (+ nm 1)) (null L))(append (list Col) (list L)))
		(t (st_dr_aux (cddr L) (+ nv 1) (+ nm (cadr L)) (append Col (list (car L)) (list (cadr L)))))
	)
)

;st_dr(L:List)
;returneaza o lista de forma ((subarbore_stang)(subarbore_drept))
; L - lista arborelui
(defun st_dr(L)
	(st_dr_aux (cddr L) 0 0 ())
)

;cauta_aux(L:List, e:Atom, poz:Integer)
;returneaza adancimea la care se afla atomul e in arborele L
; L - lista arborelui
; e - atomul la care trebuie cautata adancimea
; poz - adancimea la care se alfa atomul e in arborele L
(defun cauta_aux(L e poz)
	((lambda(arbore)
		((lambda(stang drept)
			(cond
				((null L) -1)
				((equal (car L) e) poz)		
				((apartine stang e) (cauta_aux stang e (+ poz 1)))
				((apartine drept e) (cauta_aux drept e (+ poz 1)))
				(t -1)
			)
		)(car arbore)(cadr arbore))
	)(st_dr L))
)

;cauta(L:List, e:Atom)
;returneaza adancimea atomului e in arborele L
; L - lista arborelui
; e - atomul la care trebuie cautata adancimea
(defun cauta(L e)
	(cauta_aux L e 0)
)

;apartine(L:List, e:Atom)
;returneaza true daca atomul e apare in lista List sau false altfel
; L - lista aborelui
; e - atomul care trebuie cautat
(defun apartine(L e)
	(cond
		((null L) nil)
		((equal (car L) e) t)
		(t (apartine (cdr L) e))
	)
)