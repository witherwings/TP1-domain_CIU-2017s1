package WorldMap

import java.util.List
import java.util.ArrayList
import People.Villain
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Random

@Observable
@Accessors
class Country {
	String name;
	List<String> features;
	List<Country> connectedCountries;
	//There are only 3 places per country
	List<CommonPlace> places;
	
	static val random = new Random
	
	new (String name)
	{
		this.name = name;
		this.features = new ArrayList()
		this.connectedCountries = new ArrayList();
		this.places = new ArrayList();
	}
	
	new() {
		this.features = new ArrayList()
		this.connectedCountries = new ArrayList();
		this.places = new ArrayList();
		}
	
	def addFeature(String feature) {
		this.features.add(feature)
	}
	
	def void addCountry(Country newConnection)
	{
		this.connectedCountries.add(newConnection);
	}
	
	def void addPlace(CommonPlace newPlace)
	{
		if(places.size < 3)
		{
			this.places.add(newPlace);
		}
		else
		{
			//throw ("No more places allowed");
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
	
	def visitedFor(Villain villano) {
		for(CommonPlace place : this.places){
			place.setInfoOccupant(villano)
		}
	}

	def connectedCointryNames() {
		val l = new ArrayList<String>()
		this.connectedCountries.forEach [
			l.add(it.name)
		]
		return l
	}

	def placesNames() {
		val l = new ArrayList<String>()
		this.places.forEach [
			l.add(it.getPlaceName())
		]
		return l
	}
	
	def String getRandomFeature() {
		return randomIn(this.features)
	}
	
	def static String randomIn(List<String> lista) {
		lista.get(random.nextInt(lista.size))
	}
	
}