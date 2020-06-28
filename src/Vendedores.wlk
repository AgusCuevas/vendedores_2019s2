import Geografia.*
import Clientes.*
import CentrosDeDistribucion.*

class Vendedores {
	var property certificaciones = []
	
	method certificacionesDeProductos(){
		 return certificaciones.filter({ g => g.esDeProducto()}).size()
	}
	
	method otrasCertificaciones(){
		 return certificaciones.filter({ g =>not g.esDeProducto()}).size()
	}
	
	method puntuacionDeCertificaciones(){
		return certificaciones.sum({ g => g.puntaje() })
	}
	
	method agregarCertificacion(certificacion){
		certificaciones.add(certificacion)
	}
	
	method puedeTrabajar(ciudad)
	
	method esVersatil(){
		return self.certificacionesDeProductos() >= 3 and self.otrasCertificaciones() >= 1
	}
	
	method esFirme(){
		return self.puntuacionDeCertificaciones() >= 30
	}
	
	method afinidadConElCentro(centro){
		return self.puedeTrabajar(centro.ciudad())
	}
	
	method esCandidato(centro){
		return self.esVersatil() and self.afinidadConElCentro(centro)
	}
}

class VendedorFijo inherits Vendedores{
	const property esFisico = true
	var property ciudadDondeVive
	
	override method puedeTrabajar(donde){
		return donde == ciudadDondeVive
	}
}

class Viajante inherits Vendedores{
	const property esFisico = true
	var property provinciasDondeTrabaja = []
	
	override method puedeTrabajar(donde){
		return provinciasDondeTrabaja.contains(donde.provincia())
	
	}
	
	method esInfluyente(){
		return provinciasDondeTrabaja.sum({g => g.poblacion()}) > 100000000
	}
	
}

class ComercioCorresponsal inherits Vendedores{
	const property esFisico = false
	var property ciudadesDeLasSucursales = []
	
	override method puedeTrabajar(donde){
		return ciudadesDeLasSucursales.contains(donde)
	}

	method esInfluyente(){
		return ciudadesDeLasSucursales.size() >= 5 and 
			ciudadesDeLasSucursales.map({g => g.provincia()}).asSet().size() >= 3
	}
	 override method afinidadConElCentro(centro){
	 	return super(centro) and ciudadesDeLasSucursales.contains(centro.ciudad())
	 }
}

class Certificaciones {
	var property esDeProducto
	var property puntaje
}
