;; ================================================================
;; TEMPLATES
;; ================================================================

(deftemplate enfermedad
    (slot nombre)
    (slot tipo (allowed-values bacteriana viral))
    (multislot sintomas)
    (multislot signos)
)