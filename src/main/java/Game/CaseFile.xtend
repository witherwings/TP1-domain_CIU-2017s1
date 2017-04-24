package Game

import People.Villain
import WorldMap.Country
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import WorldMap.CommonPlace
import java.util.Random

@Observable
@Accessors
class CaseFile {

	String caseName;
	Villain responsible;
	List<Country> escapePlan;
	String report;
	String stolenObject;
	Country robberyCountry;
	
	static val random = new Random
	
	new(Villain resp, List<Country> escapePlan, String stolenObject, Country robCountry) {
		this.responsible = resp
		this.escapePlan = escapePlan
		this.stolenObject = stolenObject
		this.robberyCountry = robCountry
		
		this.startCase()
	}
	
	new(String caseName) {
		this.caseName = caseName
		this.escapePlan = new ArrayList()
		
		this.startCase()
	}
	
	def startCase() {
		//Elige un pais random donde escapar
		//this.responsible.addDestination(this.getRandomDestination())
		//Pais destino: Chile
		this.responsible.addDestination(this.escapePlan.get(0))
		//Se va a ese pais
		this.responsible.destination.visitedFor(this.responsible)
	}
	
	def Country getRandomDestination() {
		return randomIn(this.escapePlan)
	}
	
	def static Country randomIn(List<Country> lista) {
		lista.get(random.nextInt(lista.size))
	}
	
	def checkSuspect(Villain villain) {
		return responsible == villain;
	}
	
	def addVillain(Villain villain) {
		this.responsible = villain
	}
	
	def addCountryRobbed(Country country) {
		this.robberyCountry = country 
	}
	
	def addCountryEscape(Country country) {
		this.escapePlan.add(country)
	}		
	
	def addReport(String report) {
		this.report = report
	}
	
	def addObjectRobbed(String obj) {
		this.stolenObject = obj
	}
}