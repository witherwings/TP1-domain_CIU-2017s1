package WorldMap

import Game.CaseFile
import People.Informant
import People.Villain
import XtRest.MiniObject
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable
import utils.Randoms

@Observable
@Accessors
class Country {

	public int id 
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
	
	new(int id, String name, List<String> features, List<String> connectedCountries, List<String> places) {
		this.id = id 
		this.name = name 
		this.features = features 
		this.map = WorldMap.getInstance 
		this.connectedCountries = new ArrayList<Country>()
		this.places = new ArrayList<CommonPlace>()
		
		for (i : 0 ..< connectedCountries.length) {
			this.connectedCountries.add(
				this.map.countries.findFirst( [ it.name == connectedCountries.get(i) ] )
			)
		}
		
		for (i : 0 ..< places.length) {
			if (places.get(i) == "Embassy" || places.get(i) == "Embajada") 
				this.places.add(new Embassy(null))
			else if (places.get(i) == "Bank" || places.get(i) == "Banco")
				this.places.add(new Bank(null))
			else if (places.get(i) == "Club" || places.get(i) == "Club")
				this.places.add(new Club(null))
			else if (places.get(i) == "Library" || places.get(i) == "Libreria")
				this.places.add(new Library(null))
		}
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
	
	def updateC(Country c) {
		this.name = c.name;
		this.features = c.features;
		this.connectedCountries = c.connectedCountries;
		this.places = c.places;
	}
	
	def completeData() {
		return true;
	}
	
	def CommonPlace getCommonPlace(String placeName) {
		for(CommonPlace cp : this.places){
			if(cp.placeName.toLowerCase == placeName.toLowerCase ){
				return cp
			}
		}
		return null
	}
	
	def String getClueFromPlace(String place, CaseFile cf) {
		var CommonPlace placeC = this.getCommonPlace(place);
		if(placeC != null)
			placeC.getOccupant().getClue(cf,placeC)
		else
			return null
	}
	
}
