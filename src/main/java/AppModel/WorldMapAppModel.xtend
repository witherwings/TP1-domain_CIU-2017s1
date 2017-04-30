package AppModel

/**
 * Created by lucasf on 4/15/17.
 * Mapamundi con datos de prueba para la vista
 */

import WorldMap.Country
import WorldMap.WorldMap
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class WorldMapAppModel {
	
    Country selectedCountry
    
    def getWorldMap(){
    	WorldMap.instance
    }
    
    def updateList(){
    	ObservableUtils.firePropertyChanged(this, "countries")
    	ObservableUtils.firePropertyChanged(this, "selectedCountry")
    }
    
    def getCountries(){
    	WorldMap.instance.getCountries()
    }
	
	def addCountry(Country country) {
		WorldMap.instance.addCountry(country)
	}
	
	def removeCountry(Country country){
		WorldMap.instance.removeCountry(country)
	}
	
	def checkCountryName(String name) {
		for (i : 0 ..< countries.size) {
			if (countries.get(i).name == name)
				return true
		}
		return false
	}
	
}