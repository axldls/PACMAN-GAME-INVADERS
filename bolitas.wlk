import wollok.game.*
import pacman.*
class Bolitas{
    var property position 

    method image() {
      return "bolita.png"
    }

    method chocoConPacman() {
      game.removeVisual(self)
      pacman.sumarPunto()
    }

    method esSolido() { return false}

    method matar(){}// No hace nada, las bolitas no puede ser destruidas

} 