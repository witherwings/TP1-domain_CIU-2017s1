import Game.GameData
import Game.Player
import junit.framework.TestCase

class TestCaseFile extends TestCase {
	
	GameData game = new GameData
	Player jugador = new Player(this.game.getCase(), this.game.getRobCountry())
	
    def testVisitBank() {
    	//this.jugador = new Player(this.game.getCase(), this.game.getRobCountry())
    	
    	this.jugador.travelTo(this.game.getCountry("Chile"))
        this.jugador.visit(0)// visita el banco
       	val infoBanco = this.jugador.getInfo()
       	println(infoBanco)
       	assertEquals(1,1)
    }
}