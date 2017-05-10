package XtRest

import WorldMap.Country
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class StandardCountry {
	
	int id 
	String name;
	List<String> features;
	List<MiniObject> connectedCountries;
	List<String> places;
	
	new () { }
	
	new(Country c) {
		this.id = c.id
		this.name = c.name 
		this.features = c.features 
		this.connectedCountries = names(c.connectedCountries)
		this.places = new ArrayList
		
		for (i : 0 ..< c.places.size) {
			this.places.add(c.places.get(i).getPlaceName)
		}
	}
	
	def names(List<Country> countries) {
		val r = new ArrayList<MiniObject>()
		
		for (c : 0 ..<countries.size) {
			r.add(new MiniObject(countries.get(c)))
		}
		
		return r
	}
	
	def Country adapt() {
		val namesCC = new ArrayList
		for (c : 0 ..<connectedCountries.size) {
			namesCC.add(connectedCountries.get(c).name)
		}
		return new Country(id, name, features, namesCC, places) 
	}
	
}