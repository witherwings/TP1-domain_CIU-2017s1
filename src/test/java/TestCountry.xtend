import People.*
import WorldMap.*
import junit.framework.TestCase

class TestCountry extends TestCase{
	
	Country argentina = new Country("Argentina")
	Country brasil = new Country("Brasil")
	
	def testCreateCountryWithInformation(){
		argentina.addFeature("Bandera celeste y blanca")
		
		val featuresArg = argentina.getFeatures()
		
		assertTrue(featuresArg.contains("Bandera celeste y blanca"))
	}
	
	
	
   	
}