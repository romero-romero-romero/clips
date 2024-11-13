;; ================================================================
;; KBS 2024B | TEMPLATES 
;; ================================================================

(deftemplate smartphone
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot stock)
  (slot categoria (default "smartphone"))
)

(deftemplate computadora
  (slot marca)
  (slot modelo)
  (slot color)
  (slot precio)
  (slot stock)
  (slot categoria (default "computadora"))
)

(deftemplate accesorio
  (slot tipo)
  (slot compatible-con)
  (slot precio)
  (slot stock)
  (slot descuento (default 0))
)

(deftemplate cliente
  (slot id)
  (multislot nombre)
  (slot tipo (default "menudista"))
  (slot telefono)
  (multislot direccion)
  (slot compras-año (default 0))
  (slot fecha-cumpleaños)
  (slot status (default "regular"))
)

(deftemplate orden-compra
  (slot orden-id)
  (slot cliente-id)
  (slot producto-tipo)
  (slot producto-marca)
  (slot producto-modelo)
  (slot cantidad)
  (slot metodo-pago)
  (slot precio)
  (slot total)
  (slot tipo-envio (default "normal"))
  (slot estado (default "pendiente"))
)

(deftemplate tarjeta-credito
  (slot banco)
  (slot grupo)
  (slot exp-date)
  (multislot meses-sin-intereses)
)

(deftemplate vale
  (slot id)
  (slot valor)
  (slot fecha-expiracion)
  (slot minimo-compra)
)

(deftemplate solicitud-devolucion
  (slot orden-id)
  (slot cliente-id)
  (slot motivo)
  (slot estado (default "pendiente"))
)

(deftemplate fecha-actual
  (slot fecha)
)

(deftemplate evento-especial
  (slot nombre)
  (slot fecha-inicio)
  (slot fecha-fin)
)