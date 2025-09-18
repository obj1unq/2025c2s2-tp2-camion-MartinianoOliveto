object knightRider {
	/*method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }*/
	const peso = 500
	const nivelDePeligrosidad = 10 
	const bultos = 1 

	method peso(){
		return peso 
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method bultos(){
		return bultos 
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}
	method accidente(){
		//no pasa nada 
	}
}
object arenaGranel{
	var peso = 0
	const nivelDePeligrosidad = 1
	const bultos = 1 
	
	method configurarPeso(valor){
		peso = valor 
	}
	method peso(){
		return peso 
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method bultos(){
		return bultos 
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}
	method accidente(){
		peso = peso + 20 
	}
}
object bumblebee{
	const peso = 800
	var estaTransformado = false 
	const bultos = 2 

	method peso(){
		return peso 
	}
	method bultos(){
		return bultos 
	}

	method nivelDePeligrosidad(){
		if(not estaTransformado){
			return 15
		}
		else{
			return 30 
		}
	}
	method transformarse(){
		estaTransformado = true 
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}
	method accidente(){
		self.transformarse()
	}
	method esRobot(){
		return estaTransformado
	}
}
object paqueteLadrillos{
	const nivelDePeligrosidad = 2 
	var cantidadPaquete = 0

	method peso(){
		return cantidadPaquete * 2 
	}
	method configurarCantidad(_cantidad){
		cantidadPaquete = _cantidad 
	}
	method cantidadPaquete(){
		return cantidadPaquete
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method bultos(){
		if(cantidadPaquete.between(1, 100)){
			return 1 
		}else if(cantidadPaquete.between(101,300)){
			return 2 
		}else{
			return 3 
		}
	}
	method pesoEsPar(){
		return self.peso() % 2 == 0 
	}
	method accidente(){
		if(cantidadPaquete <= 12){
			cantidadPaquete = 0
		}else{
			cantidadPaquete = cantidadPaquete - 12 
		}
	}
}
object bateriaAntiaerea{
	var tieneMisiles = true 

	method peso(){
		if(tieneMisiles){
			return 300 
		}
		else{
			return 200 
		}
	}

	method nivelDePeligrosidad(){
		if(tieneMisiles){
			return 100
		}
		else{
			return 0
		}
	}
	method bultos(){
		if(tieneMisiles){
			return 2
		}else{
			return 1 
		}
	}
	method descargarMisiles(){
		tieneMisiles = false 
	}
	method pesoEsPar(){
		return self.peso() % 2 == 0 
	}
	method estaCargada(){
		return tieneMisiles
	}
	method accidente(){
		tieneMisiles = false 
	}
}
object residuosRadiactivos{
	var peso = 0
	const nivelDePeligrosidad = 200
	const bultos = 1 

	method configurarPeso(valor){
		peso = valor 
	}
	method peso(){
		return peso 
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method bultos(){
		return bultos 
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}
	method accidente(){
		peso = peso + 15 
	}
}
object contenedorPortuario{
	const property cosas = #{}

	method peso(){
		if(cosas.isEmpty()){
			return 100 
		}else{
			return cosas.sum({cosa => cosa.peso()}) + 100 
		}
	}
	method nivelDePeligrosidad(){
		if(cosas.isEmpty()){
			return 0 
		}else{
			return cosas.map({cosa => cosa.nivelDePeligrosidad()}).max()
		}
	}
	method bultos(){
		return cosas.sum({cosa => cosa.bultos()}) + 1 
	}
	method cargar(unaCosa){
		if(cosas.contains(unaCosa)){
			self.error(unaCosa + "ya esta cargado")
		}else{
			cosas.add(unaCosa)
		}
	}
	method accidente(){
		cosas.forEach({cosa => cosa.accidente()})
	}
}
object embalajeSeguridad{
	//const property cosas = #{}
	var contenido = null 
	const bultos = 2 

	method peso(){
		return contenido.peso()
	}
	method nivelDePeligrosidad(){
		return contenido.nivelDePeligrosidad() / 2
	}
	method bultos(){
		return bultos 
	}
	method embalar(unaCosa){
		contenido = unaCosa
	}
	method desembalar(unaCosa){
		contenido = null 
	}
	method accidente(){
		contenido.accidente()
	}
}


