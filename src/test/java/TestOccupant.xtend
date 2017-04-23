import junit.framework.TestCase
import People.*
import Game.GameData
import WorldMap.Bank
import junit.framework.Test
import java.lang.management.GarbageCollectorMXBean

class TestOccupant extends TestCase{
	GameData gD = new GameData()
	Villain villano = gD.acme_list(0)//villano el Gato
	Informant informante = new Informant(villano)
	Bank banco = new Bank(informante)
	
	def testVillano(){
		assertEquals("El Gato", villano.getName())
		assertEquals("Masculino", villano.getGender())
		assertEquals(#["Tiene pelo blanco", "Vive en el asilo de ancianos"], villano.getSigns())
		assertEquals(#["Gatear", "Robar saxofones"], villano.getHobbies())
	}
	
	def testCommonPlaceAndInformant(){
		banco.setInfoOccupant(villano)
		val info = banco.giveInformation()
		println(info)
	}
}