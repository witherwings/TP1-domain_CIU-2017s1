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
		this.countries = GameData.buildCountries(this)
	}

	static def getInstance() {
		if (instance === null) {
			instance = new WorldMap
		}
		return instance
	}

	def List<Country> getCountries() {
		this.countries
	}

	def Country getCountryByName(String name) {
		this.countries.filter[country|country.name == name].get(0)
	}	

	def addCountry(Country country) {
		this.countries.add(country)
	}

	def removeCountry(Country country) {
		this.countries.remove(country)
	}
}
