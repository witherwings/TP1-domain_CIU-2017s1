package WorldMap

import People.Occupant
import WorldMap.CommonPlace
import People.Villain

class Library extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "1 clue about villain destination and 1 clue about villain signs. 
				50% 1 clue about hobbies."
	}
	
	override setInfoOccupant(Villain villano) {
		occupant.setClue(villano)
	}

	override placeName() {
		return "Libreria"
	}
	
}