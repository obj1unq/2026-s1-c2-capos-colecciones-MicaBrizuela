// capos.wlk
// capos.wlk
// capos.wlk
// capos.wlk

//tipo personaje
object rolando {
   var capacidad = 2
   const mochila = #{}
   var property casa = castillo
   const encuentros = []
   var poderBase = 5

   method poderBase() = poderBase

   method poderDePelea(){
      return poderBase + mochila.sum({artefacto => artefacto.poderDePelea(self)})
   }

   method batalla(){
      mochila.forEach({artefacto => artefacto.usar(self)})
      poderBase += 1
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

   method enemigosQuePuedeVencer(mundo){
      return mundo.enemigos().filter({enemigo => enemigo.poderDePelea() < self.poderDePelea()})
   }

   method moradasConquistables(mundo){
      return self.enemigosQuePuedeVencer(mundo).map({enemigo => enemigo.morada()})
   }

   method esPoderoso(mundo){
      return mundo.enemigos().all({enemigo => enemigo.poderDePelea() < self.poderDePelea()})
   }

}

//tipo artifacto

object espada{
   var esPrimerUso = true

   method usar(personaje) {
      esPrimerUso = false
   }

   method poderDePelea(personaje){
      return if (esPrimerUso) { personaje.poderBase() } else {personaje.poderBase()/2}
   }
}

object libro{
   const hechizos = []

   method usar(personaje){
      if (!hechizos.isEmpty()) {
         hechizos.remove(hechizos.head())
      }
   }

   method poderDePelea(personaje){
      return if (hechizos.isEmpty()) {0} else {hechizos.head().poder(personaje)}
   }

   method agregarHechizos(lista){
      hechizos.addAll(lista)
   }

   method hechizos(){
      return hechizos
   }
}

object armadura {
   const poderBase = 6

   method usar(personaje){}

   method poderDePelea(personaje){
      return poderBase
   }

}

object collar {
   var cantidadDeUsosEnBatalla = 0
   const poderBase = 3

   method usar(personaje){
      cantidadDeUsosEnBatalla += 1
   }

   method poderDePelea(personaje){
      return poderBase + if (personaje.poderBase() > 6){ cantidadDeUsosEnBatalla } else {0}
   }
}

//Tipo casa

object castillo {
const artefactos = #{}
// var no es porque la estructura set nunca varia 

   method artefactosAlmacenados(){
      return artefactos
   }

   method registrarNuevosArtefactos(conjunto){
      artefactos.addAll(conjunto)
   }

   method artefactoMasPoderoso(personaje){
      return artefactos.max({artefacto => artefacto.poderDePelea(personaje)})
   }
}
//Tipo hechizo

object bendicion{
   const poderBase = 4
   method poder(personaje){
      return poderBase
   }
}

object invisibilidad {

   method poder(personaje){
      return personaje.poderBase()
   }
}

object invocacion {
   method poder(personaje){
      return personaje.casa().artefactoMasPoderoso(personaje).poderDePelea(personaje)
   }
}

//tipo mundo

object erethia{
   const property enemigos = [caterina, archibaldo, astra]

   method añadirEnemigos(conjunto) {
      enemigos.addAll(conjunto)
   }
}

//Tipo enemigo

object caterina{
   const property poderDePelea = 28
   const property morada = "fortaleza"
}

object archibaldo{
   const property poderDePelea = 16
   const property morada = "palacio"
}

object astra{
   const property poderDePelea = 14
   const property morada = "torre"
}