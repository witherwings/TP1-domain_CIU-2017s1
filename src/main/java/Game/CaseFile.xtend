package Game

import People.Villain
import WorldMap.Country
import java.util.List

class CaseFile {
	Villain responsible;
	List<Country> escapePlan;
	String report;
	String objectStolen;
	Country robberyCountry;
	
	def checkSuspect(Villain villain) {
		return responsible == villain;
	}
	
}