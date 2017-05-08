package XtRest

import java.util.List
import WorldMap.Country
import WorldMap.CommonPlace
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import WorldMap.WorldMap

@Accessors
class StandardCountry {
	int id 
	String name;
	List<String> features;
	List<String> connectedCountries;
	List<String> places;
	
	new () { }
	
	new(WorldMap.Country c) {
		this.id = c.id
		this.name = c.name 
		this.features = c.features 
		this.connectedCountries = names(c.connectedCountries)
		
		for (i : 0 ..< c.places.length) {
			this.places.add(c.places.get(i).getPlaceName)
		}
	}
	
	def names(List<Country> countries) {
		val r = new ArrayList<String>()
		
		for (c : 0 ..<countries.size) {
			r.add(countries.get(c).name)
		}
		
		return r
	}
	
	def Country adapt() {
		return new Country(id, name, features, connectedCountries, places) 
	}
	
}