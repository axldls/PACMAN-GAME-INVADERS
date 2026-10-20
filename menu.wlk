import wollok.game.*
import pacman.*
import bombasRandom.*
import spawners.*
import pacman-game.*
import fondo.*
import fantasmas.*


object menu {


        

        var property juegoIniciado = false
        var property fondoDeJuego = "menuInicio.png"

        const property rojo = new Fantasma (position = game.at(10, 12), imagen = "rojo.png", pacmanFuerte = false, fantasmaVivo = true)
        const property rosa = new Fantasma (position = game.at(6, 6), imagen = "rosa.png", pacmanFuerte = false, fantasmaVivo = true)
        const property naranja = new Fantasma (position = game.at(2, 2), imagen = "naranja.png", pacmanFuerte = false, fantasmaVivo = true)
        const property azul = new Fantasma (position = game.at(8,8), imagen = "azul.png", pacmanFuerte = false, fantasmaVivo = true)

        method iniciar(){
        
        game.onTick(100, rojo, rojo.moverse())
        game.onTick(100, rosa, rosa.moverse())
        game.onTick(100, naranja, naranja.moverse())
        game.onTick(100, azul, azul.moverse())

        fondoDeJuego= "fondo.jpg"
        juegoIniciado = true
        game.addVisual(fondo)

//MUSICA DE FONDO
        const musicaFondo = game.sound("musica_fondo.mp3")
        musicaFondo.shouldLoop(true)
        game.schedule(300, { musicaFondo.play()} )




// BOMBAS AZULES
        game.schedule(5000, { game.addVisual(new BombaRandom (position = game.at(2, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(12, 10)))})
        game.schedule(5000,{ game.addVisual(new BombaRandom (position = game.at(10, 10)))})

// SPAWNER DISPARADORES
        spawner.spawnearCant_Invasores(2)

// COLISIONES 
        game.onCollideDo(pacman, {elemento => elemento.chocoConPacman()})
        game.addVisual(rojo)
        game.addVisual(rosa)
        game.addVisual(naranja)
        game.addVisual(azul)
        game.addVisualCharacter(pacman)
}
}