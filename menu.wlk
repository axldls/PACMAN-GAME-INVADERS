import wollok.game.*
import pacman.*
import bombasRandom.*
import bolitas.*
import spawners.*
import pacman-game.*
import fondo.*
import fantasmas.*
import muro.*


object menu {


        

        var property juegoIniciado = false
        var property fondoDeJuego = "menuInicio.png"

        const property rojo = new FantasmaRojo (position = game.at(10, 12), imagen = "rojo.png", pacmanFuerte = false, fantasmaVivo = true)
        const property rosa = new FantasmaRosa (position = game.at(6, 6), imagen = "rosa.png", pacmanFuerte = false, fantasmaVivo = true)
        const property naranja = new FantasmaNaranja (position = game.at(2, 2), imagen = "naranja.png", pacmanFuerte = false, fantasmaVivo = true)
        const property azul = new FantasmaCeleste (position = game.at(8, 8), imagen = "azul.png", pacmanFuerte = false, fantasmaVivo = true, fantasmaRojo = rojo)

        method iniciar(){
        const fantasmas = [rojo, rosa, naranja, azul]
        fantasmas.forEach({ fantasma => fantasma.otrosFantasmas(fantasmas) })

        // BOLITAS

        const bolita1 = new Bolitas(position = game.at(8, 8))
        const bolita2 = new Bolitas(position = game.at(6, 2))
        const bolita3 = new Bolitas(position = game.at(2, 2))
        const bolita4 = new Bolitas(position = game.at(6, 6))
        const bolita5 = new Bolitas(position = game.at(10, 6))
        const bolita6 = new Bolitas(position = game.at(4, 8))
        const bolita7 = new Bolitas(position = game.at(8, 4))
        const bolita8 = new Bolitas(position = game.at(14, 10))
        const bolita9 = new Bolitas(position = game.at(10, 6))
        const bolita10 = new Bolitas(position = game.at(12, 12))


        game.onTick(500, rojo, { rojo.moverse() })
        game.onTick(500, rosa, { rosa.moverse() })
        game.onTick(500, naranja, { naranja.moverse() })
        game.onTick(500, azul, { azul.moverse() })

        fondoDeJuego= "fondo.jpg"
        juegoIniciado = true
        game.addVisual(fondo)
        generadorMapa.crear()

//MUSICA DE FONDO
        const musicaFondo = game.sound("musica_fondo.mp3")
        musicaFondo.shouldLoop(true)
        game.schedule(300, { musicaFondo.play()} )

  (0..14).forEach({ x => game.addVisual(new Muro(position = game.at(x, 14))) })
  (0..14).forEach({ x => game.addVisual(new Muro(position = game.at(x, 0))) })
  (0..14).forEach({ y => game.addVisual(new Muro(position = game.at(0, y))) })
  (0..14).forEach({ y => game.addVisual(new Muro(position = game.at(14, y))) })


// BOMBAS AZULES
        game.schedule(5000, { game.addVisual(new BombaRandom (position = game.at(2, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(12, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(10, 10)))})

// SPAWNER DISPARADORES
   //    spawner.spawnearCant_Invasores(2)

// COLISIONES 
        game.onCollideDo(pacman, {elemento => elemento.chocoConPacman()})
        game.addVisual(rojo)
        game.addVisual(rosa)
        game.addVisual(naranja)
        game.addVisual(azul)
        game.addVisualCharacter(pacman)
        game.addVisual(bolita1)
        game.addVisual(bolita2)
        game.addVisual(bolita3)
        game.addVisual(bolita4)
        game.addVisual(bolita5)
        game.addVisual(bolita6)
        game.addVisual(bolita7)
        game.addVisual(bolita8)
        game.addVisual(bolita9)
        game.addVisual(bolita10)
}
}