;Cerinta:
;a)Sa se insereze intr-o lista liniara un atom a dat dupa al 2-lea, al 4-lea, al 6-lea,....element.

;inserare_aux(E:atom, L:lista, Poz:integer)
;insereaza atomul E pe pozitiile 2, 4, 6, ...
; E - atomul care trebuie inserat
; L - lista in care se insereaza atomul E
; Poz - pozitia primului element in lista initiala L
(defun inserare_aux(E L Poz)
	(cond
		((null L) nil)
		((equal (mod Poz 2) 0) (cons (car L) (cons E (inserare_aux E (cdr L) (+ Poz 1)))))
		(t (cons (car L) (inserare_aux E (cdr L) (+ Poz 1))))
	)
)

;inserare(E:atom, L:lista)
;insereaza atomul E pe pozitiile 2, 4, 6, ...
; E - atomul care trebuie inserat
; L - lista in care se insereaza atomul E
(defun inserare(E L)
	(inserare_aux E L 1)
)