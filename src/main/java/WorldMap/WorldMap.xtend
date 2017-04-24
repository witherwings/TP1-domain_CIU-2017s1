package WorldMap

import java.util.List
import java.util.ArrayList
import People.Informant
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class WorldMap {
	
	List<Country> countries
	
	private static WorldMap instance = null
	
	new(){
		val arg = new Country("Argentina", this) => [
            addFeature("Toman mate")
            addFeature("Hogar de Messi")
            addPlace(new Bank(new Informant("una pista")))
            addPlace(new Embassy(new Informant("una pista")))
            addPlace(new Library(new Informant("una pista")))
        ]
        val usa = new Country("Estados Unidos", this) => [
            addFeature("Esta Donald Trump")
            addFeature("Super bowl")
            addPlace(new Bank(new Informant("una pista")))
            addPlace(new Embassy(new Informant("una pista")))
            addPlace(new Library(new Informant("una pista")))

        ]
        val nor = new Country("Noruega", this) => [
            addFeature("Hace frio")
            addFeature("Altas rubias")
            addPlace(new Bank(new Informant("una pista")))
            addPlace(new Embassy(new Informant("una pista")))
            addPlace(new Club(new Informant("una pista")))

        ]

        arg.addCountry(usa)
        usa.addCountry(nor)
        nor.addCountry(arg)

        this.countries = new ArrayList<Country>() => [
            add(arg)
            add(usa)
            add(nor)
        ]
	}
	
	static def getInstance() {
		if (instance == null) {
			instance = new WorldMap
		}
		instance
	}
	
	def List<Country> getCountries(){
		this.countries
	}
	
	def addCountry(Country country){
		this.countries.add(country)
	}
	
	def removeCountry(Country country){
		this.countries.remove(country)
	}
	
}