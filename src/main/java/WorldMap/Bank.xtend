package WorldMap

import People.Occupant
import WorldMap.CommonPlace
import People.Villain
import People.Informant

class Bank extends CommonPlace {

	new (Occupant occupant) {
		super(occupant)
	}
	
	override giveInformation() {
		if(this.occupant.isInformant()){
			return "Vi una persona con "+ this.occupant.getClue() +
			"y se fue para un pais que tiene "+ this.occupant.getClueDestination()
		}
	}
	
	override setInfoOccupant(Villain villano) {
		this.occupant = new Informant(villano)
	}

	override getPlaceName() {
		return "Banco"
	}
	
}