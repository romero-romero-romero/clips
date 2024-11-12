;; ================================================================
;; FUNCTIONS - FUNCIONES DE MANIPULACIÓN
;; ================================================================

; Función para agregar una nueva enfermedad
(deffunction agregar-enfermedad ($?parametros)
    (bind ?nombre (nth$ 1 ?parametros))
    (bind ?tipo (nth$ 2 ?parametros))
    
    ; Obtener los síntomas (del tercer parámetro hasta la mitad de los restantes)
    (bind ?num-sintomas (integer (/ (- (length$ ?parametros) 2) 2)))
    (bind ?sintomas (subseq$ ?parametros 3 (+ 2 ?num-sintomas)))
    
    ; Obtener los signos (desde la mitad hasta el final)
    (bind ?signos (subseq$ ?parametros (+ 3 ?num-sintomas) (length$ ?parametros)))
    
    (assert (enfermedad 
        (nombre ?nombre)
        (tipo ?tipo)
        (sintomas ?sintomas)
        (signos ?signos)
    ))
    (printout t "Enfermedad agregada exitosamente" crlf)
)

; Función para actualizar una enfermedad existente
(deffunction actualizar-enfermedad ($?parametros)
    (bind ?nombre (nth$ 1 ?parametros))
    (bind ?tipo (nth$ 2 ?parametros))
    
    ; Obtener los síntomas y signos
    (bind ?num-sintomas (integer (/ (- (length$ ?parametros) 2) 2)))
    (bind ?sintomas (subseq$ ?parametros 3 (+ 2 ?num-sintomas)))
    (bind ?signos (subseq$ ?parametros (+ 3 ?num-sintomas) (length$ ?parametros)))
    
    ; Borrar la enfermedad existente
    (do-for-fact ((?enf enfermedad)) (eq ?enf:nombre ?nombre)
        (retract ?enf)
    )
    
    ; Agregar la versión actualizada
    (assert (enfermedad 
        (nombre ?nombre)
        (tipo ?tipo)
        (sintomas ?sintomas)
        (signos ?signos)
    ))
    (printout t "Enfermedad actualizada exitosamente" crlf)
)

; Función para borrar una enfermedad
(deffunction borrar-enfermedad (?nombre)
    (do-for-fact ((?enf enfermedad)) (eq ?enf:nombre ?nombre)
        (retract ?enf)
        (printout t "Enfermedad borrada exitosamente" crlf)
        (return TRUE)
    )
    (printout t "Enfermedad no encontrada" crlf)
    (return FALSE)
)