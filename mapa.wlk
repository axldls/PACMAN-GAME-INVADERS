import muro.*
import wollok.game.*
import pacman.*
import bombasRandom.*
import spawners.*
import bolitas.*
import fantasmas.*

object generadorMapa {
  var property rojo = new FantasmaRojo(position = game.at(0, 0), imagen = "rojo.png", fantasmaVivo = true)
  var property rosa = new FantasmaRosa(position = game.at(0, 0), imagen = "rosa.png", fantasmaVivo = true)
  var property naranja = new FantasmaNaranja(position = game.at(0, 0), imagen = "naranja.png", fantasmaVivo = true)
  var property azul = new FantasmaCeleste(position = game.at(0, 0), imagen = "azul.png", fantasmaVivo = true, fantasmaRojo = rojo)

  var property diseño = [
    "####################",
    "#     B  Br B  B   #",
    "#BP B #B  B  #   P #",
    "# B  B# B  B #   B #",
    "#  B  B  B     B   #",
    "#B### ####B#### ## #",
    "# B     B  B  BB   #",
    "#  B  # BB  B#    s#",
    "#B  BB#B     #B B  #",
    "#nB  B   a B  B  B #",
    "# ### #### ####B## #",
    "#B  B  B  B   B B  #",
    "# B  B# B  B #B  B #",
    "#   B #  B  B# B   #",
    "#B  B  B  B     B  #",
    "# ###B#### #### ## #",
    "#  B  #  B   # B  B#",
    "#BP B #   B  #  BP #",
    "#1BB    B  BB B    #",
    "####################"
  ]

  method crear() {
    (0 .. 19).forEach{ fila =>
      (0 .. 19).forEach{ x =>
        const y = 19 - fila
        const caracter = diseño.get(fila).charAt(x)
        if (caracter == "#") {game.addVisual(new Muro(position = game.at(x, y)))}
        if ( caracter == "B") {game.addVisual(new Bolita(position = game.at(x, y)))} 
        if (caracter == "1") {game.addVisual(pacman)}
        if (caracter == "P"){game.addVisual(new BolitaPoderosa(position= game.at(x, y)))}
        if (caracter == "r") {
          rojo = new FantasmaRojo(position = game.at(x, y), imagen = "rojo.png", fantasmaVivo = true)
          game.addVisual(rojo)
        }
        if (caracter == "s") {
          rosa = new FantasmaRosa(position = game.at(x, y), imagen = "rosa.png", fantasmaVivo = true)
          game.addVisual(rosa)
        }
        if (caracter == "n") {
          naranja = new FantasmaNaranja(position = game.at(x, y), imagen = "naranja.png", fantasmaVivo = true)
          game.addVisual(naranja)
        }
        if (caracter == "a") {
          azul = new FantasmaCeleste(position = game.at(x, y), imagen = "azul.png", fantasmaVivo = true, fantasmaRojo = rojo)
          game.addVisual(azul)
        }
      }
    }
    
  }
}