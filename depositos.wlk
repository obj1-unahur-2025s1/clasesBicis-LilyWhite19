import bicis.*

class Deposito{
    const property bicis = []
    const parDeBicis = []
    method guardarBicis(listaDeBicis){
        if (listaDeBicis.all({b => bicis.contains(b)})){
            throw new Exception(message="no se puede agregar dos veces una bici a un deposito")
        }
        if (listaDeBicis.any({b => listaDeBicis.occurrencesOf(b) > 1})){
            self.error("hay bicis duplicadas dentro de la lista de las nuevas bicis")
        }
        bicis.addAll(listaDeBicis.filter({b => !bicis.contains(b)}))
    }
    method sacarBici(unaBici){
        if (not bicis.contains(unaBici)){
            self.error(unaBici.toString() + " no esta en el deposito")
        }
        bicis.remove(unaBici)
    }
    method bicisRapidas() = bicis.filter({b => b.esRapida()})
    method listaDeMarcas() = self.conjuntoDeMarcas().asList()
    method conjuntoDeMarcas() = bicis.map({b => b.marca()}).asSet()
    method esNocturno() = bicis.all({b => b.tieneLuz()})
    method hayAlMenosUnaBiciConCarga(unaCarga) = bicis.any({b => b.carga() > unaCarga})
    method marcaDeLaBiciMasRapida() = self.biciMasRapida().marca()
    method biciMasRapida() = bicis.max({b => b.velocidadCruzero()})
    method cargaTotalDeLasBicisLargar() = self.bicisLargas().sum({b => b.carga()})
    method bicisLargas() = bicis.filter({b => b.largo() > 170})
    method bicisSinAccesorios() = bicis.count({b => b.accesorios().isEmpty()})
    method unaBiciTieneCompañera(unaBici) = 
        self.unaBiciConLaMismaMarca(unaBici) &&
        self.unaBiciConUnLargoParecido(unaBici)
    method unaBiciConLaMismaMarca(unaBici) = 
        bicis.any({b => b.marca() == unaBici.marca() && b != unaBici})
    method unaBiciConUnLargoParecido(unaBici) = 
        bicis.any({b => b.velociadadCruzero().between(unaBici.velocidadCruzero() + 10, unaBici.velocidadCruzero() - 10) &&
        b != unaBici})
    method hayCompañeras() = bicis.any({b => self.unaBiciTieneCompañera(b)})
    method parejasCompañeras() {
        return if (self.hayCompañeras())
        self.listaDeParejasCompañeras()
    }
    method listaDeParejasCompañeras() {
        bicis.filter({b => self.unaBiciTieneCompañera(b)})
    }
    method parejaDeBicis() = 
}