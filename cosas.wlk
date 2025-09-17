object knightRider {
	/*method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }*/
	const peso = 500
	const nivelDePeligrosidad = 10 

	method peso(){
		return peso 
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}
}
object arenaGranel{
	var peso = 0
	const nivelDePeligrosidad = 1
	
	method configurarPeso(valor){
		peso = valor 
	}
	method peso(){
		return peso 
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}

}
object bumblebee{
	const peso = 800
	var estaTransformado = false 

	method peso(){
		return peso 
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
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method pesoEsPar(){
		return self.peso() % 2 == 0 
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
	method descargarMisiles(){
		tieneMisiles = false 
	}
	method pesoEsPar(){
		return self.peso() % 2 == 0 
	}
}
object residuosRadiactivos{
	var peso = 0
	const nivelDePeligrosidad = 200

	method configurarPeso(valor){
		peso = valor 
	}
	method nivelDePeligrosidad(){
		return nivelDePeligrosidad
	}
	method pesoEsPar(){
		return peso % 2 == 0 
	}
}


