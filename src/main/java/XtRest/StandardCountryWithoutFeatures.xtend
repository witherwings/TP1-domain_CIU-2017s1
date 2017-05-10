package XtRest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import WorldMap.CommonPlace
import WorldMap.Country
import java.util.ArrayList

@Accessors
class StandardCountryWithoutFeatures {
	int id 
	String name
	List<String> places
	List<MiniObject> connectedCountries
	
	
	new(WorldMap.Country c) {
		this.id = c.id
		this.name = c.name
		this.places = this.namesPlaces(c.places)
		this.connectedCountries = this.miniCountries(c.connectedCountries)
	
	}
	
	def namesPlaces(List<CommonPlace> places) {
		val r = new ArrayList<String>()
		for (p : places) {
			r.add(p.placeName)
		}
		return r
	}
	
	def miniCountries(List<Country> countries) {
		val r = new ArrayList<MiniObject>()
		for (c : countries) {
			r.add(new MiniObject(c))
		}
		return r
	}
} 