package People

import People.Occupant
import WorldMap.Country

class Informant extends Occupant {

	String clue
	Country destination

	new (Villain villano) {
		this.setClue(villano)
		this.destination = villano.destination
	}
	
	override setClue(Villain villano){
		this.clue = villano.getRandomSign()
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
	
}