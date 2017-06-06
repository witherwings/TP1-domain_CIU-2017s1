package People

import Game.CaseFile
import WorldMap.CommonPlace
import WorldMap.Country
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.Randoms
import XtRest.MiniObject
import org.apache.commons.lang.StringUtils
import org.apache.commons.lang.ArrayUtils

@Observable
@Accessors
class Villain extends Occupant{
	String name;
	String gender;
	List<String> signs;
	List<String> hobbies;
	Country finalDestination;
	CommonPlace finalPlace;

	new(String name) {
		this.name = name
		this.signs = new ArrayList()
		this.hobbies = new ArrayList()
	}

	new() {
		this.name = null
		this.signs = new ArrayList()
		this.hobbies = new ArrayList()
	}
	
	new(int id, String name, String gender, List<String> signs, List<String> hobbies) {
		this.id = id
		this.name = name 
		this.gender = gender 
		this.signs = signs
		this.hobbies = hobbies 
	}
	
	def void setID(int id){
		this.id = id
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
	
	def getMiniVillain(){
		return new MiniObject(this)
	}
	
	def completeData() {
		return true;
//		return StringUtils.isNotBlank(name) && StringUtils.isNotBlank(gender) &&
//			!ArrayUtils.isEmpty(signs) && !ArrayUtils.isEmpty(hobbies)
	}
	
	def updateV(Villain updVillain) {
		this.id = updVillain.id
		this.name = updVillain.name
		this.gender = updVillain.gender
		this.signs = updVillain.signs
		this.hobbies = updVillain.hobbies
	}

}
