package People

import People.Occupant
import WorldMap.Country
import java.util.List
import java.util.Random

class Informant extends Occupant {

	String clue
	Country destination
	List<String> cluesHobbies
	
	static val random = new Random

	new (Villain villano) {
		this.setClue(villano)
		this.destination = villano.destination
	}
	
	override setClue(Villain villano){
		this.clue = villano.getRandomSign()
		this.cluesHobbies = villano.getHobbies()
	}
	
	override takeAction() {
		//Gives clues depending on the place.
	}
	
	override String getClue() {
		return this.clue
	}
	
	override String getClueDestination() {
		return this.destination.randomFeature
	}
	
	override isInformant() {
		return true
	}
	
	override isKeeper() {
		return false
	}
	
	override getClueHobbies(int porcentaje) {
		if(randomBetween(0, 100) > porcentaje){
			return ". Le gusta en sus tiempos libres "+ this.getRandomHobbies()
		}else{
			return "."
		}
	}
	
	def String getRandomHobbies() {
		return randomIn(this.cluesHobbies)
	}
	
	def static String randomIn(List<String> lista) {
		lista.get(random.nextInt(lista.size))
	}
	
	def static randomBetween(Integer min, Integer max){
		val difference = max - min +1
		random.nextInt(difference) + min
	}
	
}