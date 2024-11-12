;; ================================================================
;; RULES - REGLAS DE CONSULTA
;; ================================================================

(defrule buscar-por-sintoma
    (buscar-sintoma ?sintoma)
    (enfermedad (nombre ?nombre) (sintomas $? ?sintoma $?))
    =>
    (printout t "La enfermedad " ?nombre " presenta el sintoma: " ?sintoma crlf)
)

(defrule buscar-por-signo
    (buscar-signo ?signo)
    (enfermedad (nombre ?nombre) (signos $? ?signo $?))
    =>
    (printout t "La enfermedad " ?nombre " presenta el signo: " ?signo crlf)
)

(defrule buscar-por-tipo
    (buscar-tipo ?tipo)
    (enfermedad (nombre ?nombre) (tipo ?tipo))
    =>
    (printout t "La enfermedad " ?nombre " es de tipo: " ?tipo crlf)
)

(defrule mostrar-enfermedad
    (mostrar-enfermedad ?nombre)
    ?enf <- (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas $?sint) (signos $?sig))
    =>
    (printout t "=== Información de la enfermedad ===" crlf)
    (printout t "Nombre: " ?nombre crlf)
    (printout t "Tipo: " ?tipo crlf)
    (printout t "Síntomas: " $?sint crlf)
    (printout t "Signos: " $?sig crlf)
)
