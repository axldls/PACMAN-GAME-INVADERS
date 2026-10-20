import wollok.game.*
import pacman.*
import direcciones.*

class Fantasma {

    var property imagen
    var property pacmanFuerte 
    var property fantasmaVivo 
    var property position
    

    method morir(){
        game.removeVisual(self)
    }

    method chocoConPacman(){if(pacmanFuerte){self.morir()}else{pacman.matar()}}

    method image(){return imagen}
    
    method moverse(){
        
    }
}