import Game.GameData
import Game.Player
import junit.framework.TestCase

class TestCaseFile extends TestCase {
	
	GameData game
	Player jugador
	
    def testVisitBank() {
    	this.game = new GameData()
    	this.jugador = new Player(this.game.getCase(), this.game.getRobCountry())
    	
    	this.jugador.travelTo(this.game.getCountry("Argentina"))
        this.jugador.visit(0)// visita el banco
       	val infoBanco = this.jugador.getInfo()
       	val infoEsperadaBanco = "Vi una persona que Tiene pelo blanco y se fue para un pais que tiene Bandera verde"
       	assertEquals(infoEsperadaBanco,infoBanco)
    }
}