class Bici{
  const rodado
  const largo
  const property marca
  const accesorios = []
  method agregarAccesorio(unAccesorio){
    accesorios.add(unAccesorio)
  }
  method sacarAccesorio(unAccesorio){
    accesorios.remove(unAccesorio)
  }
  method altura() = rodado * 2.5 + 15
  method velocidadCruzero() = 
    rodado + if (largo > 120) 6 else 2
  method carga() = accesorios.sum({a => a.carga()})
  method peso() = rodado / 2 + self.pesoDeLosAccesorios()
  method pesoDeLosAccesorios() = accesorios.sum({a => a.peso()})
  method tieneLuz() = accesorios.any({a => a.esLuminoso()})
  method accesoriosLivianos() = accesorios.count({a => a.peso() < 1})
  method esRapida() = self.velocidadCruzero() > 25

  

}

// ACCESORIOS

class Farolito{
  method peso() = 0.5
  method carga() = 0
  method esLuminoso() = true
}
class Canasto{
  const volumen
  method peso() = volumen / 10
  method carga() = volumen * 2
  method esLuminoso() = false
  method initialize(){
    if (!volumen.between(1, 30)){
      self.error("volumen no es un valor entre 1 y 20")
    }
  }
}
class Morral{
  const largo 
  const tieneOjoDeGato 
  method peso() = 1.2
  method carga() = largo / 3
  method esLuminoso() = tieneOjoDeGato
  method initialize(){
    if (not largo.between(1, 40)){
      self.error("el largo no es un valor entre 1 y 20")
      }
    
  }
}