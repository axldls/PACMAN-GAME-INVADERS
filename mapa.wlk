import muro.*
import wollok.game.*
import pacman.*
import bombasRandom.*
import spawners.*
import bolitas.*

object generadorMapa {
  var property diseño = [
    "####################",
    "#BBPBBBBBBBBBBBBBBB#",
    "#B####BBB##BBB####B#",
    "#B####BBB##BBB####B#",
    "#BBBBBBBBBPBBBBBBBB#",
    "#PBBB##########BBBB#",
    "#BBBB##########BBBB#",
    "##BBBBBB####BBBBBB##",
    "##BPBBBB####BBBBBB##",
    "#BBBB##BBBBBB##BPBB#",
    "#BBBB##########BBBB#",
    "#BBBB##########BBBB#",
    "#BBBBBBPBBBBBBBBBBB#",
    "#B####BBB##BBB####B#",
    "#BBB##BBB##BBB####B#",
    "##BBB#BBBBBBBB##BBB#",
    "##BB##B##########B##",
    "#BBBBBBBBBBBBBBBPBB#",
    "#1BBBBBBBBBBBBBBBBB#",
    "####################"
  ]

  method crear() {
    (0 .. 19).forEach{ y =>
      (0 .. 19).forEach{ x =>
        const caracter = diseño.get(19 - y).charAt(x)
        if (caracter == "#") {
          game.addVisual(new Muro(position = game.at(x, y)))
        }if ( caracter == "B") {
          game.addVisual(new Bolita(position = game.at(x, y)))
        }if (caracter == "1") {game.addVisual(pacman)}
        if (caracter == "P"){game.addVisual(new BolitaPoderosa(position= game.at(x, y)))}
      }
    }
    
  }
}