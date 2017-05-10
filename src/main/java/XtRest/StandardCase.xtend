package XtRest

import Game.CaseFile
import java.util.List
import WorldMap.Country
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class StandardCase {
	
	int id
	StandardCountryWithoutFeatures pais
	List<String> paisesVisitados
	List<String> paisesFallidos
	
	new(CaseFile caseFile) {
		this.id = caseFile.id
		this.pais = new StandardCountryWithoutFeatures(caseFile.currentCountry)
		this.paisesVisitados = adaptCountries(caseFile.criminalDestinations)
		this.paisesFallidos = adaptCountries(caseFile.failedDestinations)
	}
	
	def adaptCountries(List<Country> countries) {
		val r = new ArrayList<String>()
		
		for (c : 0 ..<countries.size) {
			r.add(countries.get(c).name)
		}
		
		return r
	}
	
} 