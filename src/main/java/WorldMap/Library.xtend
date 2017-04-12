package WorldMap

import People.Occupant
import WorldMap.CommonPlace

class Library extends CommonPlace {

	Occupant occupant

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "1 clue about villain destination and 1 clue about villain signs. 
				50% 1 clue about hobbies."
	}
	
}