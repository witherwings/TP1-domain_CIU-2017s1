package WorldMap

import WorldMap.CommonPlace
import People.Occupant

class Embassy extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "2 clues about villain destination"
	}
	
}