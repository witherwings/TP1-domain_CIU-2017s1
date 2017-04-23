package AppModel

/**
 * Created by lucasf on 4/15/17.
 * Mapamundi con datos de prueba para la vista
 */

import WorldMap.Country
import WorldMap.WorldMap
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class WorldMapAppModel {

    List<Country> countries
    Country selectedCountry

    new () {
    	this.countries = new ArrayList
    }
    
    def getWorldMap(){
    	WorldMap.instance
    }
    
    def updateList(){
    	countries = WorldMap.instance.getCountries()
    }
	
	def addCountry(Country country) {
		WorldMap.instance.addCountry(country)
	}
	
	def removeCountry(Country country){
		WorldMap.instance.removeCountry(country)
	}
	
}