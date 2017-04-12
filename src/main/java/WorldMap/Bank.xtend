package WorldMap

import People.Occupant
import WorldMap.CommonPlace

class Bank extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "1 clue about villain destination and 1 clue about villain signs"
	}
	
}