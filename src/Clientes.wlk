import Vendedores.*
import Geografia.*
import CentrosDeDistribucion.*

object clienteInseguro{
	method puedeSerAtendidoPor(vendedor){
		return vendedor.esVersatil() and vendedor.esFirme()
	}
}

object clienteDetallista{
	method puedeSerAtendidoPor(vendedor){
		return vendedor.certificacionesDeProductos() >= 3
	}
}

object clienteHumanista{
	method puedeSerAtendidoPor(vendedor){
		return vendedor.esFisico()
	}
}
