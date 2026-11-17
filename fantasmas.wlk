import wollok.game.*
import pacman.*
import direcciones.*

class Fantasma {
    var property imagen
    var property fantasmaVivo
    var property position
    var property otrosFantasmas = []

    method morir() {
        fantasmaVivo = false
        game.removeVisual(self)
    }
    method chocoConPacman() {
        if (not pacman.estaMuerto()) {
            if (pacman.pacmanFuerte()) {
                self.morir()
            } else {
                pacman.matar()
            }
        }
    }

    method image() {
        return imagen
    }

    method esSolido() {
        return false
    }

    method esBomba() {
        return false
    }

    method moverse()

    method moverseHacia(objetivo) {
        const diferenciaX = objetivo.x() - position.x()
        const diferenciaY = objetivo.y() - position.y()
        const distanciaX = if (diferenciaX >= 0) diferenciaX else -diferenciaX
        const distanciaY = if (diferenciaY >= 0) diferenciaY else -diferenciaY

        if (distanciaX != 0 or distanciaY != 0) {
            const horizontal = if (diferenciaX >= 0) derecha else izquierda
            const vertical = if (diferenciaY >= 0) arriba else abajo
            const direccionesPrioritarias = if (distanciaX >= distanciaY) {
                [horizontal, vertical, horizontal.opuesta(), vertical.opuesta()]
            } else {
                [vertical, horizontal, vertical.opuesta(), horizontal.opuesta()]
            }
            self.moverEnLaPrimeraDireccionPosible(direccionesPrioritarias)
        }
    }

    method moverEnLaPrimeraDireccionPosible(direcciones) {
        var seMovio = false
        direcciones.forEach({ direccion =>
            if (not seMovio and self.puedeMover(direccion)) {
                position = direccion.siguiente(position)
                seMovio = true
            }
        })
    }

    method hayFantasmaEn(posicion) {
        return otrosFantasmas.any({ fantasma =>
            fantasma != self and fantasma.fantasmaVivo() and fantasma.position() == posicion
        })
    }

    method puedeMover(direccion) {
        if (not direccion.esValidaDesde(position)) {
            return false
        }

        const siguiente = direccion.siguiente(position)
        return not self.hayFantasmaEn(siguiente) and
            not game.getObjectsIn(siguiente).any({ objeto => objeto.esSolido() })
    }
}

class FantasmaRojo inherits Fantasma {
    override method moverse() {
        self.moverseHacia(pacman.position())
    }
}

class FantasmaRosa inherits Fantasma {
    override method moverse() {
        const posicionPacman = pacman.position()
        const direccionPacman = pacman.direccionActual()
        const objetivo = direccionPacman.avanzarHasta(posicionPacman, 4)
        self.moverseHacia(objetivo)
    }
}

class FantasmaCeleste inherits Fantasma {
    var property fantasmaRojo

    override method moverse() {
        const posicionPacman = pacman.position()
        const direccionPacman = pacman.direccionActual()
        const puntoDelante = direccionPacman.avanzarHasta(posicionPacman, 2)
        const posicionRojo = fantasmaRojo.position()
        const objetivo = game.at(
            puntoDelante.x() * 2 - posicionRojo.x(),
            puntoDelante.y() * 2 - posicionRojo.y()
        )
        self.moverseHacia(objetivo)
    }
}

class FantasmaNaranja inherits Fantasma {
    override method moverse() {
        const posicionPacman = pacman.position()
        const diferenciaX = posicionPacman.x() - position.x()
        const diferenciaY = posicionPacman.y() - position.y()
        const distanciaX = if (diferenciaX >= 0) diferenciaX else -diferenciaX
        const distanciaY = if (diferenciaY >= 0) diferenciaY else -diferenciaY

        if (distanciaX + distanciaY > 6) {
            self.moverseHacia(posicionPacman)
        } else {
            self.moverseHacia(game.at(0, 0))
        }
    }
}
