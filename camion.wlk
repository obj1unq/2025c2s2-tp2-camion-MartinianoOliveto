import cosas.*
const cosas = #{knightRider, arenaGranel, bumblebee, paqueteLadrillos, bateriaAntiaerea, residuosRadiactivos, contenedorPortuario, embalajeSeguridad}
const almacen =#{knightRider, residuosRadiactivos}
object camion {
	const tara = 1000 
	const property cosas = #{}
		
	method cargar(unaCosa) {
		if(cosas.contains(unaCosa)){
			self.error(unaCosa + "ya esta cargado")
		}else{
			cosas.add(unaCosa)
		}
	}
		
	method descargar(unaCosa){
		if(not cosas.contains(unaCosa)){
			self.error(unaCosa + "ya esta descargado")
		}else{
			cosas.remove(unaCosa)
		}
	}
	method todosSonPesosPares(){
	  return cosas.all({cosa => cosa.pesoEsPar()})
	}
	method hayAlgoConElPeso(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
	method pesoTotal(){
		return tara + self.pesoCarga()
	}
	method pesoCarga(){
		return cosas.sum({cosa => cosa.peso()})
	}
	method estaExcedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	method cosasConNivelDePeligrosidad(_nivelDePeligrosidad){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() == _nivelDePeligrosidad})
	}
	method cosasQueSuperanNivelDePeligrosidad(_nivelDePeligrosidad){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > _nivelDePeligrosidad})
	}
	method cosasMasPeligrosasQue(unaCosa){
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
	}
	method puedeCircularEnRuta(nivelDePeligrosidad){
		return not self.estaExcedidoDePeso() && not self.hayCosasConNivelMayorA(nivelDePeligrosidad)
	}
	method hayCosasConNivelMayorA(nivelDePeligrosidad){
		return cosas.any({cosa => cosa.nivelDePeligrosidad() > nivelDePeligrosidad})
	}
	method hayAlgoQuePesaEntre(valor1, valor2){
		return cosas.any({cosa => cosa.peso().between(valor1, valor2)})
	}
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
	method bultosTotal(){
		return cosas.sum({cosa => cosa.bultos()})
	}
	method choco(){
		cosas.forEach({cosa => cosa.accidente()})
	}
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
/* REQUERIMIENTOS DEL CAMION 

CARGAR: poder cargar una cosa --YA ESTA HECHO 
DESCARGAR: poder descargar una cosa 
NO SE PUEDE CARGAR ALGO YA CARGADO Y DESCARGAR ALGO YA DESCARGADO 
////////////CARGA Y DESCARGA HECHO; CON EXCEPCIONES//////////////////////////////////

PESO PAR: saber si el peso de cada uno de los objetos cargados es par ////////////HECHO 

PODER IDENTIFICAR SI EL CAMION TIENE ALGO CARGADO CON EL PESO DADO ////////////////HECHO 

PESO: saber el peso total del camion : tara (1000kgs) + pesoCarga ///// HECHO 

EXCESO DE PESO: se excede si el peso total es superior al aceptable (2500kgs)///// HECHO 

NIVEL: encontrar una cosa cargada cuyo nivel de peligrosidad sea el dado /////HECHO 

COSAS PELIGROSAS: encontrar cosas cargadas que tengan cierto nivel de peligrosidad
				encontrar cosas cargadas que sean mas peligrosas que la cosa 
				indicada //////REUTILIZAR CODIGO///////
				/////////////////HECHO////////////////////

CIRCULAR EN RUTA: saber si puede circular(no esta excedido de peso y ninguno de 
					los objetos cargados supera el nivel maximo de peligrosidad ///////// HECHO 

CONTENEDOR PORTUARIO: puede tener cosas adentro, su peso es 100  + las cosas 
						es tan peligroso como el objeto mas peligroso que 
						contiene. Vacio; peligrosidad = 0  /////////HECHO 
EMBALAJE : UN SET QUE SOLO PUEDE CONTENER UN ELEMENTO? //////HECHO

SABER SI TIENE ALGO QUE PESA ENTRE DOS VALORES ///////////// HECHO 

COSA MAS PESADA EN EL CAMION //////////////HECHO 

SABER TODOS LOS PESOS DEL CAMION ///////////////////HECHO 

TOTAL DE BULTOS  //////////////HECHO

ACCIDENTE ////////////////////HECHO

TRANSPORTE: CAMION DEBE ENTENDER TRANSPORTAR(DESTINO, CAMINO)
CAMINOS: 
	RUTA 9: SOPORTA VIAJES SEGUN EL REQUERIMIENTO PUEDE CIRCULAR EN RUTA CON UN NIVEL DE PELIGROSIDAD 20
	CAMINOS VECINALES: VIAJES DE VEHICULOS QUE NO SUPEREN UN MAXIMO CONFIGURABLE
							SE DEBEN REALIZAR VALIDACIONES 
*/