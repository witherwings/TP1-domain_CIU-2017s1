package People

import java.util.List
import java.util.ArrayList
import java.util.Random
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import WorldMap.Country
import WorldMap.CommonPlace
import WorldMap.Club
import Game.CaseFile
import utils.Randoms

@Observable
@Accessors
class Villain extends Occupant {
	String name;
	String gender;
	List<String> signs;
	List<String> hobbies;
	Country finalDestination;
	CommonPlace finalPlace;

	new(String name, String gender, List<String> signs, List<String> hobbies) {
		this.name = name;
		this.gender = gender;
		this.signs = signs
		this.hobbies = hobbies
	}

	new(String name) {
		this.name = name
		this.signs = new ArrayList()
		this.hobbies = new ArrayList()
	}

	new() {
		this.name = ""
		this.signs = new ArrayList()
		this.hobbies = new ArrayList()
	}

	def void setGender(String gender) {
		this.gender = gender
	}

	def void addASign(String newSign) {
		this.signs.add(newSign);
	}

	def void addAHobbie(String newHobbie) {
		this.hobbies.add(newHobbie);
	}

	def String getRandomSign() {
		return Randoms.randomIn(this.signs)
	}

	def getRandomHobbie() {
		return Randoms.randomIn(this.hobbies)
	}

	def signsInfo() {
		val result = new ArrayList<String>()
		this.signs.forEach [
			result.add(it)
		]
		return result
	}

	def hobbiesInfo() {
		val result = new ArrayList<String>()
		this.hobbies.forEach [
			result.add(it)
		]
		return result
	}

	def Villain selectedVillain() {
		return this.selectedVillain
	}

	def setFinalDestination(Country finalC) {
		this.finalDestination = finalC
		this.finalPlace = finalC.places.get(Randoms.randomBetween(0, 2))
	}

	def getName() {
		this.name
	}

	override getClue(CaseFile file, CommonPlace place) {
		"ALTO!! Detengase: " + this.name
	}

	override isVillain() { true }

}
