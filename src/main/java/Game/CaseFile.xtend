package Game

import People.Villain
import WorldMap.Country
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.Random
import AppModel.ArchiveVillainsAppModel

@Observable
@Accessors
class CaseFile {

	String caseName;
	Villain responsible;
	List<Country> escapePlan;
	String report;
	String stolenObject;
	Country robberyCountry;
	
	ArchiveVillainsAppModel archives = new ArchiveVillainsAppModel;
	Country actualCountry;
	Country lastCountry;
	Country nextCountry;
	List<Country> failedDestinations
	List<Country> criminalDestinations
		
	static val random = new Random
	
	def checkSuspect(Villain villain) {
		return responsible == villain;
	}
	
	new(Villain resp, List<Country> escapePlan, String stolenObject, Country robCountry) {
		this.responsible = resp
		this.escapePlan = escapePlan
		this.stolenObject = stolenObject
		this.robberyCountry = robCountry
	
		this.archives.updateList()
		this.failedDestinations = new ArrayList()
		this.criminalDestinations = new ArrayList()
	}
	
	new(String caseName) {
		this.caseName = caseName
		this.escapePlan = new ArrayList()
		
		this.archives.updateList()
		this.failedDestinations = new ArrayList()
		this.criminalDestinations = new ArrayList()
	}
	
	def addVillain(Villain villain) {
		this.responsible = villain
	}
	
	def addCountryRobbed(Country country) {
		this.robberyCountry = country 
		this.actualCountry = country
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
	
	def setEscapeRoute() {
		var iterationCountries = 2 //randomBetween(5,10)
		var lastCountry = this.robberyCountry
		while(iterationCountries > 0){
			this.addCountryEscape(lastCountry)
			lastCountry.setInformants()
			val next = randomBetween(0, ((lastCountry.connectedCountries.size)-1))
			lastCountry = lastCountry.connectedCountries.get(next)
			iterationCountries--
		}
		this.responsible.setFinalDestination(lastCountry)
	}
	
	def static randomBetween(Integer min, Integer max) {
		val difference = max - min + 1
		random.nextInt(difference) + min
	}
	
	def addfailedDestination(Country country) {
		if(! failedDestinations.contains(country))
			this.failedDestinations.add(country)
	}
	
	def addSuccesfulDestination(Country country) {
		if(! criminalDestinations.contains(country))
			this.criminalDestinations.add(country)
	}
	
}