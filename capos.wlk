// capos.wlk
// capos.wlk
// capos.wlk
// capos.wlk
object rolando {
    var capacidad = 2
    var mochila = #{}

 method encontrar(artefacto) {
    if (capacidad >= (mochila.size() + 1)) {
        self.guardar(artefacto)
    }
 }

 method validarTengoEspacio(){ //no parece necesario porque debo poder aumentar la capacidad
    if (capacidad >= (mochila.size() + 1)) {
        self.error("No tiene suficiente espacio en la mochila")
    }
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
}

//tipo artifacto

object espada{

}

object libro{

}

object armadura {
  
}

object collar {

}