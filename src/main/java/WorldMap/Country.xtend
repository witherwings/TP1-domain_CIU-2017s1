package WorldMap

import java.util.List
import java.util.ArrayList
import People.Villain
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Country {
	String name;
	List<String> features;
	List<Country> connectedCountries;
	//There are only 3 places per country
	List<CommonPlace> places;
	
	new (String name)
	{
		this.name = name;
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
	
}