// capos.wlk
// capos.wlk
// capos.wlk
// capos.wlk
object rolando {
   var capacidad = 2
   const mochila = #{}
   var property casa = castillo
   const encuentros = []
   const poderBase = 5

   method poderBase() = poderBase

   method poderPelea(){
      return 0
   }

   method encontrar(artefacto) {
      encuentros.add(artefacto)
      if (capacidad >= (mochila.size() + 1)) {
         self.guardar(artefacto)
      }
   }

   method encuentros(){
      return encuentros
   }

   method guardar(artefacto) {
      mochila.add(artefacto)
   }

   method capacidad() {
      return capacidad
   }

   method capacidad(_capacidad) {
      capacidad = _capacidad
   }

   method mochila(){
      return mochila
   }

   method llegarACasa(){
      casa.registrarNuevosArtefactos(self.mochila())
      mochila.clear()
   }

   method posesiones(){
      return (#{}.union(mochila)).union(casa.artefactosAlmacenados())
   }

   method posee(elem){
      return self.posesiones().contains(elem)
   }


}

//tipo artifacto

object espada{
   var usado = false

   method usar(personaje) {
      if (usado) {
         return personaje.poderBase()/2
      }
      else {
         return personaje.poderBase()
      }
   }
}

object libro{

}

object armadura {
}

object collar {
   var batalla = 0
   method usar(personaje){
      if (personaje.poderBase() > 6) {
         return 3 + batalla
      }
      batalla += 1
      return 3
   }
}

//Tipo lugar

object castillo {
const artefactos = #{}
// var no es porque la estructura set nunca varia 

   method artefactosAlmacenados(){
      return artefactos
   }

   method registrarNuevosArtefactos(conjunto){
      artefactos.addAll(conjunto)
   }
}