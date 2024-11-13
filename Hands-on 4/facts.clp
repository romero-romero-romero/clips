;; ================================================================
;; KBS 2024B | FACTS
;; ================================================================

(deffacts smartphones
  (smartphone (marca "Apple") (modelo "iPhone16") (color "rojo") (precio 27000) (stock 50))
  (smartphone (marca "Apple") (modelo "iPhone16") (color "negro") (precio 27000) (stock 30))
  (smartphone (marca "Samsung") (modelo "Note21") (color "azul") (precio 24000) (stock 40))
  (smartphone (marca "Samsung") (modelo "S24") (color "negro") (precio 22000) (stock 25))
)

(deffacts computadoras
  (computadora (marca "Apple") (modelo "MacBookPro") (color "gris") (precio 47000) (stock 20))
  (computadora (marca "Apple") (modelo "MacBookAir") (color "gris") (precio 32000) (stock 30))
  (computadora (marca "Dell") (modelo "XPS13") (color "plata") (precio 28000) (stock 15))
)

(deffacts accesorios
  (accesorio (tipo "funda") (compatible-con "iPhone16") (precio 499) (stock 100))
  (accesorio (tipo "mica") (compatible-con "iPhone16") (precio 299) (stock 200))
  (accesorio (tipo "funda") (compatible-con "Note21") (precio 399) (stock 80))
  (accesorio (tipo "mica") (compatible-con "Note21") (precio 299) (stock 150))
)

(deffacts tarjetas
  (tarjeta-credito (banco "Banamex") (grupo "VISA") (exp-date "01-12-24") (meses-sin-intereses 24))
  (tarjeta-credito (banco "Liverpool") (grupo "VISA") (exp-date "01-12-24") (meses-sin-intereses 12))
  (tarjeta-credito (banco "Bancomer") (grupo "MasterCard") (exp-date "01-12-24") (meses-sin-intereses 18))
)