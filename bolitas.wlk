import wollok.game.*
import pacman.*
class Bolita{
    var property position 

    method image() {
      return "bolita.png"
    }

    method chocoConPacman() {
      game.removeVisual(self)
      pacman.sumarPunto()
    }
    method chocoCon(){}
    method esSolido() { return false}

    method esBomba() { return false }

    method matar(){
      
    }
} 

class BolitaPoderosa inherits Bolita {

  override method chocoConPacman(){
    super()
    pacman.hacerFuerte()
  }

  override method image(){
    return "bolitaPoderosa.png"
  }
}