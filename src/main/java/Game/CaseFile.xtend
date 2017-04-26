package Game

import AppModel.ArchiveVillainsAppModel
import People.Villain
import WorldMap.Country
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms

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
	Country currentCountry = null;
	Country lastCountry = null;
	Country nextCountry = null;
	List<Country> failedDestinations
	List<Country> criminalDestinations

	def checkSuspect(Villain villain) {
		return responsible == villain;
	}

	new(Villain resp, List<Country> escapePlan, String stolenObject, Country robCountry) {
		this.responsible = resp
		this.escapePlan = escapePlan
		this.stolenObject = stolenObject
		this.robberyCountry = robCountry
		this.currentCountry = robCountry

		this.archives.updateList()
		this.failedDestinations = new ArrayList()
		this.criminalDestinations = new ArrayList()
	}

	new(String caseName) {
		this.caseName = caseName
		this.escapePlan = new ArrayList()
		this.responsible = new Villain

		this.archives.updateList()
		this.failedDestinations = new ArrayList()
		this.criminalDestinations = new ArrayList()
	}

	def addVillain(Villain villain) {
		this.responsible = villain
	}

	def addCountryRobbed(Country country) {
		this.robberyCountry = country
		this.currentCountry = country
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
		var iterationCountries = 2 //Randoms.randomBetween(3, 9)
		var lastCountry = this.robberyCountry
		while (iterationCountries > 0) {
			this.addCountryEscape(lastCountry)
			lastCountry.setInformants()
			if (iterationCountries == 1) {
				lastCountry.setVillainInPlace(this.responsible)
				iterationCountries--
			} else {
				val next = Randoms.randomBetween(0, ((lastCountry.connectedCountries.size) - 1))
				lastCountry = lastCountry.connectedCountries.get(next)
				iterationCountries--
			}
		}
		this.responsible.setFinalDestination(lastCountry)
	}

	def addfailedDestination(Country country) {
		if (! failedDestinations.contains(country))
			this.failedDestinations.add(country)
	}

	def addSuccesfulDestination(Country country) {
		if (! criminalDestinations.contains(country))
			this.criminalDestinations.add(country)
	}

	def Country getCheckPossibleNextCountry() {
		val connections = this.currentCountry.connectedCountries
		var index = 0
		while (index < connections.size) {
			if (this.escapePlan.contains(connections.get(index)))
				return connections.get(index)
			else
				index++
		}
		null
	}

	/**
	 * retorna el último país de la lista de escape
	 */
	def Country escapePlanFinalCountry() {
		escapePlan.get(escapePlan.size - 1)
	}

}
