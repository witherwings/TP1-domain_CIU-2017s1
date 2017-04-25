import Game.GameData
import Game.Player
import junit.framework.TestCase

class TestCaseFile extends TestCase {
	
	GameData game = new GameData
	Player jugador = new Player(this.game.getCase(), this.game.getRobCountry())
	
    def testVisitFirstCountryBrasil() {
    	/*
    	 * Visito un pais(Brasil) que tiene conexion con el actual(Argentina), 
    	 * cada lugar me dice los datos correspondientes al villano.
    	 */
    	this.jugador.travelTo(this.game.getCountry("Brasil"))
        this.jugador.visit(0)// visita el banco
       	val infoBanco = this.jugador.getInfo()
       	this.jugador.visit(1)// visita la biblioteca
       	val infoLibrary = this.jugador.getInfo()
       	this.jugador.visit(2)// visita la embajada
       	val infoEmbassy = this.jugador.getInfo()
       	println(infoBanco)
       	println(infoLibrary)
       	println(infoEmbassy)
       	assertEquals(1,1)
    }
    
    def testVisitSecondEstadosUnidos() {
    	/*
    	 * Quiero visitar un pais(Francia) que no tiene conexion con el actual(Argentina).
    	 */
    	this.jugador.travelTo(this.game.getCountry("Francia"))
    	println(this.jugador.countryName)//Argentina
       	assertEquals(1,1)
    }
    
    def testVisitOneCountryFail() {
    	/*
    	 * Visito un pais(Francia) por el cual no paso el villano
    	 */
    	this.jugador.travelTo(this.game.getCountry("Estados Unidos"))
    	this.jugador.travelTo(this.game.getCountry("Francia"))
    	this.jugador.visit(0)// visita el banco
       	val infoBanco = this.jugador.getInfo()
       	this.jugador.visit(1)// visita la biblioteca
       	val infoLibrary = this.jugador.getInfo()
       	this.jugador.visit(2)// visita el club
       	val infoClub = this.jugador.getInfo()
       	println(infoBanco)
       	println(infoLibrary)
       	println(infoClub)
       	assertEquals(1,1)
    }
    
    def testVisitChileAndAnEncounterWithVillain() {
    	/*
    	 * Visito un pais(Chile) con conexion, y ademas encuentro al villano.
    	 */
    	this.jugador.travelTo(this.game.getCountry("Chile"))
    	this.jugador.visit(0)// visita el banco
       	val infoBanco = this.jugador.getInfo()
       	this.jugador.visit(1)// visita la biblioteca
       	val infoLibrary = this.jugador.getInfo()
       	this.jugador.visit(2)// visita el club
       	val infoClub = this.jugador.getInfo()
       	println(infoBanco)
       	println(infoLibrary)
       	println(infoClub)
       	assertEquals(1,1)
    }
}