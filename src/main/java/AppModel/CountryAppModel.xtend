package AppModel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import WorldMap.Country
import org.uqbar.commons.model.IModel

@Observable
@Accessors
class CountryAppModel {
	
	Country country
	String newFeature
	String selectedFeature
	
	new(Country model) {
		this.country = model
	}
	
}