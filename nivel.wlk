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
import menuGanador.*


object nivel {


        

        var property juegoIniciado = false
        var property fondoDeJuego = "menuInicio.png"

        method configurarControles() {
                keyboard.num1().onPressDo({
                        if (not juegoIniciado) {
                                self.iniciar()
                                sonidos.sonidoInicio()
                        }
                })
                keyboard.enter().onPressDo({
                        if (game.hasVisual(menuGanador)) self.volverAlMenuInicio()
                })
                keyboard.r().onPressDo({ if (pacman.estaMuerto()) self.reiniciar() })
                keyboard.left().onPressDo({ pacman.mover(izquierda) })
                keyboard.right().onPressDo({ pacman.mover(derecha) })
                keyboard.up().onPressDo({ pacman.mover(arriba) })
                keyboard.down().onPressDo({ pacman.mover(abajo) })
                keyboard.b().onPressDo({ pacman.ponerBomba() })
                game.onCollideDo(pacman, { elemento => elemento.chocoConPacman() })
        }



        method iniciar(){
        
        juegoIniciado = true
        fondoDeJuego= "fondo.jpg"
        game.addVisual(fondo)
        generadorMapa.crear()

        const rojo = self.rojo()
        const rosa = self.rosa()
        const naranja = self.naranja()
        const azul = self.azul()
        const fantasmas = [rojo, rosa, naranja, azul]
        fantasmas.forEach({ fantasma => fantasma.otrosFantasmas(fantasmas) })

        game.onTick(500, rojo, { rojo.moverse() })
        game.onTick(500, rosa, { rosa.moverse() })
        game.onTick(500, naranja, { naranja.moverse() })
        game.onTick(500, azul, { azul.moverse() })

// BOMBAS AZULES
        game.schedule(2000, { game.addVisual(new BombaRandom (position = game.at(6, 8)))})
        game.schedule(2000,{ game.addVisual(new BombaRandom (position = game.at(14, 10)))})
        game.schedule(2000,{ game.addVisual(new BombaRandom (position = game.at(8, 6)))})

// SPAWNER DISPARADORES
        spawner.spawnearCant_Invasores(2)
        
}

        method rojo() { return generadorMapa.rojo() }
        method rosa() { return generadorMapa.rosa() }
        method naranja() { return generadorMapa.naranja() }
        method azul() { return generadorMapa.azul() }

        method volverAlMenuInicio() {
                game.clear()
                pacman.reiniciar()
                juegoIniciado = false
                fondoDeJuego = "menuInicio.png"
                game.boardGround(fondoDeJuego)
                self.configurarControles()
        }

        method reiniciar() {
        game.clear()
        pacman.reiniciar()
        self.iniciar()
        self.configurarControles()
        }
}
