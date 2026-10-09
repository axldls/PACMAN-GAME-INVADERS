import wollok.game.*
import direcciones.*
import trampas.*
import sonidos.*


object pacman {
    
    var bombas = 0

    var  property position = game.origin()
    var direccionActual = derecha

    method matar(){
        muerte.sonidoMuerte()
        game.removeVisual(self)
    }
    method text () {
        return  "=" + bombas
    }
    method image(){
        return "pacman-" + direccionActual.nombreDireccion() + ".png"
    }

    method agarrarBomba(){
        bombas += 1
    }

    method position(){
        return position
    }
    method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) 
		if (not self.hayMurosAdelante(position)) {
			position = nuevaPosition
			direccionActual = direccion
		}
	}

    method hayMurosAdelante(posicion) {
      return game.getObjectsIn(posicion).any({ objeto => objeto.esSolido() })
    }

    method ponerBomba(){
       if (bombas > 0){ 
            self.validarPosicionVacia()
            bombas -= 1
            game.addVisual(new Bomba (position = self.position()))
        }

        //

    }

    method bombasEnCelda() { return game.colliders(self) }
    
    method validarPosicionVacia() {
		if (not self.bombasEnCelda().isEmpty()) {
			self.error("Ya hay una bomba!!!")
		}
    }
}