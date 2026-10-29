import wollok.game.*
import direcciones.*
import pacman.*

class Invasor {
    var property position 
    var property direccion 

    method image() {
        return "invasor.png"
    }

    method esSolido() {
        return false
    }

    method esBomba() {
        return false
    }


    method initialize() {
        game.onTick(4000, "disparador_proyectil_" + self.identity().toString(), {self.fire()})
    }



    method fire(){
        if (game.hasVisual(pacman)) {
            const proyectil = new Proyectil(position = self.position(), direccion = direccion)
            game.addVisual(proyectil)

            game.onTick(200, "movimiento_proyectil_" + proyectil.identity().toString(), {proyectil.avanzar()})
        }
    }
    
    method matar() {
      
    }
}

class Proyectil {
  var property position
  const direccion 
  method esSolido() { return false}

  method esBomba() { return false }

  method image() {
        return "proyectil.png"
  }

    method chocoConPacman() {
        self.destruir()
        pacman.matar()
    }

  method avanzar() {
    position = if(direccion == "derecha"){
        position.right(1)
    }else{
        position.left(1)
    }

    if (position.x() < 0 or position.x() >= game.width()){
        self.destruir()
    }
  }

  method destruir() {
    if (game.hasVisual(self)) {
        game.removeVisual(self)
    }
        
    game.removeTickEvent("movimiento_proyectil_" + self.identity().toString())
        
  }
}