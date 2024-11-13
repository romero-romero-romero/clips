;; ================================================================
;; KBS 2024B | RULES
;; ================================================================

;; ==================================
;; PROMOCIONES BANCARIAS
;; ==================================

;; Regla 1: Promoción iPhone 16 con Banamex
(defrule promo-iphone16-banamex
  (orden-compra (producto-marca "Apple") 
                (producto-modelo "iPhone16") 
                (metodo-pago "Banamex"))
  =>
  (printout t "¡Promoción! 24 meses sin intereses con tarjeta Banamex en iPhone 16" crlf)
  (assert (promocion-aplicada "MSI-24-BANAMEX")))

;; Regla 2: Promoción Samsung Note 21 con Liverpool
(defrule promo-note21-liverpool
  (orden-compra (producto-marca "Samsung") 
                (producto-modelo "Note21") 
                (metodo-pago "Liverpool"))
  =>
  (printout t "¡Promoción! 12 meses sin intereses con tarjeta Liverpool en Samsung Note 21" crlf)
  (assert (promocion-aplicada "MSI-12-LIVERPOOL")))

;; ==================================
;; PROMOCIONES A PAQUETES
;; ==================================

;; Regla 3: Bundle MacBook + iPhone
(defrule promo-bundle-apple
  (orden-compra (producto-tipo "computadora") 
                (producto-marca "Apple") 
                (producto-modelo "MacBookAir"))
  (orden-compra (producto-tipo "smartphone") 
                (producto-marca "Apple") 
                (producto-modelo "iPhone16"))
  (metodo-pago "contado")
  =>
  (printout t "¡Bundle Apple! $100 en vales por cada $1000 en tu compra de MacBook + iPhone" crlf)
  (assert (vale-generado (/ (* (+ 32000 27000) 100) 1000))))

;; Regla 4: Bundle Samsung Laptop + Note
(defrule promo-bundle-samsung
  (orden-compra (producto-tipo "computadora") 
                (producto-marca "Samsung"))
  (orden-compra (producto-tipo "smartphone") 
                (producto-marca "Samsung"))
  =>
  (printout t "¡Bundle Samsung! 20% de descuento en accesorios Samsung" crlf)
  (assert (descuento-accesorios 20)))

;; ==================================
;; PROMOCIONES A ACCESORIOS
;; ==================================

;; Regla 5: Promoción accesorios iPhone
(defrule promo-accesorios-iphone
  (orden-compra (producto-tipo "smartphone") 
                (producto-marca "Apple") 
                (producto-modelo ?modelo))
  (accesorio (tipo ?tipo) 
             (compatible-con ?modelo))
  =>
  (printout t "¡15% de descuento en " ?tipo " para tu nuevo " ?modelo "!" crlf)
  (assert (descuento-accesorio 15)))

;; Regla 6: Promoción accesorios Samsung
(defrule promo-accesorios-samsung
  (orden-compra (producto-tipo "smartphone") 
                (producto-marca "Samsung") 
                (producto-modelo ?modelo))
  (accesorio (tipo ?tipo) 
             (compatible-con ?modelo))
  =>
  (printout t "¡20% de descuento en " ?tipo " para tu nuevo " ?modelo "!" crlf)
  (assert (descuento-accesorio 20)))

;; ==================================
;; PROMOCIONES POR TIPO DE CLIENTE
;; ==================================

;; Regla 7: Cliente Mayorista Smartphones
(defrule cliente-mayorista-smartphones
  (orden-compra (producto-tipo "smartphone") 
                (cantidad ?qty))
  (test (> ?qty 10))
  =>
  (printout t "Cliente mayorista de smartphones - Aplicando 10% descuento adicional" crlf)
  (assert (descuento-mayorista 10)))

;; Regla 8: Cliente Mayorista Computadoras
(defrule cliente-mayorista-computadoras
  (orden-compra (producto-tipo "computadora") 
                (cantidad ?qty))
  (test (> ?qty 5))
  =>
  (printout t "Cliente mayorista de computadoras - Aplicando 15% descuento adicional" crlf)
  (assert (descuento-mayorista 15)))

;; ==================================
;; INVENTARIO
;; ==================================

;; Regla 9: Actualización de Stock Smartphones
(defrule actualizar-stock-smartphones
  ?orden <- (orden-compra (producto-tipo "smartphone") 
                         (producto-marca ?marca) 
                         (producto-modelo ?modelo) 
                         (cantidad ?qty))
  ?prod <- (smartphone (marca ?marca) 
                      (modelo ?modelo) 
                      (stock ?stock))
  =>
  (modify ?prod (stock (- ?stock ?qty)))
  (printout t "Stock actualizado para " ?marca " " ?modelo ": " (- ?stock ?qty) " unidades" crlf))

;; Regla 10: Alerta Stock Bajo
(defrule alerta-stock-bajo
  (smartphone (marca ?marca) 
              (modelo ?modelo) 
              (stock ?stock))
  (test (< ?stock 10))
  =>
  (printout t "¡ALERTA! Stock bajo para " ?marca " " ?modelo ": " ?stock " unidades" crlf)
  (assert (reorden-necesaria ?marca ?modelo)))

;; ==================================
;; PROMOCIONES DE TEMPORADA
;; ==================================

;; Regla 11: Promoción Navideña
(defrule promo-navidad
  (evento-especial (nombre "Navidad"))
  (orden-compra (total ?total))
  =>
  (printout t "¡Promoción navideña! 10% adicional en tu compra de $" ?total crlf)
  (assert (descuento-temporal 10)))

;; Regla 12: Promoción Buen Fin
(defrule promo-buen-fin
  (evento-especial (nombre "Buen Fin"))
  (orden-compra (total ?total))
  =>
  (printout t "¡Promoción Buen Fin! 15% adicional + 12 MSI en tu compra de $" ?total crlf)
  (assert (descuento-temporal 15))
  (assert (msi-promocion 12)))

;; ==================================
;; PROMOCIONES A CLIENTES FRECUENTES
;; ==================================

;; Regla 13: Cliente VIP
(defrule cliente-vip
  (cliente (id ?id) 
          (compras-año ?compras))
  (test (> ?compras 50000))
  =>
  (printout t "¡Cliente VIP! Beneficios exclusivos aplicados" crlf)
  (assert (status-cliente "VIP")))

;; Regla 14: Descuento por Cumpleaños
(defrule promo-cumpleaños
  (cliente (id ?id) 
          (fecha-cumpleaños ?fecha))
  (fecha-actual (fecha ?fecha))
  =>
  (printout t "¡Feliz cumpleaños! 20% en tu compra" crlf)
  (assert (descuento-cumpleaños 20)))

;; ==================================
;; GARANTÍA EXTENDIDA
;; ==================================

;; Regla 15: Garantía Extendida Premium
(defrule garantia-extendida-premium
  (orden-compra (producto-tipo "smartphone")
                (total ?total))
  (test (> ?total 20000))
  =>
  (printout t "¡Elegible para garantía extendida premium!" crlf)
  (assert (garantia-disponible "premium")))

;; Regla 16: Garantía Extendida Básica
(defrule garantia-extendida-basica
  (orden-compra (producto-tipo "smartphone")
                (total ?total))
  (test (<= ?total 20000))
  =>
  (printout t "¡Elegible para garantía extendida básica!" crlf)
  (assert (garantia-disponible "basica")))

;; ==================================
;; PROMOCIONES DE ENVÍO
;; ==================================

;; Regla 17: Envío Gratis
(defrule envio-gratis
  (orden-compra (total ?total))
  (test (> ?total 5000))
  =>
  (printout t "¡Envío gratis en tu compra!" crlf)
  (assert (envio-gratis true)))

;; Regla 18: Envío Express VIP
(defrule envio-express-vip
  (orden-compra (tipo-envio "express"))
  (cliente (status "VIP"))
  =>
  (printout t "¡Envío express sin costo adicional!" crlf)
  (assert (envio-express-gratis true)))

;; ==================================
;; DEVOLUCIÓN
;; ==================================

;; Regla 19: Política de Devolución Extendida
(defrule devolucion-extendida
  (orden-compra (producto-tipo ?tipo))
  (cliente (status "VIP"))
  =>
  (printout t "¡30 días de garantía de devolución!" crlf)
  (assert (politica-devolucion "extendida")))

;; Regla 20: Devolución Express
(defrule devolucion-express
  (solicitud-devolucion (orden-id ?id))
  (cliente (status "VIP"))
  =>
  (printout t "¡Devolución express procesada!" crlf)
  (assert (devolucion-express true)))

;; ==================================
;; FUNCIÓN DE PRUEBA
;; ==================================

(deffunction probar-reglas ()
  (assert (orden-compra (orden-id "O001")
                       (producto-tipo "smartphone")
                       (producto-marca "Apple")
                       (producto-modelo "iPhone16")
                       (cantidad 15)
                       (metodo-pago "Banamex")
                       (total 405000)))
  (assert (cliente (id "C001")
                  (status "VIP")
                  (compras-año 60000)))
  (assert (evento-especial (nombre "Navidad")
                          (fecha-inicio "2024-12-01")
                          (fecha-fin "2024-12-25")))
  (run))