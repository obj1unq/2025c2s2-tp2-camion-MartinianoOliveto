import cosas.*
const cosas = #{knightRider, arenaGranel, bumblebee, paqueteLadrillos, bateriaAntiaerea, residuosRadiactivos, contenedorPortuario, embalajeSeguridad}
const almacen =#{knightRider, residuosRadiactivos}
object camion {
	const tara = 1000 
	const property cosas = #{}
	//carga	
	method cargar(unaCosa) {
		if(cosas.contains(unaCosa)){
			self.error(unaCosa + "ya esta cargado")
		}else{
			cosas.add(unaCosa)
		}
	}
	//descarga
	method descargar(unaCosa){
		if(not cosas.contains(unaCosa)){
			self.error(unaCosa + "ya esta descargado")
		}else{
			cosas.remove(unaCosa)
		}
	}
	//todo peso par 
	method todosSonPesosPares(){
	  return cosas.all({cosa => cosa.pesoEsPar()})
	}
	//hay alguno que pesa 
	method hayAlgoConElPeso(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
	//peso total camion y exceso de peso 
	method pesoTotal(){
		return tara + self.pesoCarga()
	}
	method pesoCarga(){
		return cosas.sum({cosa => cosa.peso()})
	}
	method estaExcedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	//el de nivel
	method cosasConNivelDePeligrosidad(_nivelDePeligrosidad){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() == _nivelDePeligrosidad})
	}
	//cosas que superan cierto nivel 
	method cosasQueSuperanNivelDePeligrosidad(_nivelDePeligrosidad){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > _nivelDePeligrosidad})
	}
	//cosas mas peligrosas que una cierta cosa 
	method cosasMasPeligrosasQue(unaCosa){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
	}
	//puede circular en ruta 
	method puedeCircularEnRuta(nivelDePeligrosidad){
		return not self.estaExcedidoDePeso() && not self.hayCosasConNivelMayorA(nivelDePeligrosidad)
	}
	method hayCosasConNivelMayorA(nivelDePeligrosidad){
		return cosas.any({cosa => cosa.nivelDePeligrosidad() > nivelDePeligrosidad})
	}
	//algo que pesa entre 2 valores 
	method hayAlgoQuePesaEntre(valor1, valor2){
		return cosas.any({cosa => cosa.peso().between(valor1, valor2)})
	}
	//cosa mas pesada -- hacer validacion 
	method cosaMasPesada(){
		if(cosas.isEmpty()){
			self.error("No se puede calcular la cosa mas pesada ")
		}else{
			return cosas.max({cosa => cosa.peso()})
		}
		
	}
	//saber todos los pesos 
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
	//calcular total de bultos 
	method bultosTotal(){
		return cosas.sum({cosa => cosa.bultos()})
	}
	//accidente 
	method choco(){
		cosas.forEach({cosa => cosa.accidente()})
	}
	//transporte 
	method transportar(destino, camino){
		if(camino.puedeCircular()){
			cosas.forEach({cosa => destino.add(cosa)})
			cosas.clear()
		}else{
			self.error("No se puede circular por " + camino)
		}
	}
}
object ruta9{
	method puedeCircular(){
		return camion.puedeCircularEnRuta(20)
	}
}
object caminosVecinales{	
	var pesoMaxPermitido = 0 

	method configurarPesoMax(valor){
		pesoMaxPermitido = valor 
	}
	method puedeCircular(){
		return camion.pesoTotal() <= pesoMaxPermitido
	}

}
