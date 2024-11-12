;; ================================================================
;; FACTS - BASE DE CONOCIMIENTOS
;; ================================================================

(deffacts enfermedades-base
    (enfermedad 
        (nombre "COVID-19")
        (tipo viral)
        (sintomas "fiebre" "tos seca" "fatiga" "dolor muscular" "dolor de cabeza")
        (signos "dificultad respiratoria" "saturacion baja de oxigeno" "perdida del gusto" "perdida del olfato")
    )

    (enfermedad
        (nombre "Tuberculosis")
        (tipo bacteriana)
        (sintomas "tos cronica" "fatiga" "fiebre" "sudores nocturnos" "perdida de peso")
        (signos "tos con sangre" "dolor en el pecho" "dificultad respiratoria")
    )

    (enfermedad
        (nombre "Influenza")
        (tipo viral)
        (sintomas "fiebre alta" "dolor muscular" "fatiga" "dolor de cabeza" "congestion nasal")
        (signos "escalofrios" "tos seca" "garganta inflamada")
    )

    (enfermedad
        (nombre "Neumonia-Bacteriana")
        (tipo bacteriana)
        (sintomas "tos con flema" "fiebre" "dificultad respiratoria" "fatiga" "dolor en el pecho")
        (signos "sonidos anormales al respirar" "respiracion rapida" "confusion")
    )

    (enfermedad
        (nombre "Hepatitis-A")
        (tipo viral)
        (sintomas "fatiga" "nauseas" "dolor abdominal" "perdida de apetito" "fiebre")
        (signos "ictericia" "orina oscura" "heces palidas")
    )

    (enfermedad
        (nombre "Meningitis-Bacteriana")
        (tipo bacteriana)
        (sintomas "dolor de cabeza severo" "fiebre alta" "rigidez en el cuello" "confusion" "sensibilidad a la luz")
        (signos "nauseas" "vomitos" "alteracion del estado mental")
    )

    (enfermedad
        (nombre "Dengue")
        (tipo viral)
        (sintomas "fiebre alta" "dolor muscular severo" "dolor en las articulaciones" "fatiga" "dolor de cabeza")
        (signos "sangrado de encias" "dolor abdominal" "vomitos persistentes")
    )

    (enfermedad
        (nombre "Faringitis-Estreptococica")
        (tipo bacteriana)
        (sintomas "dolor de garganta" "dificultad para tragar" "fiebre" "dolor de cabeza")
        (signos "amigdalas inflamadas" "manchas blancas en la garganta" "ganglios inflamados")
    )

    (enfermedad
        (nombre "Sarampion")
        (tipo viral)
        (sintomas "fiebre alta" "tos" "congestion nasal" "conjuntivitis" "fatiga")
        (signos "erupcion cutanea caracteristica" "manchas de Koplik" "sensibilidad a la luz")
    )

    (enfermedad
        (nombre "Salmonelosis")
        (tipo bacteriana)
        (sintomas "diarrea" "fiebre" "calambres abdominales" "nauseas" "vomitos")
        (signos "deshidratacion" "sangre en heces" "dolor abdominal severo")
    )
)