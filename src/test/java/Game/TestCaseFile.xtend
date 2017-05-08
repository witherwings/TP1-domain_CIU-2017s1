package Game

import People.Villain
import WorldMap.Country
import WorldMap.WorldMap
import java.util.ArrayList
import junit.framework.TestCase
import java.util.List
import java.util.Arrays
import org.junit.Before
import org.junit.Test

class TestCaseFile extends TestCase {

	def CaseFile set_up() {
		var map = new WorldMap()
		var signs = new ArrayList<String>(Arrays.asList("es un invento", "tiene barba"))
		var hobbies = new ArrayList<String>(Arrays.asList("tocar la guitarra", "tomar cerveza artesanal"))
		var villain = new Villain(1, "Pepe", "Masculino", signs, hobbies)
		var mystery = new CaseFile("El caso de test")

		mystery.addVillain(villain)
		mystery.addCountryRobbed(map.getCountryByName("Egipto"))
		mystery.addCountryEscape(map.getCountryByName("Italia"))
		mystery.addCountryEscape(map.getCountryByName("China"))

		return mystery
	}

	@Test
	def test_getCheckPossibleNextCountry() {
		var mystery = set_up
		var country = mystery.getPossibleNextCountry();

		assertTrue(country.name == "Italia")
	}

}
