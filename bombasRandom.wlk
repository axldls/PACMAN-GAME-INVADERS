import wollok.game.*
import pacman.*
class BombaRandom{
    
    var property position = game.origin()
    method image(){
        return "bombaRandom.png"
    }
    method chocoConPacman(){
        game.removeVisual(self)
        pacman.agarrarBomba()
    }

    method esSolido() { return false}

    method esBomba() { return false }

    method matar() {}
}