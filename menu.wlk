import wollok.game.*
import pacman.*
import direcciones.*
import bombasRandom.*
import bolitas.*
import spawners.*
import pacman-game.*
import fondo.*
import fantasmas.*
import mapa.*
import sonidos.*


object menu {


        

        var property juegoIniciado = false
        var property fondoDeJuego = "menuInicio.png"

        const property rojo = new FantasmaRojo (position = game.at(8, 12), imagen = "rojo.png",  fantasmaVivo = true)
        const property rosa = new FantasmaRosa (position = game.at(6, 6), imagen = "rosa.png", fantasmaVivo = true)
        const property naranja = new FantasmaNaranja (position = game.at(6, 2), imagen = "naranja.png", fantasmaVivo = true)
        const property azul = new FantasmaCeleste (position = game.at(8, 8), imagen = "azul.png",  fantasmaVivo = true, fantasmaRojo = rojo)

        method configurarControles() {
                keyboard.r().onPressDo({
                        if (pacman.estaMuerto()) {
                                self.reiniciar()
                        }
                })
                keyboard.left().onPressDo({ pacman.mover(izquierda) })
                keyboard.right().onPressDo({ pacman.mover(derecha) })
                keyboard.up().onPressDo({ pacman.mover(arriba) })
                keyboard.down().onPressDo({ pacman.mover(abajo) })
                game.onCollideDo(pacman, { elemento => elemento.chocoConPacman() })
        }

        method iniciar(){
        
        juegoIniciado = true
        const fantasmas = [rojo, rosa, naranja, azul]
        fantasmas.forEach({ fantasma => fantasma.otrosFantasmas(fantasmas) })






        game.onTick(500, rojo, { rojo.moverse() })
        game.onTick(500, rosa, { rosa.moverse() })
        game.onTick(500, naranja, { naranja.moverse() })
        game.onTick(500, azul, { azul.moverse() })

        fondoDeJuego= "fondo.jpg"
        game.addVisual(fondo)
        generadorMapa.crear()






// BOMBAS AZULES
        game.schedule(5000, { game.addVisual(new BombaRandom (position = game.at(2, 5)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(12, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(8, 4)))})

// SPAWNER DISPARADORES
        spawner.spawnearCant_Invasores(2)

        game.addVisual(rojo)
        game.addVisual(rosa)
        game.addVisual(naranja)
        game.addVisual(azul)



        
}

        method reiniciar() {
        game.clear()
        pacman.reiniciar()
        rojo.position(game.at(8, 12))
        rosa.position(game.at(6, 6))
        naranja.position(game.at(6, 2))
        azul.position(game.at(8, 8))
        [rojo, rosa, naranja, azul].forEach({ fantasma =>
                fantasma.fantasmaVivo(true)
        })
        self.iniciar()
        self.configurarControles()
        }
}
