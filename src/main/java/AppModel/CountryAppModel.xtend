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
	
	new(Country model) {
		this.country = model
		this.places.add(new Bank(new Keeper()))
		this.places.add(new Club(new Keeper()))
		this.places.add(new Embassy(new Keeper()))
		this.places.add(new Library(new Keeper()))
	}
	
}