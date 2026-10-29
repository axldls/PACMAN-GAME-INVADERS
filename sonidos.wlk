import pacman.*
import wollok.game.*


object sonidos {

    method sonidoMuerte(){
        game.sound("pacman-muerte.mp3").play()
    }

    method sonidoInicio(){
        game.sound("musica_fondo.mp3").play()
    }
}