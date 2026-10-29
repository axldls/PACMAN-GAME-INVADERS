import wollok.game.*
class Bomba {


    const property position

    method image (){
        return "bomba.png"
    }

    method esSolido() { return false}

    method esBomba() { return true }

    method chocoConPacman() {}

    method chocoConFantasma() {
        game.removeVisual(self)
    }
    
}
