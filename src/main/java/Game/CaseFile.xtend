package Game

import People.Villain
import WorldMap.Country
import java.util.List

class CaseFile {

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
	
}