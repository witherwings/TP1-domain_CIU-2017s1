package People

import People.Occupant

class Informant extends Occupant {

	String clue

	new (String clue) {
		this.clue = clue
	}
	
	override setClue(Villain villano){
		this.clue = "I saw a people with "+ villano.getSigns()
	}
	
	override takeAction() {
		//Gives clues depending on the place.
	}
	
	override String getClue() {
		return this.clue
	}
	
}