package Game

import People.Villain
import WorldMap.Country
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Observable
@Accessors
class CaseFile {

	String caseName;
	Villain responsible;
	List<Country> escapePlan;
	String report;
	String stolenObject;
	Country robberyCountry;
	
	def checkSuspect(Villain villain) {
		return responsible == villain;
	}
	
	new(Villain resp, List<Country> escapePlan, String stolenObject, Country robCountry) {
		this.responsible = resp
		this.escapePlan = escapePlan
		this.stolenObject = stolenObject
		this.robberyCountry = robCountry
	}
	
	new(String caseName) {
		this.caseName = caseName
		this.escapePlan = new ArrayList()
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