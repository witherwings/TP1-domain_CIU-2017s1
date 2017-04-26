package WorldMap

import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import Game.GameData

@Observable
@Accessors
class WorldMap {

	List<Country> countries

	private static WorldMap instance = null

	new() {
		countries = GameData.buildCountries(this)
	}

	static def getInstance() {
		if (instance == null) {
			instance = new WorldMap
		}
		instance
	}

	def List<Country> getCountries() {
		this.countries
	}

//	def Country getCountryByName(String name) {
//		this.countries.findFirst[name == name]
//	}
	
	def Country getCountryByName(String name) {
		var i = 0 as int
		var result = null as Country
		while(i < this.countries.size){
			if(this.countries.get(i).name == name){
				result = this.countries.get(i)
				return result
			}
			else{
				i++
			}
		}
		return result
	}
	

	def addCountry(Country country) {
		this.countries.add(country)
	}

	def removeCountry(Country country) {
		this.countries.remove(country)
	}
}
