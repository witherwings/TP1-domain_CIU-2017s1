import Game.GameData
import Game.Player
import junit.framework.TestCase

class TestCaseFile extends TestCase {
	
	GameData game
	Player jugador
	
    def testRunACase() {
    	this.game = new GameData()
    	this.jugador = new Player(this.game.getCase(), this.game.getRobCountry())
    	
    	this.jugador.travelTo(this.game.getCountry("Argentina"))
        this.jugador.visit(0)// visita el banco
       	val info = this.jugador.getInfo()
       	println(info)
       	assertEquals(1,1)
    }
}