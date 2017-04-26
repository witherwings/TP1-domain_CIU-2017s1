package AppModel

import WorldMap.CommonPlace
import WorldMap.Country
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList
import WorldMap.Bank
import People.Keeper
import WorldMap.Club
import WorldMap.Embassy
import WorldMap.Library

@Observable
@Accessors
class CountryAppModel {

	Country country
	List<CommonPlace> places = new ArrayList

	String newFeature
	Country newConnection
	CommonPlace newPlace

	String selectedFeature
	Country selectedConnection
	CommonPlace selectedPlace
	List<Country> notConnectedCountries

	new(Country model) {
		this.country = model
		this.notConnectedCountries = getNotConnectedCountries
		this.places = buildPlaces
	}

	def update() {
		this.notConnectedCountries = getNotConnectedCountries()
		this.places = buildPlaces
	}

	def getNotConnectedCountries() {
		var countries = new ArrayList<Country>()
		var connectedCountries = this.country.connectedCountries

		for (i : 0 ..< this.country.map.countries.size) {
			if (!connectedCountries.contains(this.country.map.countries.get(i)))
				countries.add(this.country.map.countries.get(i))
		}

		countries.remove(this.country)

		return countries
	}

	def List<CommonPlace> getBuildPlaces() {
		var newPlaces = new ArrayList

		newPlaces.add(new Bank(new Keeper()))
		newPlaces.add(new Club(new Keeper()))
		newPlaces.add(new Embassy(new Keeper()))
		newPlaces.add(new Library(new Keeper()))

		return newPlaces
	}

}
