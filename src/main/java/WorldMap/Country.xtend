package WorldMap

import People.Informant
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms
import People.Villain
import org.uqbar.commons.model.UserException
import XtRest.MiniObject

@Observable
@Accessors
class Country {

	int id 
	WorldMap map
	String name;
	List<String> features;
	List<Country> connectedCountries;
	// There are only 3 places per country
	List<CommonPlace> places;
	

	new(String name, WorldMap map) {
		this.map = map
		this.name = name;
		this.features = new ArrayList()
		this.connectedCountries = new ArrayList();
		this.places = new ArrayList();
	}

	new(WorldMap map) {
		this.map = map
		this.features = new ArrayList()
		this.connectedCountries = new ArrayList();
		this.places = new ArrayList();
	}
	
	def setId(int id) {
		this.id = id 
	}

	def addFeature(String feature) {
		this.features.add(feature)
	}

	def void addCountry(Country newConnection) {
		this.connectedCountries.add(newConnection);
	}

	def void addPlace(CommonPlace newPlace) {
		if (places.size < 3) {
			this.places.add(newPlace);
		} else {
			throw new UserException("No se permiten mas lugares.")
		}
	}

	def getPlaces() {
		return this.places
	}

	def isConnectedTo(Country c) {
		return this.connectedCountries.contains(c)
	}

	def getPlace(int index) {
		return this.places.get(index)
	}

	def connectedCountryNames() {
		val l = new ArrayList<String>()
		this.connectedCountries.forEach [
			l.add(it.name)
		]
		return l
	}
	
	def getFirstPlace(){
		this.getPlace(0)
	}
	
	def getSecondPlace(){
		this.getPlace(1)
	}
	
	def getThirdPlace(){
		this.getPlace(2)
	}
	

	def placesNames() {
		val l = new ArrayList<String>()
		this.places.forEach [
			l.add(it.getPlaceName())
		]
		return l
	}

	def removeSelectedFeature(String string) {
		this.features.remove(string)
	}

	def removeSelectedConnection(Country country) {
		this.connectedCountries.remove(country)
	}

	def removeSelectedPlace(CommonPlace place) {
		this.places.remove(place)
	}

	def setInformants() {
		for (i : 0 ..< places.size) {
			val place = places.get(i)
			place.setOccupant(new Informant())
		}
	}

	def String getRandomFeature() {
		return Randoms.randomIn(this.features)
	}
	
	def setVillainInPlace(Villain villain) {
		val randomPlace = Randoms.randomBetween(0,2)
		this.places.get(randomPlace).setOccupant(villain)
	}
	
	def getMiniCountry() {
		return new MiniObject(this); 
	}

}
