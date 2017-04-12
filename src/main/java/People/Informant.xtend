package People

import People.Occupant

class Informant extends Occupant {

	String clue

	new (String clue) {
		this.clue = clue
	}
	
	override takeAction() {
		//Gives clues depending on the place.
	}
	
}