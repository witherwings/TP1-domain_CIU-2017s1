package WorldMap

import WorldMap.CommonPlace
import People.Occupant
import People.Villain

class Embassy extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		return "2 clues about villain destination"
	}
	
	override setInfoOccupant(Villain villano) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}


	override placeName() {
		return "Embajada"
	}
	
}