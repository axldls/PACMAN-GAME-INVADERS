import wollok.game.*
import direcciones.*
import trampas.*
import sonidos.*
import menuMuerte.*
import menuGanador.*

object pacman {
    
    var puntos = 0
    var bombas = 0
    var  property position = game.at(1, 1)
    var direccionActual = derecha

    method ganar(){if(puntos == 10000){
            game.addVisual(menuGanador)
            game.removeVisual(self)
        }
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

    method sumarPunto(){
        puntos += 1000
        self.ganar()
    }

    method direccionActual() {
        return direccionActual
    }

    method esSolido() {
        return false
    }

    method esBomba() {
        return false
    }

    method mover(direccion) {
        if (direccion.esValidaDesde(position)) {
            const nuevaPosition = direccion.siguiente(position)
            if (not self.hayMurosAdelante(nuevaPosition)) {
                position = nuevaPosition
                direccionActual = direccion
            }
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
        method matar(){
        muerte.sonidoMuerte()
        game.removeVisual(self)
        bombas = 0
        game.addVisual(menu)
    }
}