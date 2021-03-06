import People.Informant
import People.Keeper
import People.Villain
import WorldMap.Bank
import WorldMap.Club
import WorldMap.Country
import WorldMap.Library
import junit.framework.TestCase
import WorldMap.WorldMap

class TestCountry extends TestCase{
	
	WorldMap map = new WorldMap()
	
	Country estadosUnidos = new Country("United States", map)
	Country argentina = new Country("Argentina", map)
	Country brasil = new Country("Brasil", map)
	
	Villain elGato = new Villain(
				1,
                "The Cat",
                "Male",
                #["hair white", "mustache"],
                #["Crawl", "Steal saxophones"])
                
    Informant informante = new Informant
   	Keeper cuidador = new Keeper()
   	
   	Bank banco = new Bank(informante)
   	Club club = new Club(informante)
   	Library biblioteca = new Library(informante)
   	
   	def set_up(){
   		estadosUnidos.addFeature("Flag with stars and bars")
   		estadosUnidos.addFeature("NBA")
   		estadosUnidos.addFeature("The White House")
   		estadosUnidos.addCountry(argentina)
   		estadosUnidos.addCountry(brasil)
   		estadosUnidos.addPlace(banco)
   		estadosUnidos.addPlace(club)
   		estadosUnidos.addPlace(biblioteca)
   	}
   	
   	def test_villano_pasa_por_estados_unidos(){
   		this.set_up()
   		//estadosUnidos.visitedFor(elGato)
   		
   		//val String infoClub = estadosUnidos.getPlace(1).giveInformation()
		//val clue1 = ("I saw a people with hair white" == infoClub)
		//val clue2 = ("I saw a people with mustache" == infoClub)
   		
   		//assertTrue(clue1 || clue2)
   	}
   	
}