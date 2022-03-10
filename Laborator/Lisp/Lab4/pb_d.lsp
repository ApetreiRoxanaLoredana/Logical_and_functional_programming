;Cerinta d)
;d)Sa se scrie o functie care determina numarul de aparitii ale unui atom dat intr-o lista neliniara.

;aparitii(E:atom, L:lista)
;determina numarul de aparitii ale atomului E in lista L
; E - atomul cautat
; L - lista in care se cauta numarul aparitiilor atomului E
(defun aparitii(E L)
	(cond
		((null L) 0)
		((listp (car L)) (+ (aparitii E (car L)) (aparitii E (cdr L))))
		((equal (car L) E) (+ (aparitii E (cdr L)) 1))
		(t (aparitii E (cdr L)))
	)
)