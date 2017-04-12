package WorldMap

import People.Occupant
import WorldMap.CommonPlace

class Club extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "2 clues about villain signs. 70% 1 clue about hobbies."
	}
	
}