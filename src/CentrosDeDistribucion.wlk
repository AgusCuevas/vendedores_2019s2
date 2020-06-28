import Vendedores.*
import Geografia.*
import Clientes.*

class CentroDeDistribucion {
	
	var property ciudad
	var property vendedores = []
	
	method agregarTrabajador(vendedor){
		if (not vendedores.contains(vendedor)){
			vendedores.add(vendedor)
		}
		else { throw new Exception(message = "Ya trabaja aqui") }
	}
	
	method vendedorEstrella(){
		return vendedores.max({ g => g.puntuacionDeCertificaciones()})
	}
	
	method puedeCubrir(unaCiudad){
		return vendedores.any({ g => g.puedeTrabajar(unaCiudad)})
	}
	
	method vendedorGenerico(){
		return vendedores.filter( { g => g.otrasCertificaciones() >= 1 } )
	}
	
	method esRobusto(){
		return vendedores.count( { g => g.esFirme() } )
	}
	
	method entregarCertificacion(esDeproducto, puntaje){
		vendedores.forEach({ g => g.agregarCertificacion(new Certificaciones(esDeProducto = esDeproducto, puntaje = puntaje))})
	}
}
