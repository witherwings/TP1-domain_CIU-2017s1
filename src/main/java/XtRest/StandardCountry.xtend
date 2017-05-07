package XtRest

import java.util.List
import WorldMap.Country
import WorldMap.CommonPlace
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class StandardCountry {
	int id 
	String name;
	List<String> features;
	List<String> connectedCountries;
	List<CommonPlace> places;
	
	new(WorldMap.Country c) {
		this.id = c.id
		this.name = c.name 
		this.features = c.features 
		this.connectedCountries = names(c.connectedCountries)
		this.places = c.places
	}
	
	def names(List<Country> countries) {
		val r = new ArrayList<String>()
		
		for (c : 0 ..<countries.size) {
			r.add(countries.get(c).name)
		}
		
		return r
	}
	
}